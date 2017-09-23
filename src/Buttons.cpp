#include <Arduino.h>
#include "HBS.h"

#define SELECT_BUTTON_PIN 2
#define NEXT_BUTTON_PIN 3
#define PERIOD 200

void initButtons()
{
  pinMode(SELECT_BUTTON_PIN, INPUT_PULLUP);
  pinMode(NEXT_BUTTON_PIN, INPUT_PULLUP);
}

// State of the "next" button.
int nextState = LOW;

// "unsigned long" for time values.
unsigned long nextPrevMillis = 0;


void readButtons(struct state *hbs)
{
  // Using input pullup and therefore 1 unless pressed.
  int next = digitalRead(NEXT_BUTTON_PIN);

  unsigned long currentMillis = millis();

  if (currentMillis - nextPrevMillis >= PERIOD) {
    // save the last time the buzzer sounded.
    nextPrevMillis = currentMillis;

    if (!next)
      hbs->selected = hbs->selected == 1 ? 0 : 1;

  }

}
