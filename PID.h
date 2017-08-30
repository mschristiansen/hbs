#ifndef PID_h
#define PID_h

typedef struct
{
  double dState;     // Last position input
  double iState;     // Integrator state
  double iMax, iMin; // Maximum and minimum allowable integrator state
  double iGain,      // integral gain
        pGain,      // proportional gain
        dGain;      // derivative gain
} SPid;

void pidInit(SPid * pid, double temperature);

double pidUpdate(SPid * pid, double error, double temperature);

#endif
