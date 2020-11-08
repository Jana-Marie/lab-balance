
#include "main.h"
#include "graphics.h"
#include "math.h"
#include "stdlib.h"
#include <stdio.h>
#include "image_header.h"

#define HX_GAIN_128 25
#define HX_GAIN_64  27
#define HX_GAIN_32  26
#define MULTIPLIER (72000000/4000000)

#define DATAFILT 0.99f

I2C_HandleTypeDef hi2c2;

SPI_HandleTypeDef hspi1;
DMA_HandleTypeDef hdma_spi1_tx;

TIM_HandleTypeDef htim1;
TIM_HandleTypeDef htim16;

TSC_HandleTypeDef htsc;
TSC_IOConfigTypeDef IoConfig;

PCD_HandleTypeDef hpcd_USB_FS;

void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_DMA_Init(void);
static void MX_I2C2_Init(void);
static void MX_SPI1_Init(void);
static void MX_TIM1_Init(void);
static void MX_TIM16_Init(void);
static void MX_TSC_Init(void);
static void MX_USB_PCD_Init(void);

void HX_Get_Value(uint8_t gain);
void HX_Delay(uint32_t u);

struct HX711_t{
  int32_t raw_data;
  int32_t raw_data_avg;
  int32_t delta;
  float weight_g;
  int32_t pcs;
  uint8_t gain;
  uint8_t rate;
  uint8_t clock;
  uint8_t is_stable;
} HX711 = {.gain = HX_GAIN_128};

struct cal_t{
  float g_100;
  float g_0;
  float g_cal;
  uint8_t tara_active;
  uint8_t tara_pcs_active;
  float pcs_cal;
} cal = {.g_cal = 50.093f, .g_100 = -701550.0f, .g_0 = -138500.0f, .tara_active = 1, .pcs_cal = 1.0f};
//} cal = {.g_cal = 50.0f, .g_100 = -356620.0f, .g_0 = -138500.0f, .tara_active = 1}; // gain 64
// } cal = {.g_cal = 50.0f, .g_100 = -703400.0f, .g_0 = -138500.0f, .tara_active = 1}; //gain 128

struct touch_t{
  uint8_t button[2];
  uint16_t offset[2];
  uint16_t value[2];
  uint8_t idx_bank;
  uint8_t mode;
  uint8_t new_mode;
} t = {.new_mode = 1};

extern struct IPS_t IPS;

uint32_t start = 0;
uint32_t _ms;

