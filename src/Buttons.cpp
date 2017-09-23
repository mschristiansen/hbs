#include <Arduino.h>
#include "HBS.h"

#define SELECT_BUTTON_PIN 2
#define NEXT_BUTTON_PIN 3
#define CLICK 200

void initButtons()
{
  pinMode(SELECT_BUTTON_PIN, INPUT_PULLUP);
  pinMode(NEXT_BUTTON_PIN, INPUT_PULLUP);
}

// "unsigned long" for time values.
unsigned long nextPrevMillis = 0;
unsigned long selectPrevMillis = 0;

void readButtons(struct state *hbs)
{
  unsigned long currentMillis = millis();

  // Using input pullup and therefore 1 unless pressed.
  int next = digitalRead(NEXT_BUTTON_PIN);

  if (currentMillis - nextPrevMillis >= CLICK) {
    // save the last time the button was pressed.
    nextPrevMillis = currentMillis;

    if (!next) {
      if (hbs->selected == HEAT)
	hbs->selected = PUMP;
      else if (hbs->selected == PUMP)
	hbs->selected = HEATER;
      else
	hbs->selected = HEAT;
    }
  }

  int select = digitalRead(SELECT_BUTTON_PIN);

  if (currentMillis - selectPrevMillis >= CLICK) {
    // save the last time the button was pressed.
    selectPrevMillis = currentMillis;

    if (!select) {
      switch(hbs->selected){
      case HEAT :
	hbs->setTemp += 1;
	break;
      case PUMP :
	hbs->pump = hbs->pump == ON ? OFF : ON;
	break;
      case HEATER :
	hbs->heater = hbs->heater == ON ? OFF : ON;
	break;
      }
    }
  }
}
