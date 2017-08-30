#ifndef Temperature_h
#define Temperature_h
#include "lib/OneWire/OneWire.h"

void temp_init(byte pin);

float temp_read();

#endif
