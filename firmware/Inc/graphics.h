#ifndef __GRAPHICS_H
#define __GRAPHICS_H

#include "fonts.h"
#include "main.h"

#define IPS_WIDTH   160
#define IPS_HEIGHT  80

#define WHITE					0xFFFF
#define BLACK					0x0000
#define BLUE 					0x001F
#define BRED 					0XF81F
#define GRED 					0XFFE0
#define GBLUE					0X07FF
#define RED  					0xF800
#define MAGENTA				0xF81F
#define GREEN					0x07E0
#define CYAN 					0x7FFF
#define YELLOW				0xFFE0
#define BROWN					0XBC40
#define BRRED					0XFC07
#define GRAY 					0X8430
#define DARKBLUE			0X01CF
#define LIGHTBLUE			0X7D7C
#define GRAYBLUE      0X5458
#define LIGHTGREEN    0X841F
#define LGRAY 			  0XC618
#define LGRAYBLUE     0XA651
#define LBBLUE        0X2B12

#define IMAGE_BACKGROUND    WHITE
#define FONT_FOREGROUND     BLACK
#define FONT_BACKGROUND     GREEN

struct IPS_t{
  uint16_t backlight;
  char buf[8];
  uint16_t text_buf[24*(17*8)];
  uint8_t update;
  uint8_t update_time;
} IPS;

extern SPI_HandleTypeDef hspi1;

void IPS_Reset(void);
void IPS_WriteData_Byte(uint8_t data);
void IPS_WriteData_Word(uint16_t data);
void IPS_WriteReg(uint8_t data);
void IPS_Init(void);
void IPS_Clear(uint16_t Color);
void IPS_SetCursor(uint16_t Xstart, uint16_t Ystart, uint16_t Xend, uint16_t  Yend);


void IPS_DrawString(uint16_t Xstart, uint16_t Ystart, const char * pString, sFONT* Font, uint16_t Color_Background, uint16_t Color_Foreground);
void IPS_DrawChar(uint16_t Xpoint, uint16_t Ypoint, const char Acsii_Char, sFONT* Font, uint16_t Color_Background, uint16_t Color_Foreground);
void IPS_SetPixel(uint16_t Xpoint, uint16_t Ypoint, uint16_t Color);
void IPS_SetUWORD(uint16_t x, uint16_t y, uint16_t Color);

#endif
