#include "graphics.h"


/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/

void IPS_DrawString_Buf(uint16_t x, uint16_t y, const char * pString, uint8_t len, sFONT* Font, uint16_t Color_Background, uint16_t Color_Foreground)
{
  uint16_t _x = x;
  uint16_t _y = y;

  if (x > IPS_WIDTH-1 || y > IPS_HEIGHT-1) return;

  while (* pString != '\0') {
    if ((_x + Font->Width ) > IPS_WIDTH-1 ) {
      _x = x;
      _y += Font->Height;
    }
    if ((_y  + Font->Height ) > IPS_HEIGHT-1 ) {
      _x = x;
      _y = y;
    }

    IPS_DrawChar_Buf(_x, _y, * pString, Font, Color_Background, Color_Foreground);

    pString++;

    _x += Font->Width;
  }
}

void IPS_DrawChar_Buf(uint16_t x, uint16_t y, const char c, sFONT* Font, uint16_t Color_Background, uint16_t Color_Foreground)
{
  uint16_t Page, Column;

  if (x > IPS_WIDTH-1 || y > IPS_HEIGHT-1) return;

  uint32_t Char_Offset = (c - ' ') * Font->Height * (Font->Width / 8 + (Font->Width % 8 ? 1 : 0));
  const unsigned char *ptr = &Font->table[Char_Offset];

  for (Page = 0; Page < Font->Height; Page ++ ) {
    for (Column = 0; Column < Font->Width; Column ++ ) {
      if (*ptr & (0x80 >> (Column % 8))) IPS_SetPixel_buf(x + Column, y + Page, Color_Foreground);
      else IPS_SetPixel_buf(x + Column, y + Page, Color_Background);
      if (Column % 8 == 7) ptr++;
    }
    if (Font->Width % 8 != 0) ptr++;
  }
}

void IPS_SetPixel_buf(uint16_t Xpoint, uint16_t Ypoint, uint16_t Color)
{
		IPS.text_buf[((((17*8))-Xpoint) + ((23 - Ypoint)*(17*8)))] = Color;
}

void IPS_WriteBuf(uint16_t x, uint16_t y)
{
	IPS_SetCursor(x,y,x+(17*8)-1,y+24-1);
  HAL_GPIO_WritePin(IPS_CS_GPIO_Port, IPS_CS_Pin, 0);
  HAL_GPIO_WritePin(IPS_DC_GPIO_Port, IPS_DC_Pin, 1);
	HAL_SPI_Transmit_DMA(&hspi1, (uint8_t *)&IPS.text_buf, ((24*(17*8))*2)-1);
}

void IPS_WriteBitmap(uint16_t x, uint16_t y, uint16_t* bmp, uint16_t size_x, uint16_t size_y)
{
	IPS_SetCursor(x,y,x+size_x-1,y+size_y-1);
  HAL_GPIO_WritePin(IPS_CS_GPIO_Port, IPS_CS_Pin, 0);
  HAL_GPIO_WritePin(IPS_DC_GPIO_Port, IPS_DC_Pin, 1);
	HAL_SPI_Transmit_DMA(&hspi1, (uint8_t *)bmp, ((size_y*size_x)*2)-1);
}

void IPS_DrawString_R(uint16_t x, uint16_t y, const char * pString, uint8_t len, sFONT* Font, uint16_t Color_Background, uint16_t Color_Foreground )
{
  x -= (Font->Width*len);

}

void IPS_DrawString(uint16_t x, uint16_t y, const char * pString, sFONT* Font, uint16_t Color_Background, uint16_t Color_Foreground )
{
  uint16_t _x = x;
  uint16_t _y = y;

  if (x > IPS_WIDTH-1 || y > IPS_HEIGHT-1) return;

  while (* pString != '\0') {
  if ((_x + Font->Width ) > IPS_WIDTH-1 ) {
  _x = x;
  _y += Font->Height;
  }

  if ((_y  + Font->Height ) > IPS_HEIGHT-1 ) {
  _x = x;
  _y = y;
  }

  IPS_DrawChar(_x, _y, * pString, Font, Color_Background, Color_Foreground);

  pString ++;

  _x += Font->Width;
  }
}

