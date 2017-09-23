/*

  Functions for initialising and sounding the buzzer.

 */

#include <Arduino.h>

#define BUZZERPIN 8
#define INTERVAL 1000

void initBuzzer()
{
  pinMode(BUZZERPIN, OUTPUT);
}

// State of the buzzer.
int buzzerState = LOW;

// "unsigned long" for time values.
unsigned long previousMillis = 0;

void soundBuzzer()
{
  unsigned long currentMillis = millis();

  if (currentMillis - previousMillis >= INTERVAL) {
    // save the last time the buzzer sounded.
    previousMillis = currentMillis;

    // if the BUZZER is off turn it on and vice-versa:
    if (buzzerState == LOW) {
      buzzerState = HIGH;
    } else {
      buzzerState = LOW;
    }
  }

  digitalWrite(BUZZERPIN, buzzerState);
}
