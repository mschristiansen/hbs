#include <Arduino.h>
#include "HBS.h"

void pidInit(SPid * pid, double t)
{
  pid->dState = t;
  pid->iState = t;
  pid->iMax = 255;
  pid->iMin = 0;
  pid->pGain = 5;
  pid->iGain = 0;
  pid->dGain = 0;
  Serial.println("error, position, pterm, dterm, iterm, result");
}

unsigned long pidPrevMillis = 0;
int pwm = 0; // Value for pulse-width-modulation (PWM)

int pidUpdate(SPid * pid, double error, double position)
{
  unsigned long currentMillis = millis();

  if (currentMillis - pidPrevMillis >= 1000) {
    // save time of last cycle.
    pidPrevMillis = currentMillis;

    double pTerm, dTerm, iTerm;

    // calculate the proportional term.
    pTerm = pid->pGain * error;

    // calculate the integral state with appropriate limiting.
    pid->iState += error;
    if (pid->iState > pid->iMax)
      pid->iState = pid->iMax;
    else if (pid->iState < pid->iMin)
      pid->iState = pid->iMin;
    iTerm = pid->iGain * pid->iState;

    // calculate the derivative term.
    dTerm = pid->dGain * (position - pid->dState);

    pid->dState = position;

    pwm = pTerm + iTerm - dTerm;

    if (pwm > 255)
      pwm = 255;
    else if (pwm < 0)
      pwm = 0;

    Serial.print(error);
    Serial.print(", ");
    Serial.print(position);
    Serial.print(", ");
    Serial.print(pTerm);
    Serial.print(", ");
    Serial.print(dTerm);
    Serial.print(", ");
    Serial.print(iTerm);
    Serial.print(", ");
    Serial.println(pwm);
  }

  return pwm;
}
