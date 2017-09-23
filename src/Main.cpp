#include <Arduino.h>
#include "HBS.h"

#define PWMPIN 11
#define OFF 0

void setup();
void loop();
SPid pid;

// define the initial state for the system.
struct state initial = {
  0,          // actual temperature
  60,         // setpoint temperature
  0,          // Duty-cycle on heater
  OFF,        // Pump
  OFF,        // Buzzer
  TEMPERATURE // Selected menu
};

// Create and initialise the state for the system.
struct state *hbs = &initial;

// Prototypes.
void pwmInit();
void pwmUpdate(int dutyCycle);

// the setup function runs once when you press reset or power the board
void setup() {
  Serial.begin(9600);
  initTemp();
  displayInit();
  pidInit(&pid, 0);
  // initialize pwm pin as an output.
  pwmInit();
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
  if (hbs->pump) {
    pwmUpdate(255);
  } else {
    pwmUpdate(0);
  }

  // Use PID controller to Set duty-cycle of heater
  hbs->heater = pidUpdate(&pid, hbs->setTemp - hbs->actualTemp, hbs->actualTemp);
}

void pwmInit()
{
  pinMode(PWMPIN, OUTPUT);
}

// Takes a value from 0-255
void pwmUpdate(int dutyCycle)
{
  analogWrite(PWMPIN, dutyCycle);
}
