Controller for the Harley Brewing System
========================================

Install Dependencies
--------------------

Requires `avrdude` and `gcc-avr`.

```
$ sudo apt install arduino-mk
```

Initialise git submodules to fetch source code for display and
temperature sensor (installed in `firmware/lib`).

```
$ git submodule init
```


Compile and Upload Firmware
---------------------------

The firmware was tested with Arduino UNO and Arduino Pro Mini. Both of
these boards will auto reset i.e. no need to manually reset before
upload.

Change port and baud rate in `firmware/Makefile` according to
board. The Arduino UNO is generally on port `/dev/ttyACM0` and can
handle speeds up to 115200 baud. The Arduino Pro Mini is generally on
port `/dev/ttyUSB0` and can only handle speeds up to 57600 baud.

```
$ make upload
```




References
----------

- http://www.nongnu.org/avr-libc/user-manual/index.html
- http://playground.arduino.cc/Learning/OneWire
