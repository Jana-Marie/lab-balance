/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
  ******************************************************************************
  * @attention
  *
  * <h2><center>&copy; Copyright (c) 2020 STMicroelectronics.
  * All rights reserved.</center></h2>
  *
  * This software component is licensed by ST under BSD 3-Clause license,
  * the "License"; You may not use this file except in compliance with the
  * License. You may obtain a copy of the License at:
  *                        opensource.org/licenses/BSD-3-Clause
  *
  ******************************************************************************
  */
/* USER CODE END Header */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f0xx_hal.h"
/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "usbd_core.h"
#include "usbd_desc.h"
#include "usbd_cdc.h"
#include "usbd_cdc_interface.h"

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */

/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

void HAL_TIM_MspPostInit(TIM_HandleTypeDef *htim);

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define DFU_Pin GPIO_PIN_13
#define DFU_GPIO_Port GPIOC
#define LED_Pin GPIO_PIN_7
#define LED_GPIO_Port GPIOA
#define ACC_INT1_Pin GPIO_PIN_1
#define ACC_INT1_GPIO_Port GPIOB
#define ACC_INT2_Pin GPIO_PIN_2
#define ACC_INT2_GPIO_Port GPIOB
#define ACC_SCL_Pin GPIO_PIN_10
#define ACC_SCL_GPIO_Port GPIOB
#define ACC_SDA_Pin GPIO_PIN_11
#define ACC_SDA_GPIO_Port GPIOB
#define HX_SPS_Pin GPIO_PIN_12
#define HX_SPS_GPIO_Port GPIOB
#define HX_CLK_Pin GPIO_PIN_13
#define HX_CLK_GPIO_Port GPIOB
#define HX_DATA_Pin GPIO_PIN_14
#define HX_DATA_GPIO_Port GPIOB
#define HX_INT_Pin GPIO_PIN_15
#define HX_INT_GPIO_Port GPIOB
#define IPS_RESET_Pin GPIO_PIN_15
#define IPS_RESET_GPIO_Port GPIOA
#define IPS_SCK_Pin GPIO_PIN_3
#define IPS_SCK_GPIO_Port GPIOB
#define IPS_MOSI_Pin GPIO_PIN_5
#define IPS_MOSI_GPIO_Port GPIOB
#define IPS_DC_Pin GPIO_PIN_6
#define IPS_DC_GPIO_Port GPIOB
#define IPS_CS_Pin GPIO_PIN_7
#define IPS_CS_GPIO_Port GPIOB
#define IPS_PWM_Pin GPIO_PIN_8
#define IPS_PWM_GPIO_Port GPIOB
/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */

/************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
