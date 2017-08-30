#ifndef Display_h
#define Display_h
#include <SPI.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

// Initialise the display.
void displayInit();

// Show the temperature.
void displayTemp(float);

#endif
