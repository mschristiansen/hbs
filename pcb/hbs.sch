EESchema Schematic File Version 2
LIBS:transistors
LIBS:Arduino_Pro_Mini-cache
LIBS:interface
LIBS:conn
LIBS:relays
LIBS:diode
LIBS:device
LIBS:ac-dc
LIBS:audio
LIBS:hbs
LIBS:hbs-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L GND #PWR01
U 1 1 59D3BA0F
P 7850 3650
F 0 "#PWR01" H 7850 3400 50  0001 C CNN
F 1 "GND" H 7850 3500 50  0000 C CNN
F 2 "" H 7850 3650 50  0000 C CNN
F 3 "" H 7850 3650 50  0000 C CNN
	1    7850 3650
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR02
U 1 1 59D3BA29
P 4200 2900
F 0 "#PWR02" H 4200 2750 50  0001 C CNN
F 1 "VCC" H 4200 3050 50  0000 C CNN
F 2 "" H 4200 2900 50  0000 C CNN
F 3 "" H 4200 2900 50  0000 C CNN
	1    4200 2900
	1    0    0    -1  
$EndComp
$Comp
L Screw_Terminal_01x03 Temp1
U 1 1 59FB0650
P 6950 2600
F 0 "Temp1" H 6950 2800 50  0000 C CNN
F 1 "Screw_Terminal_01x03" H 6950 2400 50  0000 C CNN
F 2 "hbs:screw-terminal-3-5.08" H 6950 2600 50  0001 C CNN
F 3 "" H 6950 2600 50  0001 C CNN
	1    6950 2600
	-1   0    0    1   
$EndComp
$Comp
L Screw_Terminal_01x02 Heat1
U 1 1 59FB06DF
P 7650 3650
F 0 "Heat1" H 7650 3750 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 7700 3400 50  0000 C CNN
F 2 "hbs:screw-terminal-2-5.08" H 7650 3650 50  0001 C CNN
F 3 "" H 7650 3650 50  0001 C CNN
	1    7650 3650
	-1   0    0    1   
$EndComp
$Comp
L Screw_Terminal_01x02 Pump1
U 1 1 59FB077B
P 3350 3750
F 0 "Pump1" H 3350 3850 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 3550 3400 50  0000 C CNN
F 2 "hbs:screw-terminal-2-5.08" H 3350 3750 50  0001 C CNN
F 3 "" H 3350 3750 50  0001 C CNN
	1    3350 3750
	-1   0    0    1   
$EndComp
$Comp
L FINDER-36.11-4301 Pump2
U 1 1 59FB289A
P 4400 3200
F 0 "Pump2" H 4850 3350 50  0000 L CNN
F 1 "FINDER-36.11-4301" H 4850 3250 50  0000 L CNN
F 2 "hbs:relay-OJE-SS-105HM" H 5670 3170 50  0001 C CNN
F 3 "" H 4400 3200 50  0001 C CNN
	1    4400 3200
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR03
U 1 1 59FB2B97
P 3550 3650
F 0 "#PWR03" H 3550 3400 50  0001 C CNN
F 1 "GND" H 3550 3500 50  0000 C CNN
F 2 "" H 3550 3650 50  0000 C CNN
F 3 "" H 3550 3650 50  0000 C CNN
	1    3550 3650
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR04
U 1 1 59FB2BBD
P 5400 3050
F 0 "#PWR04" H 5400 2800 50  0001 C CNN
F 1 "GND" H 5400 2900 50  0000 C CNN
F 2 "" H 5400 3050 50  0000 C CNN
F 3 "" H 5400 3050 50  0000 C CNN
	1    5400 3050
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR05
U 1 1 59FB2C43
P 7350 2800
F 0 "#PWR05" H 7350 2550 50  0001 C CNN
F 1 "GND" H 7350 2650 50  0000 C CNN
F 2 "" H 7350 2800 50  0000 C CNN
F 3 "" H 7350 2800 50  0000 C CNN
	1    7350 2800
	1    0    0    -1  
$EndComp
$Comp
L BC337 Q1
U 1 1 59FB2D67
P 5500 3250
F 0 "Q1" H 5700 3250 50  0000 L CNN
F 1 "BC337" H 5700 3350 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Molded_Narrow" H 5700 3175 50  0001 L CIN
F 3 "" H 5500 3250 50  0001 L CNN
	1    5500 3250
	-1   0    0    1   
$EndComp
$Comp
L 1N4148 D1
U 1 1 59FB3022
P 4950 3200
F 0 "D1" H 4950 3300 50  0000 C CNN
F 1 "1N4148" H 4950 3100 50  0000 C CNN
F 2 "Diodes_THT:D_DO-35_SOD27_Horizontal_RM10" H 4950 3025 50  0001 C CNN
F 3 "" H 4950 3200 50  0001 C CNN
	1    4950 3200
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR06
U 1 1 59FB3C54
P 7350 2700
F 0 "#PWR06" H 7350 2550 50  0001 C CNN
F 1 "VCC" H 7350 2850 50  0000 C CNN
F 2 "" H 7350 2700 50  0000 C CNN
F 3 "" H 7350 2700 50  0000 C CNN
	1    7350 2700
	1    0    0    -1  
