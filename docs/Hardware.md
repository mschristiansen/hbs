Hardware Setup
==============

Built on Arduino Uno.


DS18B20 Temperature Sensor
--------------------------

- 5 volt power
- One wire to pin 10 with resistor for pullup
- DS18x20 family

SSD1306 OLED Display
--------------------

- Monochrome
- 128x32 pixels
- 5 volt power
- SDA from display to A4
- SCL from display to A5


Solid-State Relay
-----------------

To control the heater is connected on pin 11, which supports PWM.


MOSFET
------

To control the pump is connected on pin 10. This pin supports PWM, but
that functionality is currently not used.


Buttons
-------

- Button for 'Select' on pin 2 to ground
- Button for 'Next' on pin 3 to ground
- Both pin 2 and 3 support interrupts

Buzzer
------

Buzzer El-Mag PCB 5V, 30 mA attached to pin 8
