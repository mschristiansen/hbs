#include <Arduino.h>
#include "Temperature.h"
#include "Display.h"
#include "PID.h"

void setup();
void loop();
float t;
double j;
SPid pid;
const int pwmPin = 11;
const int selectButton = 2;
const int nextButton = 3;

void pwmInit()
{
  pinMode(pwmPin, OUTPUT);
}

// Takes a value from 0-255
void pwmUpdate(int dutyCycle)
{
  analogWrite(pwmPin, dutyCycle);
}

// Interrupt for `select` button
select_ISR()
{
  int blueValue = digitalRead(selectButton);
  Serial.println(blueValue, DEC);

}

// Interrupt for `next` button
next_ISR()
{
  int yellowValue = digitalRead(nextButton);
  Serial.println(yellowValue, DEC);
}

// the setup function runs once when you press reset or power the board
void setup() {
  Serial.begin(9600);
  temp_init();
  displayInit();
  pidInit(&pid, 0);
  // initialize pwm pin as an output.
  pwmInit();
  pinMode(selectButton,INPUT_PULLUP);
  pinMode(nextButton,INPUT_PULLUP);
}

// the loop function runs over and over again forever
void loop()
{
  t = temp_read();
  Serial.print("  Temperature = ");
  Serial.print(t);
  Serial.println(" Celsius");
  displayTemp(t);
  j = pidUpdate(&pid, t - 20, t);
  Serial.print(" PID: ");
  Serial.println(j);
  pwmUpdate(127);
  delay(1000);
  pwmUpdate(255);
  delay(1000);
  pwmUpdate(0);

  // `digitalPinToInterrupt` is a macro that translates the pin to interrupt
  // Unfortunately only available in recent versions of Arduino.h

  // attachInterrupt(digitalPinToInterrupt(selectButton), select_ISR, CHANGE);
  attachInterrupt(0, select_ISR, CHANGE);
  // attachInterrupt(digitalPinToInterrupt(nextButton), next_ISR, CHANGE);
  attachInterrupt(1, next_ISR, CHANGE);
}