$EndComp
$Comp
L R r220
U 1 1 59FB3FCF
P 6050 3250
F 0 "r220" V 6130 3250 50  0000 C CNN
F 1 "R" V 6050 3250 50  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM7mm" V 5980 3250 50  0001 C CNN
F 3 "" H 6050 3250 50  0001 C CNN
	1    6050 3250
	0    -1   1    0   
$EndComp
$Comp
L Conn_01x04 Display1
U 1 1 59FB428E
P 8350 3600
F 0 "Display1" H 8350 3800 50  0000 C CNN
F 1 "JST Conn" H 8350 3300 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04" H 8350 3600 50  0001 C CNN
F 3 "" H 8350 3600 50  0001 C CNN
	1    8350 3600
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR07
U 1 1 59FB55A7
P 8250 2300
F 0 "#PWR07" H 8250 2050 50  0001 C CNN
F 1 "GND" H 8300 2150 50  0000 C CNN
F 2 "" H 8250 2300 50  0000 C CNN
F 3 "" H 8250 2300 50  0000 C CNN
	1    8250 2300
	1    0    0    -1  
$EndComp
$Comp
L Screw_Terminal_01x02 220V1
U 1 1 59FB5801
P 5450 1650
F 0 "220V1" H 5450 1750 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 5450 1450 50  0000 C CNN
F 2 "hbs:screw-terminal-2-5.08" H 5450 1650 50  0001 C CNN
F 3 "" H 5450 1650 50  0001 C CNN
	1    5450 1650
	-1   0    0    1   
$EndComp
$Comp
L IRM-02-5 AC-DC1
U 1 1 59FB5B3A
P 5650 1650
F 0 "AC-DC1" H 6050 1900 50  0000 C CNN
F 1 "IRM-02-5" H 6050 1500 50  0000 C CNN
F 2 "Converters_DCDC_ACDC:ACDC-Converter_MeanWell-IRM-02-x" H 6050 1400 50  0001 C CNN
F 3 "" H 6050 1300 50  0001 C CNN
	1    5650 1650
	1    0    0    -1  
$EndComp
$Comp
L Buzzer BZ1
U 1 1 59FB21D3
P 7400 2150
F 0 "BZ1" H 7550 2200 50  0000 L CNN
F 1 "Buzzer" H 7550 2100 50  0000 L CNN
F 2 "Buzzers_Beepers:BUZZER" V 7375 2250 50  0001 C CNN
F 3 "" V 7375 2250 50  0001 C CNN
	1    7400 2150
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR08
U 1 1 59FC7F8E
P 8750 3800
F 0 "#PWR08" H 8750 3650 50  0001 C CNN
F 1 "VCC" H 8750 3950 50  0000 C CNN
F 2 "" H 8750 3800 50  0000 C CNN
F 3 "" H 8750 3800 50  0000 C CNN
	1    8750 3800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 59FC801B
P 8750 3900
F 0 "#PWR09" H 8750 3650 50  0001 C CNN
F 1 "GND" H 8750 3750 50  0000 C CNN
F 2 "" H 8750 3900 50  0000 C CNN
F 3 "" H 8750 3900 50  0000 C CNN
	1    8750 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 3600 8650 3600
Wire Wire Line
	8650 3600 8650 3800
Wire Wire Line
	8650 3800 8750 3800
Wire Wire Line
	8550 3700 8550 3900
Wire Wire Line
	8550 3900 8750 3900
$Comp
L GND #PWR010
U 1 1 59FC919C
P 7500 2250
F 0 "#PWR010" H 7500 2000 50  0001 C CNN
F 1 "GND" H 7500 2100 50  0000 C CNN
F 2 "" H 7500 2250 50  0000 C CNN
F 3 "" H 7500 2250 50  0000 C CNN
	1    7500 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 2600 7250 2600
Wire Wire Line
	7250 2600 7250 2700
Wire Wire Line
	7250 2700 7350 2700
Wire Wire Line
	7350 2800 7150 2800
Wire Wire Line
	7150 2800 7150 2700
Wire Wire Line
	3550 3750 4100 3750
Wire Wire Line
	4100 3750 4100 3500
$Comp
L VCC #PWR011
U 1 1 59FCCA93
P 4600 2900
F 0 "#PWR011" H 4600 2750 50  0001 C CNN
F 1 "VCC" H 4600 3050 50  0000 C CNN
F 2 "" H 4600 2900 50  0000 C CNN
F 3 "" H 4600 2900 50  0000 C CNN
	1    4600 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 3450 5400 3500
Wire Wire Line
	5400 3500 4600 3500
Wire Wire Line
	4950 3350 4950 3500
Connection ~ 4950 3500
Wire Wire Line
	4950 3050 4950 2900