int main(void)
{
  HAL_Init();
  SystemClock_Config();

  MX_GPIO_Init();
  MX_DMA_Init();
  MX_I2C2_Init();
  MX_SPI1_Init();
  MX_TIM1_Init();
  MX_TIM16_Init();
  MX_TSC_Init();
  MX_USB_PCD_Init();

  HAL_GPIO_WritePin(GPIOB,HX_CLK_Pin,0);

  IPS.backlight = 999;
  IPS.update_time = 10;

  IPS_Init();
  HAL_TIM_Base_Start(&htim16);
  HAL_TIM_PWM_Start(&htim16, TIM_CHANNEL_1);
  __HAL_TIM_SET_COMPARE(&htim16, TIM_CHANNEL_1, IPS.backlight);
  IPS_Clear(BLACK);
  IPS.update = HAL_GetTick();

  HAL_TSC_Start_IT(&htsc);

  HAL_TIM_Base_Start(&htim1);
  HAL_TIM_PWM_Start(&htim1, TIM_CHANNEL_1);
  __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, 0);

  while (1)
  {
    if(t.button[1]) {
      cal.tara_active = 1;
      uint8_t cnt = 0;
      while (t.button[1]){
        if(cnt < 200) cnt++;
        HAL_Delay(2);
      }
      if(cnt >= 200){
       cal.tara_active = 0;
       cal.tara_pcs_active = 1;
      }
    }

    if(t.button[0]) {
      while(t.button[0]) {
        HAL_Delay(1);
      }
      t.mode++;
      t.mode = t.mode % 3;
      t.new_mode = 1;
    }

    if(cal.tara_active && t.mode != 2){
      if(abs(HX711.delta) < 30) cal.tara_active++;
      else cal.tara_active = 1;
      if(cal.tara_active > 20){
        cal.g_0 = HX711.raw_data_avg;
        cal.tara_active = 0;
      }
    } else if(cal.tara_active && t.mode == 2){
      if(abs(HX711.delta) < 30) cal.tara_active++;
      else cal.tara_active = 1;
      if(cal.tara_active > 20) {
        cal.g_100 = HX711.raw_data_avg;
        cal.tara_active = 0;
      }
    }

    if (cal.tara_pcs_active){
      cal.pcs_cal = HX711.weight_g;
      cal.tara_pcs_active = 0;
    }

    /*
    if(cal.g_100_active){
      cal.tara_active = 0;
      if(abs(HX711.delta) < 30) cal.g_100_active++;
      else cal.g_100_active = 1;
      if(cal.g_100_active > 20) cal.g_100 = HX711.raw_data_avg;
    }
    */

    if(!HAL_GPIO_ReadPin(GPIOB,HX_INT_Pin)){
      HX_Get_Value(HX711.gain);
      HAL_GPIO_TogglePin(GPIOA, LED_Pin);
      _ms = HAL_GetTick()-start;
      start = HAL_GetTick();

      if(abs(HX711.delta) <= 2 && (int)((HX711.weight_g-(int)HX711.weight_g)*1000.0f) == 0){
        cal.g_0 -= HX711.delta;
      } else if(abs(HX711.delta) <= 2) {
        cal.g_0 -= HX711.delta;
        cal.g_100 -= HX711.delta;
      }

    } else {
      HAL_Delay(1);
      HAL_GPIO_WritePin(GPIOB,HX_SPS_Pin, HX711.rate);
    }



    if(HAL_GetTick() + IPS.update_time > IPS.update){
      if(HX711.weight_g > -99.9 && HX711.weight_g < 99.9){
        if(t.mode == 0){
          sprintf(IPS.buf,"%c%02d.%03dg", HX711.weight_g >= -0.001 ? ' ' : '-' , abs((int)HX711.weight_g), abs((int)((HX711.weight_g-(int)HX711.weight_g)*1000.0f)));
          IPS_DrawString_Buf(0, 0, IPS.buf, 8, &Font24, BLACK, WHITE);
          IPS_WriteBuf(10,45);
        } else if (t.mode == 1){
          sprintf(IPS.buf,"%c%04dpcs", HX711.weight_g >= -0.001 ? ' ' : '-' , abs((int)roundf(HX711.weight_g / cal.pcs_cal)));
          IPS_DrawString_Buf(0, 0, IPS.buf, 8, &Font24, BLACK, WHITE);
          IPS_WriteBuf(10,45);
        } else if (t.mode == 2){
          sprintf(IPS.buf,"%07d", HX711.raw_data_avg);
          IPS_DrawString_Buf(0, 0, IPS.buf, 8, &Font24, BLACK, WHITE);
          IPS_WriteBuf(10,45);
        }
      } else {
        sprintf(IPS.buf,"  max!  ");
        IPS_DrawString_Buf(0, 0, IPS.buf, 8, &Font24, BLACK, WHITE);
        IPS_WriteBuf(10,45);
      }
      HAL_Delay(4);
      if(t.new_mode == 1){
        if      (t.mode == 0) IPS_WriteBitmap(5 , 5, gram, 32, 20);
        else if (t.mode == 1) IPS_WriteBitmap(5 , 5, cnt, 32, 20);
        else if (t.mode == 2) IPS_WriteBitmap(5 , 5, cal_n, 32, 20);
        t.new_mode = 0;
      } else {
        IPS_WriteBitmap(116, 8, HX711.is_stable == 1 ? tara_green : tara_red, 32, 20);
      }
      IPS.update = HAL_GetTick();
    }
  }
}

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

