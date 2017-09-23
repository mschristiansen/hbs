#ifndef HBS_h
#define HBS_h

enum menu { TEMPERATURE, PUMP };

struct state
{
  float actualTemp; // Actual temperature
  float setTemp;    // Set point for temperature
  int   heater;     // Duty-cycle for heater in percentage
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

#endif
