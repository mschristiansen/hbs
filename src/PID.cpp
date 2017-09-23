#include <Arduino.h>
#include "HBS.h"

void pidInit(SPid * pid, double t)
{
  pid->dState = t;
  pid->iState = t;
  pid->iMax = 255;
  pid->iMin = 0;
  pid->iGain = 0.01;
  pid->pGain = 1;
  pid->dGain = 5000;
  Serial.println("error, position, pterm, dterm, iterm, result");
}

int pidUpdate(SPid * pid, double error, double position)
{
  double pTerm, dTerm, iTerm;

  // calculate the proportional term
  pTerm = pid->pGain * error;

  // calculate the integral state with appropriate limiting
  pid->iState += error;
  if (pid->iState > pid->iMax)
    pid->iState = pid->iMax;
  else if (pid->iState < pid->iMin)
    pid->iState = pid->iMin;
  iTerm = pid->iGain * pid->iState;

  // calculate the derivative term
  dTerm = pid->dGain * (position - pid->dState);

  pid->dState = position;

  double result = pTerm + iTerm - dTerm;

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
  Serial.println(result);

  return (int)result;
}
