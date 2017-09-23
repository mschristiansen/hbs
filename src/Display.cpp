/*

  Functions for initialising and updating the display.

 */

#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include "HBS.h"

#define OLED_RESET 4
Adafruit_SSD1306 display(OLED_RESET);

#if (SSD1306_LCDHEIGHT != 32)
#error("Height incorrect, please fix Adafruit_SSD1306.h!");
#endif

void displayInit()
{
  // initialize with the I2C addr 0x3C (for the 128x32)
  display.begin(SSD1306_SWITCHCAPVCC, 0x3C);
}

void displayUpdate(const struct state d)
{
  // Display text in size 1 giving four rows of text.
  display.setTextSize(1);
  display.setTextColor(WHITE);
  display.setCursor(0,0);
  display.clearDisplay();

  // First row.
  display.print(d.selected == TEMPERATURE ? "*" : " ");
  display.print(" Temp: ");
  display.print(d.actualTemp, 1);
  display.print("/");
  display.println(d.setTemp, 1);

  // Second row.
  display.print(d.selected == PUMP ? "*" : " ");
  display.print(" Pump: ");
  display.println( d.pump ? "on" : "off" );

  // Third row.
  display.print("  Heat: ");
  display.print(d.heater);
  display.println("%");

  display.display();
}