void HX_Get_Value(uint8_t gain) {

  int32_t last_data = HX711.raw_data_avg;
  HX711.raw_data = 0;

  for(int i = 0; i < gain; i++){
    HAL_GPIO_WritePin(GPIOB,HX_CLK_Pin,1);
    HX_Delay(2);
    HAL_GPIO_WritePin(GPIOB,HX_CLK_Pin,0);
    if(i < 24){
      HX711.raw_data |= (HAL_GPIO_ReadPin(GPIOB,HX_DATA_Pin) << (24 - i));
    }
    if (HX711.raw_data & 0x00800000) HX711.raw_data |= 0xFF000000 ;
    HX_Delay(2);
  }

  if(abs(HX711.delta) > 1000) {
    HX711.rate = 1;
    HX711.raw_data_avg = HX711.raw_data;
    HX711.is_stable = 0;
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, 0);
  }
  else if(abs(HX711.delta) > 20) {
    HX711.rate = 0;
    HX711.raw_data_avg = HX711.raw_data;
    HX711.is_stable = 0;
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, 0);
  }
  else {
    HX711.rate = 0;
    HX711.is_stable = 1;
    __HAL_TIM_SET_COMPARE(&htim1, TIM_CHANNEL_1, 50);
  }


  HX711.raw_data_avg = (HX711.raw_data_avg * DATAFILT + (HX711.raw_data * (1.0f - DATAFILT)));
  HX711.delta = last_data - HX711.raw_data_avg;
  HX711.weight_g = (cal.g_cal*((HX711.raw_data_avg-cal.g_0)/(cal.g_100-cal.g_0)));
}

void HX_Delay(uint32_t u) {
    u = u * MULTIPLIER - 10;
    while (u--);
}

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

void TSC_task(void) {
  if (HAL_TSC_GroupGetStatus(&htsc, TSC_GROUP1_IDX) == TSC_GROUP_COMPLETED) {
    t.value[t.idx_bank] = HAL_TSC_GroupGetValue(&htsc, TSC_GROUP1_IDX);
    HAL_TSC_IOConfig(&htsc, &IoConfig);
    HAL_TSC_IODischarge(&htsc, ENABLE);
    __HAL_TSC_CLEAR_FLAG(&htsc, (TSC_FLAG_EOA | TSC_FLAG_MCE));
    HAL_TSC_Start_IT(&htsc);
    if(t.value[t.idx_bank] < 3000) t.button[t.idx_bank] = 1;
    else t.button[t.idx_bank] = 0;
  }


  switch (t.idx_bank)
  {
  case 0:
    IoConfig.ChannelIOs = TSC_GROUP1_IO2;
    t.idx_bank = 1;
    break;
  case 1:
    IoConfig.ChannelIOs = TSC_GROUP1_IO3;
    t.idx_bank = 0;
    break;
  default:
    break;
  }
}
/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/


void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};

  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI48;
  RCC_OscInitStruct.HSI48State = RCC_HSI48_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;
  HAL_RCC_OscConfig(&RCC_OscInitStruct);

  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_HSI48;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;
  HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_1);

  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_USB;
  PeriphClkInit.UsbClockSelection = RCC_USBCLKSOURCE_HSI48;
  HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit);
}

static void MX_I2C2_Init(void)
{
  hi2c2.Instance = I2C2;
  hi2c2.Init.Timing = 0x20303E5D;
  hi2c2.Init.OwnAddress1 = 0;
  hi2c2.Init.AddressingMode = I2C_ADDRESSINGMODE_7BIT;
  hi2c2.Init.DualAddressMode = I2C_DUALADDRESS_DISABLE;
  hi2c2.Init.OwnAddress2 = 0;
  hi2c2.Init.OwnAddress2Masks = I2C_OA2_NOMASK;
  hi2c2.Init.GeneralCallMode = I2C_GENERALCALL_DISABLE;
  hi2c2.Init.NoStretchMode = I2C_NOSTRETCH_DISABLE;
  HAL_I2C_Init(&hi2c2);
  HAL_I2CEx_ConfigAnalogFilter(&hi2c2, I2C_ANALOGFILTER_ENABLE);
  HAL_I2CEx_ConfigDigitalFilter(&hi2c2, 0);
}

static void MX_SPI1_Init(void)
{
  hspi1.Instance = SPI1;
  hspi1.Init.Mode = SPI_MODE_MASTER;
  hspi1.Init.Direction = SPI_DIRECTION_2LINES;
  hspi1.Init.DataSize = SPI_DATASIZE_8BIT;
  hspi1.Init.CLKPolarity = SPI_POLARITY_LOW;
  hspi1.Init.CLKPhase = SPI_PHASE_1EDGE;
  hspi1.Init.NSS = SPI_NSS_SOFT;
  hspi1.Init.BaudRatePrescaler = SPI_BAUDRATEPRESCALER_2;
  hspi1.Init.FirstBit = SPI_FIRSTBIT_MSB;
  hspi1.Init.TIMode = SPI_TIMODE_DISABLE;
  hspi1.Init.CRCCalculation = SPI_CRCCALCULATION_DISABLE;
  hspi1.Init.CRCPolynomial = 7;
  hspi1.Init.CRCLength = SPI_CRC_LENGTH_DATASIZE;
  hspi1.Init.NSSPMode = SPI_NSS_PULSE_ENABLE;
  HAL_SPI_Init(&hspi1);
}

