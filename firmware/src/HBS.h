#ifndef HBS_h
#define HBS_h

// on pin 9 (a 4.7K resistor is necessary for pull-up)
#define TEMP_PIN    9
#define PUMP_PIN   10
#define HEATER_PIN 11

#define OFF 0
#define ON 1

enum menu { HEATER, HEAT, PUMP, BUZZER };

struct state
{
  float actualTemp; // Actual temperature
  float setTemp;    // Set point for temperature
  bool  heater;     // Heater on/off
  int   heat;       // Duty-cycle for heater (0-255)
  bool  pump;       // Pump on/off
  bool  buzzer;     // Buzzer on/off
  menu  selected;   // Selected menu
};

// Initialise the display with I2C address.
void displayInit();

// Show the state of the brewing system.
void displayUpdate(const struct state);

// Initialise the buzzer pin mode.
void initBuzzer();

// Sound the buzzer.
void soundBuzzer();

// Initialise the temperature probe.
void initTemp();

// Read celcius temperature from temperature probe.
float readTemp();

// Initialise the buttons.
void initButtons();
void readButtons(struct state *hbs);

// Simple temperature controller.
int controller(double error);

#endif
