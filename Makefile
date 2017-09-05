CC=avr-g++
CFLAGS = -Wall -g -Os -w -std=gnu++11 -fpermissive -fno-exceptions -ffunction-sections -fdata-sections -fno-threadsafe-statics -MMD -mmcu=$(MCU) -DF_CPU=$(F_CPU) -DARDUINO=10804 -DARDUINO_AVR_UNO -DARDUINO_ARCH_AVR -I$(ARDUINO_PATH) -I$(VARIANT_PATH) -I$(ARDUINO_LIBS)/SPI -I$(ARDUINO_LIBS)/Wire -Ilib/Adafruit-GFX-Library -Ilib/Adafruit_SSD1306 -I$(ARDUINO_LIBS)/Wire/utility
FDFLAGS = -w -Os -g -flto -fuse-linker-plugin -Wl,--gc-sections -mmcu=$(MCU)
PORT = /dev/ttyACM0
BAUD = 115200
MCU = atmega328p
F_CPU = 16000000L
ARDUINO_PATH = /usr/share/arduino/hardware/arduino/cores/arduino
VARIANT_PATH = /usr/share/arduino/hardware/arduino/variants/standard
ARDUINO_LIBS = /usr/share/arduino/libraries

default: Main.hex

# The library must be compiled without Link-Time-Optimization (LTO), (flag: -flto).
libArduino.a: $(ARDUINO_PATH)/*.c $(ARDUINO_PATH)/*.cpp
	$(CC) $(CFLAGS) -c $(ARDUINO_PATH)/*.c $(ARDUINO_PATH)/*.cpp
	avr-ar rvs libArduino.a *.o

Adafruit_SSD1306.o: lib/Adafruit_SSD1306/Adafruit_SSD1306.cpp
	$(CC) $(CFLAGS) -flto -c lib/Adafruit_SSD1306/Adafruit_SSD1306.cpp

Adafruit_GFX.o: lib/Adafruit-GFX-Library/Adafruit_GFX.cpp
	$(CC) $(CFLAGS) -flto -c lib/Adafruit-GFX-Library/Adafruit_GFX.cpp

SPI.o: $(ARDUINO_LIBS)/SPI/SPI.cpp
	$(CC) $(CFLAGS) -flto -c $(ARDUINO_LIBS)/SPI/SPI.cpp

# twi must be compiled with the C, not the C++ compiler.
twi.o: $(ARDUINO_LIBS)/Wire/utility/twi.c
	avr-gcc $(CFLAGS) -flto -c $(ARDUINO_LIBS)/Wire/utility/twi.c

Wire.o: $(ARDUINO_LIBS)/Wire/Wire.cpp
	$(CC) $(CFLAGS) -flto -c $(ARDUINO_LIBS)/Wire/Wire.cpp

Display.o: Display.cpp
	$(CC) $(CFLAGS) -flto -c Display.cpp

OneWire.o: lib/OneWire/OneWire.cpp
	$(CC) $(CFLAGS) -flto -c lib/OneWire/OneWire.cpp

Temperature.o: Temperature.cpp
	$(CC) $(CFLAGS) -flto -c Temperature.cpp

PID.o: PID.cpp
	$(CC) $(CFLAGS) -flto -c PID.cpp

Main.o:	Main.cpp
	$(CC) $(CFLAGS) -flto -c Main.cpp

Main.elf: libArduino.a Main.o Temperature.o OneWire.o Display.o Adafruit_SSD1306.o Adafruit_GFX.o SPI.o Wire.o twi.o PID.o
	$(CC) $(FDFLAGS) Main.o Temperature.o OneWire.o Display.o Adafruit_SSD1306.o Adafruit_GFX.o SPI.o Wire.o twi.o PID.o libArduino.a -lm -o Main.elf

Main.epp: Main.elf
	avr-objcopy -O ihex -j .eeprom --set-section-flags=.eeprom=alloc,load --no-change-warnings --change-section-lma .eeprom=0  Main.elf Main.epp

Main.hex: Main.elf
	avr-objcopy -O ihex -R .eeprom Main.elf Main.hex

upload: Main.hex
	avrdude -v -p$(MCU) -carduino -P$(PORT) -b$(BAUD) -D -Uflash:w:Main.hex:i
clean:
	rm -f *.o *.d *.elf *.hex *.a

screen:
	screen $(PORT) 9600