void IPS_DrawChar(uint16_t x, uint16_t y, const char c, sFONT* Font, uint16_t Color_Background, uint16_t Color_Foreground)
{
  uint16_t Page, Column;

  if (x > IPS_WIDTH-1 || y > IPS_HEIGHT-1) return;

  uint32_t Char_Offset = (c - ' ') * Font->Height * (Font->Width / 8 + (Font->Width % 8 ? 1 : 0));
  const unsigned char *ptr = &Font->table[Char_Offset];

  for (Page = 0; Page < Font->Height; Page ++ ) {
    for (Column = 0; Column < Font->Width; Column ++ ) {

    if (FONT_BACKGROUND == Color_Background) {
      if (*ptr & (0x80 >> (Column % 8))) IPS_SetPixel(x + Column, y + Page, Color_Foreground);
    } else {
      if (*ptr & (0x80 >> (Column % 8))) IPS_SetPixel(x + Column, y + Page, Color_Foreground);
      else IPS_SetPixel(x + Column, y + Page, Color_Background);
      }
    if (Column % 8 == 7) ptr++;
    }
    if (Font->Width % 8 != 0) ptr++;
  }
}

void IPS_SetPixel(uint16_t Xpoint, uint16_t Ypoint, uint16_t Color)
{
  if(Xpoint > IPS_WIDTH-1 || Ypoint > IPS_HEIGHT-1) return;
  IPS_SetUWORD((IPS_WIDTH-1 - Xpoint - 1), (IPS_HEIGHT-1 - Ypoint - 1), Color);
}

void IPS_SetUWORD(uint16_t x, uint16_t y, uint16_t Color)
{
	IPS_SetCursor(x,y,x,y);
	IPS_WriteData_Word(Color);
}

void IPS_SetCursor(uint16_t Xstart, uint16_t Ystart, uint16_t Xend, uint16_t  Yend)
{
	Xstart = Xstart + 1;
	Xend = Xend + 1;
	Ystart = Ystart + 26;
	Yend = Yend+26;
	IPS_WriteReg(0x2a);
	IPS_WriteData_Byte(Xstart>>8);
	IPS_WriteData_Byte(Xstart);
	IPS_WriteData_Byte(Xend >>8);
	IPS_WriteData_Byte(Xend );

	IPS_WriteReg(0x2b);
	IPS_WriteData_Byte(Ystart>>8);
	IPS_WriteData_Byte(Ystart);
	IPS_WriteData_Byte(Yend>>8);
	IPS_WriteData_Byte(Yend);

	IPS_WriteReg(0x2C);
}

void IPS_Clear(uint16_t Color)
{
  IPS_SetCursor(0, 0, IPS_WIDTH-1, IPS_HEIGHT-1);
  for(uint16_t i = 0; i < IPS_WIDTH; i++){
    for(uint16_t j = 0; j < IPS_HEIGHT; j++){
      IPS_WriteData_Word(Color);
    }
  }
}

void IPS_Reset(void)
{
	HAL_GPIO_WritePin(IPS_CS_GPIO_Port, IPS_CS_Pin,0);
	HAL_Delay(20);
	HAL_GPIO_WritePin(IPS_RESET_GPIO_Port, IPS_RESET_Pin,0);
	HAL_Delay(20);
	HAL_GPIO_WritePin(IPS_RESET_GPIO_Port, IPS_RESET_Pin,1);
	HAL_Delay(20);
}

void IPS_WriteData_Byte(uint8_t data)
{
	HAL_GPIO_WritePin(IPS_CS_GPIO_Port, IPS_CS_Pin, 0);
	HAL_GPIO_WritePin(IPS_DC_GPIO_Port, IPS_DC_Pin, 1);
	HAL_SPI_Transmit_DMA(&hspi1, (uint8_t *)&data, 1);
}

 void IPS_WriteData_Word(uint16_t data)
{
	HAL_GPIO_WritePin(IPS_CS_GPIO_Port, IPS_CS_Pin, 0);
	HAL_GPIO_WritePin(IPS_DC_GPIO_Port, IPS_DC_Pin, 1);
	HAL_SPI_Transmit_DMA(&hspi1, (uint8_t *)&data, 2);
}