static void MX_TIM1_Init(void)
{
  TIM_ClockConfigTypeDef sClockSourceConfig = {0};
  TIM_MasterConfigTypeDef sMasterConfig = {0};
  TIM_OC_InitTypeDef sConfigOC = {0};
  TIM_BreakDeadTimeConfigTypeDef sBreakDeadTimeConfig = {0};

  htim1.Instance = TIM1;
  htim1.Init.Prescaler = 0;
  htim1.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim1.Init.Period = 10;
  htim1.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim1.Init.RepetitionCounter = 0;
  htim1.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_DISABLE;
  HAL_TIM_Base_Init(&htim1);

  sClockSourceConfig.ClockSource = TIM_CLOCKSOURCE_INTERNAL;
  HAL_TIM_ConfigClockSource(&htim1, &sClockSourceConfig);
  HAL_TIM_PWM_Init(&htim1);

  sMasterConfig.MasterOutputTrigger = TIM_TRGO_RESET;
  sMasterConfig.MasterSlaveMode = TIM_MASTERSLAVEMODE_DISABLE;
  HAL_TIMEx_MasterConfigSynchronization(&htim1, &sMasterConfig);

  sConfigOC.OCMode = TIM_OCMODE_PWM1;
  sConfigOC.Pulse = 50;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCNPolarity = TIM_OCNPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
  sConfigOC.OCIdleState = TIM_OCIDLESTATE_RESET;
  sConfigOC.OCNIdleState = TIM_OCNIDLESTATE_RESET;
  HAL_TIM_PWM_ConfigChannel(&htim1, &sConfigOC, TIM_CHANNEL_1);

  sBreakDeadTimeConfig.OffStateRunMode = TIM_OSSR_DISABLE;
  sBreakDeadTimeConfig.OffStateIDLEMode = TIM_OSSI_DISABLE;
  sBreakDeadTimeConfig.LockLevel = TIM_LOCKLEVEL_OFF;
  sBreakDeadTimeConfig.DeadTime = 0;
  sBreakDeadTimeConfig.BreakState = TIM_BREAK_DISABLE;
  sBreakDeadTimeConfig.BreakPolarity = TIM_BREAKPOLARITY_HIGH;
  sBreakDeadTimeConfig.AutomaticOutput = TIM_AUTOMATICOUTPUT_DISABLE;
  HAL_TIMEx_ConfigBreakDeadTime(&htim1, &sBreakDeadTimeConfig);
  HAL_TIM_MspPostInit(&htim1);
}

static void MX_TIM16_Init(void)
{
  TIM_OC_InitTypeDef sConfigOC = {0};
  TIM_BreakDeadTimeConfigTypeDef sBreakDeadTimeConfig = {0};

  htim16.Instance = TIM16;
  htim16.Init.Prescaler = 10;
  htim16.Init.CounterMode = TIM_COUNTERMODE_UP;
  htim16.Init.Period = 1000;
  htim16.Init.ClockDivision = TIM_CLOCKDIVISION_DIV1;
  htim16.Init.RepetitionCounter = 0;
  htim16.Init.AutoReloadPreload = TIM_AUTORELOAD_PRELOAD_ENABLE;
  HAL_TIM_Base_Init(&htim16);
  HAL_TIM_PWM_Init(&htim16);

  sConfigOC.OCMode = TIM_OCMODE_PWM1;
  sConfigOC.Pulse = 100;
  sConfigOC.OCPolarity = TIM_OCPOLARITY_HIGH;
  sConfigOC.OCNPolarity = TIM_OCNPOLARITY_HIGH;
  sConfigOC.OCFastMode = TIM_OCFAST_DISABLE;
  sConfigOC.OCIdleState = TIM_OCIDLESTATE_RESET;
  sConfigOC.OCNIdleState = TIM_OCNIDLESTATE_RESET;
  HAL_TIM_PWM_ConfigChannel(&htim16, &sConfigOC, TIM_CHANNEL_1);

  sBreakDeadTimeConfig.OffStateRunMode = TIM_OSSR_DISABLE;
  sBreakDeadTimeConfig.OffStateIDLEMode = TIM_OSSI_DISABLE;
  sBreakDeadTimeConfig.LockLevel = TIM_LOCKLEVEL_OFF;
  sBreakDeadTimeConfig.DeadTime = 0;
  sBreakDeadTimeConfig.BreakState = TIM_BREAK_DISABLE;
  sBreakDeadTimeConfig.BreakPolarity = TIM_BREAKPOLARITY_HIGH;
  sBreakDeadTimeConfig.AutomaticOutput = TIM_AUTOMATICOUTPUT_DISABLE;
  HAL_TIMEx_ConfigBreakDeadTime(&htim16, &sBreakDeadTimeConfig);
  HAL_TIM_MspPostInit(&htim16);
}

