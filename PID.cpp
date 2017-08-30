#include <Arduino.h>
#include "PID.h"

void pidInit(SPid * pid, double t)
{
  pid->dState = t;
  pid->iState = t;
  pid->iMax = 100.0;
  pid->iMin = 0;
  pid->iGain = 0.01;
  pid->pGain = 2;
  pid->dGain = 5000;
}

double pidUpdate(SPid * pid, double error, double position)
{
  double pTerm, dTerm, iTerm;
  Serial.print("error: ");
  Serial.println(error);
  Serial.print("position: ");
  Serial.println(position);

  // calculate the proportional term
  pTerm = pid->pGain * error;
  Serial.print("pTerm: ");
  Serial.println(pTerm);

  // calculate the integral state with appropriate limiting
  pid->iState += error;
  if (pid->iState > pid->iMax) pid->iState = pid->iMax;
  else if (pid->iState < pid->iMin) pid->iState = pid->iMin;
  Serial.print("iState: ");
  Serial.println(pid->iState);

  // calculate the integral term
  iTerm = pid->iGain * pid->iState;
  Serial.print("iTerm: ");
  Serial.println(iTerm);

  dTerm = pid->dGain * (position - pid->dState);
  Serial.print("iTerm: ");
  Serial.println(iTerm);
  pid->dState = position;
  return pTerm + iTerm - dTerm;
}