Wire Wire Line
	4950 2900 4600 2900
Wire Wire Line
	5900 3250 5700 3250
$Comp
L Conn_01x04 Buttons1
U 1 1 59FCD491
P 8050 2200
F 0 "Buttons1" H 8050 2400 50  0000 C CNN
F 1 "Conn_01x04" H 8050 1900 50  0000 C CNN
F 2 "hbs:screw-terminal-4-5.08" H 8050 2200 50  0001 C CNN
F 3 "" H 8050 2200 50  0001 C CNN
	1    8050 2200
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR012
U 1 1 59FCDA34
P 8950 3450
F 0 "#PWR012" H 8950 3300 50  0001 C CNN
F 1 "VCC" H 8950 3600 50  0000 C CNN
F 2 "" H 8950 3450 50  0000 C CNN
F 3 "" H 8950 3450 50  0000 C CNN
	1    8950 3450
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR013
U 1 1 59FCDAB6
P 9100 3550
F 0 "#PWR013" H 9100 3300 50  0001 C CNN
F 1 "GND" H 9100 3400 50  0000 C CNN
F 2 "" H 9100 3550 50  0000 C CNN
F 3 "" H 9100 3550 50  0000 C CNN
	1    9100 3550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 59FCDF12
P 6450 1650
F 0 "#PWR014" H 6450 1400 50  0001 C CNN
F 1 "GND" H 6450 1500 50  0000 C CNN
F 2 "" H 6450 1650 50  0000 C CNN
F 3 "" H 6450 1650 50  0000 C CNN
	1    6450 1650
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR015
U 1 1 59FCDF44
P 6450 1550
F 0 "#PWR015" H 6450 1400 50  0001 C CNN
F 1 "VCC" H 6450 1700 50  0000 C CNN
F 2 "" H 6450 1550 50  0000 C CNN
F 3 "" H 6450 1550 50  0000 C CNN
	1    6450 1550
	1    0    0    -1  
$EndComp
$Comp
L Screw_Terminal_01x02 5V1
U 1 1 59FCE19F
P 5900 2450
F 0 "5V1" H 5900 2550 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 5950 2200 50  0000 C CNN
F 2 "hbs:screw-terminal-2-5.08" H 5900 2450 50  0001 C CNN
F 3 "" H 5900 2450 50  0001 C CNN
	1    5900 2450
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR016
U 1 1 59FCE2AE
P 6100 2350
F 0 "#PWR016" H 6100 2200 50  0001 C CNN
F 1 "VCC" H 6250 2400 50  0000 C CNN
F 2 "" H 6100 2350 50  0000 C CNN
F 3 "" H 6100 2350 50  0000 C CNN
	1    6100 2350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR017
U 1 1 59FCE32C
P 6100 2450
F 0 "#PWR017" H 6100 2200 50  0001 C CNN
F 1 "GND" H 6100 2300 50  0000 C CNN
F 2 "" H 6100 2450 50  0000 C CNN
F 3 "" H 6100 2450 50  0000 C CNN
	1    6100 2450
	1    0    0    -1  
$EndComp
$Comp
L RobotDynProMini U1
U 1 1 5A00AEA2
P 9100 2550
F 0 "U1" H 9400 2650 60  0000 C CNN
F 1 "RobotDynProMini" V 9600 2000 60  0000 C CNN
F 2 "hbs:RobotDynProMini" H 9100 2550 60  0001 C CNN
F 3 "" H 9100 2550 60  0000 C CNN
	1    9100 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 2000 9100 2000
Wire Wire Line
	9100 2000 9100 2550
Wire Wire Line
	8250 2100 9000 2100
Wire Wire Line
	9000 2100 9000 2650
Wire Wire Line
	9000 2650 9100 2650
Wire Wire Line
	8250 2200 8900 2200
Wire Wire Line
	8900 2200 8900 2750
Wire Wire Line
	8900 2750 9100 2750
Wire Wire Line
	7650 2950 9100 2950
Wire Wire Line
	8950 3450 9100 3450
Wire Wire Line
	7500 2050 7750 2050
Wire Wire Line
	7750 2050 7750 2850
Wire Wire Line
	7750 2850 9100 2850
Wire Wire Line
	7150 2500 7650 2500
Wire Wire Line
	7650 2500 7650 2950
Wire Wire Line
	8550 3500 8850 3500
Wire Wire Line
	8850 3500 8850 3350
Wire Wire Line
	8850 3350 9100 3350
Wire Wire Line
	8750 3250 9100 3250
Wire Wire Line
	8750 3250 8750 3400
Wire Wire Line
	8750 3400 8550 3400
Wire Wire Line
	7850 3550 8100 3550
Wire Wire Line
	8100 3550 8100 3150
Wire Wire Line
	8100 3150 9100 3150
Wire Wire Line
	6200 3050 9100 3050
Wire Wire Line
	6200 3050 6200 3250
$EndSCHEMATC