static void MX_TSC_Init(void)
{

  htsc.Instance = TSC;
  htsc.Init.CTPulseHighLength = TSC_CTPH_1CYCLE;
  htsc.Init.CTPulseLowLength = TSC_CTPL_1CYCLE;
  htsc.Init.SpreadSpectrum = ENABLE;
  htsc.Init.SpreadSpectrumDeviation = 32;
  htsc.Init.SpreadSpectrumPrescaler = TSC_SS_PRESC_DIV1;
  htsc.Init.PulseGeneratorPrescaler = TSC_PG_PRESC_DIV4;
  htsc.Init.MaxCountValue = TSC_MCV_16383;
  htsc.Init.IODefaultMode = TSC_IODEF_OUT_PP_LOW;
  htsc.Init.SynchroPinPolarity = TSC_SYNC_POLARITY_FALLING;
  htsc.Init.AcquisitionMode = TSC_ACQ_MODE_NORMAL;
  htsc.Init.MaxCountInterrupt = DISABLE;
  htsc.Init.ChannelIOs = TSC_GROUP1_IO2|TSC_GROUP1_IO3;
  htsc.Init.ShieldIOs = 0;
  htsc.Init.SamplingIOs = TSC_GROUP1_IO1;
  HAL_TSC_Init(&htsc);

  IoConfig.ChannelIOs  = TSC_GROUP1_IO2; // Start with the first channel
  IoConfig.SamplingIOs = TSC_GROUP1_IO1;
  IoConfig.ShieldIOs   = 0;
  HAL_TSC_IOConfig(&htsc, &IoConfig);

}

static void MX_USB_PCD_Init(void)
{
  hpcd_USB_FS.Instance = USB;
  hpcd_USB_FS.Init.dev_endpoints = 8;
  hpcd_USB_FS.Init.speed = PCD_SPEED_FULL;
  hpcd_USB_FS.Init.phy_itface = PCD_PHY_EMBEDDED;
  hpcd_USB_FS.Init.low_power_enable = DISABLE;
  hpcd_USB_FS.Init.lpm_enable = DISABLE;
  hpcd_USB_FS.Init.battery_charging_enable = DISABLE;
  HAL_PCD_Init(&hpcd_USB_FS);
}

static void MX_DMA_Init(void)
{

  __HAL_RCC_DMA1_CLK_ENABLE();

  HAL_NVIC_SetPriority(DMA1_Channel2_3_IRQn, 0, 0);
  HAL_NVIC_EnableIRQ(DMA1_Channel2_3_IRQn);
}

static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};

  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();

  HAL_GPIO_WritePin(GPIOA, LED_Pin|IPS_RESET_Pin, GPIO_PIN_RESET);
  HAL_GPIO_WritePin(GPIOB, HX_SPS_Pin|HX_CLK_Pin|IPS_DC_Pin|IPS_CS_Pin, GPIO_PIN_RESET);

  GPIO_InitStruct.Pin = DFU_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(DFU_GPIO_Port, &GPIO_InitStruct);

  GPIO_InitStruct.Pin = LED_Pin|IPS_RESET_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  GPIO_InitStruct.Pin = ACC_INT1_Pin|ACC_INT2_Pin|HX_INT_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_RISING;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

  GPIO_InitStruct.Pin = HX_SPS_Pin|HX_CLK_Pin|IPS_DC_Pin|IPS_CS_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

  GPIO_InitStruct.Pin = HX_DATA_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(HX_DATA_GPIO_Port, &GPIO_InitStruct);
}

void Error_Handler(){
  while(1){
    HAL_GPIO_TogglePin(GPIOA, LED_Pin);
    HAL_Delay(100);
  }
}
