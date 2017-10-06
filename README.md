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


Compile and Flash
-----------------

Use the makefile to compile and flash.

```
$ make flash
```

References
----------

- http://www.nongnu.org/avr-libc/user-manual/index.html
- http://playground.arduino.cc/Learning/OneWire
