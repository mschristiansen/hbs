#include <Arduino.h>
#include "HBS.h"

void setup();
void loop();
SPid pid;

// define the initial state for the system.
struct state initial = {
  0,    // actual temperature
  60,   // setpoint temperature
  OFF,  // Heater
  0,    // Duty-cycle on heater
  OFF,  // Pump
  OFF,  // Buzzer
  HEAT  // Selected menu
};

// Create and initialise the state for the system.
struct state *hbs = &initial;

// Prototypes.
void pumpInit();
void pumpUpdate(int dutyCycle);
void heaterInit();
void heaterUpdate(int dutyCycle);

// the setup function runs once when you press reset or power the board
void setup() {
  Serial.begin(9600);
  initTemp();
  displayInit();
  pidInit(&pid, 0);
  pumpInit();
  heaterInit();
  initBuzzer();
  initButtons();
}

// the loop function runs over and over again forever
void loop()
{
  // Update state with the current temperature.
  hbs->actualTemp = readTemp();;

  readButtons(hbs);
  displayUpdate(*hbs);

  if (hbs->actualTemp > hbs->setTemp)
    soundBuzzer();

  // Pump ON/OFF
  if (hbs->pump)
    pumpUpdate(255);
  else
    pumpUpdate(0);

  // Use PID controller to Set duty-cycle of heater
  hbs->heat = pidUpdate(&pid, hbs->setTemp - hbs->actualTemp, hbs->actualTemp);

  // Heater OFF or PWM
  if (hbs->heater)
    heaterUpdate(hbs->heat);
  else
    heaterUpdate(0);
}

void pumpInit()
{
  pinMode(PUMP_PIN, OUTPUT);
}

// Takes a value from 0-255
void pumpUpdate(int dutyCycle)
{
  analogWrite(PUMP_PIN, dutyCycle);
}

void heaterInit()
{
  pinMode(HEATER_PIN, OUTPUT);
}

// Takes a value from 0-255
void heaterUpdate(int dutyCycle)
{
  analogWrite(HEATER_PIN, dutyCycle);
}
