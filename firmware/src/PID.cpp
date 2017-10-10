#include <Arduino.h>
#include "HBS.h"

void pidInit(SPid * pid)
{
  pid->dState =   20;
  pid->iState =    0;
  pid->iMax   =  127;
  pid->iMin   = -127;
  pid->pGain  =   50;
  pid->iGain  =    0;
  pid->dGain  =    0;
  Serial.println("error, position, pterm, iterm, dterm, result");
}

unsigned long pidPrevMillis = 0;
int pwm = 0; // Value for pulse-width-modulation (PWM)

int pidUpdate(SPid * pid, double error, double position)
{
  unsigned long currentMillis = millis();

  if (currentMillis - pidPrevMillis >= 1000) {
    // save time of last cycle.
    pidPrevMillis = currentMillis;

    /* Don't use PID for now.

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
    dTerm = pid->dGain * (pid->dState - position);

    pid->dState = position;

    pwm = pTerm + iTerm - dTerm;

    if (pwm > 255)
      pwm = 255;
    else if (pwm < 0)
      pwm = 0;

    */

    pwm = error <= 0 ? 0 : 255;

    Serial.print(error);
    Serial.print(", ");
    Serial.print(position);
    Serial.print(", ");
    // Serial.print(pTerm);
    // Serial.print(", ");
    // Serial.print(iTerm);
    // Serial.print(", ");
    // Serial.print(dTerm);
    // Serial.print(", ");
    Serial.println(pwm);
  }

  return pwm;
}