void IPS_WriteReg(uint8_t data)
{
	HAL_GPIO_WritePin(IPS_CS_GPIO_Port, IPS_CS_Pin, 0);
	HAL_GPIO_WritePin(IPS_DC_GPIO_Port, IPS_DC_Pin, 0);
	HAL_SPI_Transmit_DMA(&hspi1, (uint8_t *)&data, 1);
}

void IPS_Init(void)
{
	IPS_Reset();

	IPS_WriteReg(0x11);//Sleep exit
	HAL_Delay (120);

  IPS_WriteReg(0x21);
  IPS_WriteReg(0x21);

  IPS_WriteReg(0xB1);
  IPS_WriteData_Byte(0x05);
  IPS_WriteData_Byte(0x3A);
  IPS_WriteData_Byte(0x3A);

  IPS_WriteReg(0xB2);
  IPS_WriteData_Byte(0x05);
  IPS_WriteData_Byte(0x3A);
  IPS_WriteData_Byte(0x3A);

  IPS_WriteReg(0xB3);
  IPS_WriteData_Byte(0x05);
  IPS_WriteData_Byte(0x3A);
  IPS_WriteData_Byte(0x3A);
  IPS_WriteData_Byte(0x05);
  IPS_WriteData_Byte(0x3A);
  IPS_WriteData_Byte(0x3A);

  IPS_WriteReg(0xB4);
  IPS_WriteData_Byte(0x03);

  IPS_WriteReg(0xC0);
  IPS_WriteData_Byte(0x62);
  IPS_WriteData_Byte(0x02);
  IPS_WriteData_Byte(0x04);

  IPS_WriteReg(0xC1);
  IPS_WriteData_Byte(0xC0);

  IPS_WriteReg(0xC2);
  IPS_WriteData_Byte(0x0D);
  IPS_WriteData_Byte(0x00);

  IPS_WriteReg(0xC3);
  IPS_WriteData_Byte(0x8D);
  IPS_WriteData_Byte(0x6A);

  IPS_WriteReg(0xC4);
  IPS_WriteData_Byte(0x8D);
  IPS_WriteData_Byte(0xEE);

  IPS_WriteReg(0xC5);
  IPS_WriteData_Byte(0x0E);

  IPS_WriteReg(0xE0);
  IPS_WriteData_Byte(0x10);
  IPS_WriteData_Byte(0x0E);
  IPS_WriteData_Byte(0x02);
  IPS_WriteData_Byte(0x03);
  IPS_WriteData_Byte(0x07);
  IPS_WriteData_Byte(0x0E);
  IPS_WriteData_Byte(0x07);
  IPS_WriteData_Byte(0x02);
  IPS_WriteData_Byte(0x0A);
  IPS_WriteData_Byte(0x12);
  IPS_WriteData_Byte(0x27);
  IPS_WriteData_Byte(0x37);
  IPS_WriteData_Byte(0x00);
  IPS_WriteData_Byte(0x0D);
  IPS_WriteData_Byte(0x0E);
  IPS_WriteData_Byte(0x10);

  IPS_WriteReg(0xE1);
  IPS_WriteData_Byte(0x10);
  IPS_WriteData_Byte(0x0E);
  IPS_WriteData_Byte(0x03);
  IPS_WriteData_Byte(0x03);
  IPS_WriteData_Byte(0x0F);
  IPS_WriteData_Byte(0x06);
  IPS_WriteData_Byte(0x02);
  IPS_WriteData_Byte(0x08);
  IPS_WriteData_Byte(0x0A);
  IPS_WriteData_Byte(0x13);
  IPS_WriteData_Byte(0x26);
  IPS_WriteData_Byte(0x36);
  IPS_WriteData_Byte(0x00);
  IPS_WriteData_Byte(0x0D);
  IPS_WriteData_Byte(0x0E);
  IPS_WriteData_Byte(0x10);

  IPS_WriteReg(0x3A);
  IPS_WriteData_Byte(0x05);

  IPS_WriteReg(0x36);
  IPS_WriteData_Byte(0xA8);

  IPS_WriteReg(0x29);
}
