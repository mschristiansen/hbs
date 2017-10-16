#include <Arduino.h>
#include "HBS.h"

unsigned long controllerPrevMillis = 0;
int pwm = 0; // Value for pulse-width-modulation (PWM)

// Slowly lower output from heater as error gets smaller.
int calcpwm(double error)
{
  if (error > 5)
    return 255;
  else if (error > 2)
    return 127;
  else if (error >= 0)
    return 64;
  else if (error < 0)
    return 0;
}


int controller(double error)
{
  unsigned long currentMillis = millis();

  if (currentMillis - controllerPrevMillis >= 1000) {
    // save time of last cycle.
    controllerPrevMillis = currentMillis;

    pwm = calcpwm(error);
  }
  return pwm;
}
