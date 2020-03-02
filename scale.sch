EESchema Schematic File Version 4
EELAYER 30 0
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
L otter:HX711 U1
U 1 1 5E592467
P 8300 2450
F 0 "U1" H 9100 2750 50  0000 L CNN
F 1 "HX711" H 9000 2650 50  0000 L CNN
F 2 "otter:SOIC-16_3.9x9.9mm_P1.27mm" H 8300 2400 50  0001 C CNN
F 3 "" H 8300 2400 50  0001 C CNN
	1    8300 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1
U 1 1 5E593882
P 7000 2150
F 0 "R1" V 6900 2150 50  0000 C CNN
F 1 "100" V 7000 2150 50  0000 C CNN
F 2 "otter:R_0603" H 7000 2150 50  0001 C CNN
F 3 "~" H 7000 2150 50  0001 C CNN
	1    7000 2150
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 5E594433
P 7000 2350
F 0 "R2" V 7104 2350 50  0000 C CNN
F 1 "100" V 7000 2350 50  0000 C CNN
F 2 "otter:R_0603" H 7000 2350 50  0001 C CNN
F 3 "~" H 7000 2350 50  0001 C CNN
	1    7000 2350
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C3
U 1 1 5E59472A
P 7200 2250
F 0 "C3" H 7292 2296 50  0000 L CNN
F 1 "100n" H 7292 2205 50  0000 L CNN
F 2 "otter:C_0603" H 7200 2250 50  0001 C CNN
F 3 "~" H 7200 2250 50  0001 C CNN
	1    7200 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 2350 7200 2350
Connection ~ 7200 2350
Wire Wire Line
	7200 2350 7100 2350
Wire Wire Line
	7550 2200 7450 2200
Wire Wire Line
	7450 2200 7450 2150
Wire Wire Line
	7450 2150 7200 2150
Wire Wire Line
	7200 2150 7100 2150
Connection ~ 7200 2150
$Comp
L Device:C_Small C4
U 1 1 5E595FDB
P 7250 3150
F 0 "C4" H 7342 3196 50  0000 L CNN
F 1 "100n" H 7342 3105 50  0000 L CNN
F 2 "otter:C_0603" H 7250 3150 50  0001 C CNN
F 3 "~" H 7250 3150 50  0001 C CNN
	1    7250 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 3000 7250 3000
Wire Wire Line
	7250 3000 7250 3050
Wire Wire Line
	8650 1700 8650 1400
Wire Wire Line
	8650 1400 8600 1400
Wire Wire Line
	8900 1700 8900 1400
Wire Wire Line
	8900 1400 8650 1400
Connection ~ 8650 1400
Connection ~ 8900 1400
$Comp
L Device:C_Small C5
U 1 1 5E598EDA
P 9300 1550
F 0 "C5" H 9392 1596 50  0000 L CNN
F 1 "100n" H 9392 1505 50  0000 L CNN
F 2 "otter:C_0603" H 9300 1550 50  0001 C CNN
F 3 "~" H 9300 1550 50  0001 C CNN
	1    9300 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 5E599117
P 9650 1550
F 0 "C6" H 9742 1596 50  0000 L CNN
F 1 "10u" H 9742 1505 50  0000 L CNN
F 2 "otter:C_0603" H 9650 1550 50  0001 C CNN
F 3 "~" H 9650 1550 50  0001 C CNN
	1    9650 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 1400 9300 1400
Wire Wire Line
	9650 1450 9650 1400
Connection ~ 9650 1400
Wire Wire Line
	9650 1400 9850 1400
Wire Wire Line
	9300 1450 9300 1400
Connection ~ 9300 1400
Wire Wire Line
	9300 1400 9650 1400
$Comp
L Device:R R7
U 1 1 5E59C8F5
P 10000 1400
F 0 "R7" V 9793 1400 50  0000 C CNN
F 1 "0" V 9884 1400 50  0000 C CNN
F 2 "otter:R_0805" V 9930 1400 50  0001 C CNN
F 3 "~" H 10000 1400 50  0001 C CNN
	1    10000 1400
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0106
U 1 1 5E59D215
P 10150 1400
F 0 "#PWR0106" H 10150 1250 50  0001 C CNN
F 1 "+3.3V" V 10165 1528 50  0000 L CNN
F 2 "" H 10150 1400 50  0001 C CNN
F 3 "" H 10150 1400 50  0001 C CNN
	1    10150 1400
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5E59FF3D
P 6800 1550
F 0 "C1" H 6892 1596 50  0000 L CNN
F 1 "100n" H 6892 1505 50  0000 L CNN
F 2 "otter:C_0603" H 6800 1550 50  0001 C CNN
F 3 "~" H 6800 1550 50  0001 C CNN
	1    6800 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 5E59FF43
P 7150 1550
F 0 "C2" H 7242 1596 50  0000 L CNN
F 1 "1u" H 7242 1505 50  0000 L CNN
F 2 "otter:C_0603" H 7150 1550 50  0001 C CNN
F 3 "~" H 7150 1550 50  0001 C CNN
	1    7150 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R6
U 1 1 5E5A1704
P 7950 1550
F 0 "R6" V 8054 1550 50  0000 C CNN
F 1 "100" V 7950 1550 50  0000 C CNN
F 2 "otter:R_0603" H 7950 1550 50  0001 C CNN
F 3 "~" H 7950 1550 50  0001 C CNN
	1    7950 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 1400 7950 1400
Wire Wire Line
	6800 1400 6800 1450
Wire Wire Line
	7150 1450 7150 1400
Connection ~ 7150 1400
Wire Wire Line
	7150 1400 6800 1400
Wire Wire Line
	7950 1450 7950 1400
Connection ~ 7950 1400
$Comp
L Device:R_Small R5
U 1 1 5E5A39BC
P 7800 1700
F 0 "R5" V 7904 1700 50  0000 C CNN
F 1 "100" V 7800 1700 50  0000 C CNN
F 2 "otter:R_0603" H 7800 1700 50  0001 C CNN
F 3 "~" H 7800 1700 50  0001 C CNN
	1    7800 1700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7950 1650 7950 1700
Wire Wire Line
	7950 1700 7900 1700
Connection ~ 7950 1700
Connection ~ 7350 1400
Wire Wire Line
	7350 1400 7150 1400
Wire Wire Line
	7350 2000 7350 1400
Wire Wire Line
	7350 2000 7550 2000
Wire Wire Line
	7350 1400 7950 1400
$Comp
L Connector:Conn_01x04_Male J1
U 1 1 5E5AD1F7
P 6000 1750
F 0 "J1" H 6108 2031 50  0000 C CNN
F 1 "DMS" H 6108 1940 50  0000 C CNN
F 2 "otter:04_pads" H 6000 1750 50  0001 C CNN
F 3 "~" H 6000 1750 50  0001 C CNN
	1    6000 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 1400 6600 1400
Wire Wire Line
	6600 1400 6600 1650
Wire Wire Line
	6600 1650 6200 1650
Connection ~ 6800 1400
Wire Wire Line
	6900 2150 6700 2150
Wire Wire Line
	6900 2350 6550 2350
$Comp
L Device:R_Small R3
U 1 1 5E5B3DC7
P 7300 2650
F 0 "R3" V 7200 2650 50  0000 C CNN
F 1 "0" V 7300 2650 50  0000 C CNN
F 2 "otter:R_0603" H 7300 2650 50  0001 C CNN
F 3 "~" H 7300 2650 50  0001 C CNN
	1    7300 2650
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R4
U 1 1 5E5B46E9
P 7300 2800
F 0 "R4" V 7404 2800 50  0000 C CNN
F 1 "0" V 7300 2800 50  0000 C CNN
F 2 "otter:R_0603" H 7300 2800 50  0001 C CNN
F 3 "~" H 7300 2800 50  0001 C CNN
	1    7300 2800
	0    1    1    0   
$EndComp
Wire Wire Line
	7550 2800 7400 2800
Wire Wire Line
	7550 2650 7400 2650
Text GLabel 9050 2400 2    50   Input ~ 0
HX_MISO
Text GLabel 9050 2550 2    50   Input ~ 0
HX_CLK
Text GLabel 9050 2800 2    50   Input ~ 0
HX_RATE
NoConn ~ 8700 3200
$Comp
L power:VBUS #PWR0113
U 1 1 5E5CAA9F
P 2350 1350
F 0 "#PWR0113" H 2350 1200 50  0001 C CNN
F 1 "VBUS" V 2365 1478 50  0000 L CNN
F 2 "" H 2350 1350 50  0001 C CNN
F 3 "" H 2350 1350 50  0001 C CNN
	1    2350 1350
	0    1    1    0   
$EndComp
$Comp
L Connector:USB_C_Receptacle_USB2.0 USB1
U 1 1 5E5CAFF9
P 1750 1950
F 0 "USB1" H 1857 2817 50  0000 C CNN
F 1 "USB" H 1857 2726 50  0000 C CNN
F 2 "otter:USB-C 16Pin" H 1900 1950 50  0001 C CNN
F 3 "https://www.usb.org/sites/default/files/documents/usb_type-c.zip" H 1900 1950 50  0001 C CNN
	1    1750 1950
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R8
U 1 1 5E5CE20F
P 2550 1550
F 0 "R8" V 2654 1550 50  0000 C CNN
F 1 "5k1" V 2550 1550 50  0000 C CNN
F 2 "otter:R_0603" H 2550 1550 50  0001 C CNN
F 3 "~" H 2550 1550 50  0001 C CNN
	1    2550 1550
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R9
U 1 1 5E5CEB9D
P 2550 1650
F 0 "R9" V 2654 1650 50  0000 C CNN
F 1 "5k1" V 2550 1650 50  0000 C CNN
F 2 "otter:R_0603" H 2550 1650 50  0001 C CNN
F 3 "~" H 2550 1650 50  0001 C CNN
	1    2550 1650
	0    1    1    0   
$EndComp
Wire Wire Line
	2450 1550 2350 1550
Wire Wire Line
	2350 1650 2450 1650
Wire Wire Line
	2650 1650 2700 1650
Wire Wire Line
	2700 1650 2700 1600
Wire Wire Line
	2700 1550 2650 1550
Wire Wire Line
	2700 1600 2750 1600
Connection ~ 2700 1600
Wire Wire Line
	2700 1600 2700 1550
$Comp
L power:GND #PWR0114
U 1 1 5E5D46E7
P 2750 1600
F 0 "#PWR0114" H 2750 1350 50  0001 C CNN
F 1 "GND" V 2755 1472 50  0000 R CNN
F 2 "" H 2750 1600 50  0001 C CNN
F 3 "" H 2750 1600 50  0001 C CNN
	1    2750 1600
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5E5D558F
P 1750 2850
F 0 "#PWR0115" H 1750 2600 50  0001 C CNN
F 1 "GND" H 1755 2677 50  0000 C CNN
F 2 "" H 1750 2850 50  0001 C CNN
F 3 "" H 1750 2850 50  0001 C CNN
	1    1750 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 5E5D5A70
P 1450 2850
F 0 "#PWR0116" H 1450 2600 50  0001 C CNN
F 1 "GND" H 1455 2677 50  0000 C CNN
F 2 "" H 1450 2850 50  0001 C CNN
F 3 "" H 1450 2850 50  0001 C CNN
	1    1450 2850
	1    0    0    -1  
$EndComp
NoConn ~ 2350 2450
NoConn ~ 2350 2550
Wire Wire Line
	2350 2050 2450 2050
Wire Wire Line
	2450 2050 2450 2150
Wire Wire Line
	2450 2150 2350 2150
Wire Wire Line
	2350 1950 2450 1950
Wire Wire Line
	2450 1950 2450 1850
Wire Wire Line
	2450 1850 2350 1850
Text GLabel 2450 2100 2    50   Input ~ 0
D+
Text GLabel 2450 1900 2    50   Input ~ 0
D-
$Comp
L otter:USBLC6-4 U2
U 1 1 5E5DD318
P 1650 4050
F 0 "U2" H 1650 4375 50  0000 C CNN
F 1 "USBLC6-4" H 1650 4284 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 1650 4050 50  0001 C CNN
F 3 "" H 1650 4050 50  0001 C CNN
	1    1650 4050
	1    0    0    -1  
$EndComp
Text GLabel 1950 4150 2    50   Input ~ 0
D+
Text GLabel 1350 4050 0    50   Input ~ 0
D-
$Comp
L power:GND #PWR0117
U 1 1 5E5E5913
P 1350 4150
F 0 "#PWR0117" H 1350 3900 50  0001 C CNN
F 1 "GND" H 1355 3977 50  0000 C CNN
F 2 "" H 1350 4150 50  0001 C CNN
F 3 "" H 1350 4150 50  0001 C CNN
	1    1350 4150
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0118
U 1 1 5E5E7ABA
P 1950 3950
F 0 "#PWR0118" H 1950 3800 50  0001 C CNN
F 1 "+3.3V" V 1965 4078 50  0000 L CNN
F 2 "" H 1950 3950 50  0001 C CNN
F 3 "" H 1950 3950 50  0001 C CNN
	1    1950 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C7
U 1 1 5E5EB2A5
P 2300 4050
F 0 "C7" H 2392 4096 50  0000 L CNN
F 1 "100n" H 2392 4005 50  0000 L CNN
F 2 "otter:C_0603" H 2300 4050 50  0001 C CNN
F 3 "~" H 2300 4050 50  0001 C CNN
	1    2300 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 5E5ECBAD
P 2300 4150
F 0 "#PWR0119" H 2300 3900 50  0001 C CNN
F 1 "GND" H 2305 3977 50  0000 C CNN
F 2 "" H 2300 4150 50  0001 C CNN
F 3 "" H 2300 4150 50  0001 C CNN
	1    2300 4150
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0120
U 1 1 5E5F037D
P 2300 3950
F 0 "#PWR0120" H 2300 3800 50  0001 C CNN
F 1 "+3.3V" V 2315 4078 50  0000 L CNN
F 2 "" H 2300 3950 50  0001 C CNN
F 3 "" H 2300 3950 50  0001 C CNN
	1    2300 3950
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0121
U 1 1 5E5FF712
P 5300 3400
F 0 "#PWR0121" H 5300 3250 50  0001 C CNN
F 1 "+3.3V" V 5315 3528 50  0000 L CNN
F 2 "" H 5300 3400 50  0001 C CNN
F 3 "" H 5300 3400 50  0001 C CNN
	1    5300 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0122
U 1 1 5E6058BE
P 5250 6500
F 0 "#PWR0122" H 5250 6250 50  0001 C CNN
F 1 "GND" H 5255 6327 50  0000 C CNN
F 2 "" H 5250 6500 50  0001 C CNN
F 3 "" H 5250 6500 50  0001 C CNN
	1    5250 6500
	1    0    0    -1  
$EndComp
$Comp
L MCU_ST_STM32F0:STM32F072CBTx U4
U 1 1 5E60CF65
P 5300 4950
F 0 "U4" H 4600 3350 50  0000 C CNN
F 1 "STM32F072CBTx" H 4600 3450 50  0000 C CNN
F 2 "otter:LQFP-48_7x7mm_P0.5mm" H 4700 3550 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00090510.pdf" H 5300 4950 50  0001 C CNN
	1    5300 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 6450 5200 6450
Connection ~ 5200 6450
Wire Wire Line
	5200 6450 5250 6450
Connection ~ 5300 6450
Wire Wire Line
	5300 6450 5400 6450
Wire Wire Line
	5250 6500 5250 6450
Connection ~ 5250 6450
Wire Wire Line
	5250 6450 5300 6450
Wire Wire Line
	5500 3450 5400 3450
Connection ~ 5200 3450
Wire Wire Line
	5200 3450 5100 3450
Connection ~ 5300 3450
Wire Wire Line
	5300 3450 5200 3450
Connection ~ 5400 3450
Wire Wire Line
	5400 3450 5300 3450
Wire Wire Line
	5300 3450 5300 3400
Wire Wire Line
	4600 4350 4500 4350
Wire Wire Line
	4500 4350 4500 3850
Wire Wire Line
	4500 3850 4600 3850
$Comp
L Device:R_Small R10
U 1 1 5E626EF3
P 4150 4000
F 0 "R10" V 4254 4000 50  0000 C CNN
F 1 "5k1" V 4150 4000 50  0000 C CNN
F 2 "otter:R_0603" H 4150 4000 50  0001 C CNN
F 3 "~" H 4150 4000 50  0001 C CNN
	1    4150 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3900 4150 3850
$Comp
L power:GND #PWR0123
U 1 1 5E62B2DB
P 4150 4100
F 0 "#PWR0123" H 4150 3850 50  0001 C CNN
F 1 "GND" H 4155 3927 50  0000 C CNN
F 2 "" H 4150 4100 50  0001 C CNN
F 3 "" H 4150 4100 50  0001 C CNN
	1    4150 4100
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0124
U 1 1 5E62F419
P 4150 3450
F 0 "#PWR0124" H 4150 3300 50  0001 C CNN
F 1 "+3.3V" V 4165 3578 50  0000 L CNN
F 2 "" H 4150 3450 50  0001 C CNN
F 3 "" H 4150 3450 50  0001 C CNN
	1    4150 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3850 4500 3850
Connection ~ 4500 3850
$Comp
L Device:C_Small C10
U 1 1 5E646F01
P 4550 3450
F 0 "C10" H 4642 3496 50  0000 L CNN
F 1 "100n" H 4642 3405 50  0000 L CNN
F 2 "otter:C_0603" H 4550 3450 50  0001 C CNN
F 3 "~" H 4550 3450 50  0001 C CNN
	1    4550 3450
	-1   0    0    1   
$EndComp
Wire Wire Line
	4600 3650 4550 3650
Wire Wire Line
	4550 3650 4550 3550
$Comp
L power:GND #PWR0125
U 1 1 5E64C471
P 4550 3350
F 0 "#PWR0125" H 4550 3100 50  0001 C CNN
F 1 "GND" V 4555 3222 50  0000 R CNN
F 2 "" H 4550 3350 50  0001 C CNN
F 3 "" H 4550 3350 50  0001 C CNN
	1    4550 3350
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR0126
U 1 1 5E6511D6
P 5150 7100
F 0 "#PWR0126" H 5150 6950 50  0001 C CNN
F 1 "+3.3V" H 5165 7273 50  0000 C CNN
F 2 "" H 5150 7100 50  0001 C CNN
F 3 "" H 5150 7100 50  0001 C CNN
	1    5150 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0127
U 1 1 5E653A01
P 5150 7300
F 0 "#PWR0127" H 5150 7050 50  0001 C CNN
F 1 "GND" H 5155 7127 50  0000 C CNN
F 2 "" H 5150 7300 50  0001 C CNN
F 3 "" H 5150 7300 50  0001 C CNN
	1    5150 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C13
U 1 1 5E6570D6
P 5150 7200
F 0 "C13" H 5242 7246 50  0000 L CNN
F 1 "100n" H 5242 7155 50  0000 L CNN
F 2 "otter:C_0603" H 5150 7200 50  0001 C CNN
F 3 "~" H 5150 7200 50  0001 C CNN
	1    5150 7200
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR0128
U 1 1 5E661EAD
P 5500 7100
F 0 "#PWR0128" H 5500 6950 50  0001 C CNN
F 1 "+3.3V" H 5515 7273 50  0000 C CNN
F 2 "" H 5500 7100 50  0001 C CNN
F 3 "" H 5500 7100 50  0001 C CNN
	1    5500 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0129
U 1 1 5E661EB3
P 5500 7300
F 0 "#PWR0129" H 5500 7050 50  0001 C CNN
F 1 "GND" H 5505 7127 50  0000 C CNN
F 2 "" H 5500 7300 50  0001 C CNN
F 3 "" H 5500 7300 50  0001 C CNN
	1    5500 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C14
U 1 1 5E661EB9
P 5500 7200
F 0 "C14" H 5592 7246 50  0000 L CNN
F 1 "100n" H 5592 7155 50  0000 L CNN
F 2 "otter:C_0603" H 5500 7200 50  0001 C CNN
F 3 "~" H 5500 7200 50  0001 C CNN
	1    5500 7200
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR0130
U 1 1 5E663E01
P 5850 7100
F 0 "#PWR0130" H 5850 6950 50  0001 C CNN
F 1 "+3.3V" H 5865 7273 50  0000 C CNN
F 2 "" H 5850 7100 50  0001 C CNN
F 3 "" H 5850 7100 50  0001 C CNN
	1    5850 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0131
U 1 1 5E663E07
P 5850 7300
F 0 "#PWR0131" H 5850 7050 50  0001 C CNN
F 1 "GND" H 5855 7127 50  0000 C CNN
F 2 "" H 5850 7300 50  0001 C CNN
F 3 "" H 5850 7300 50  0001 C CNN
	1    5850 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C15
U 1 1 5E663E0D
P 5850 7200
F 0 "C15" H 5942 7246 50  0000 L CNN
F 1 "100n" H 5942 7155 50  0000 L CNN
F 2 "otter:C_0603" H 5850 7200 50  0001 C CNN
F 3 "~" H 5850 7200 50  0001 C CNN
	1    5850 7200
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR0132
U 1 1 5E673B6E
P 6200 7100
F 0 "#PWR0132" H 6200 6950 50  0001 C CNN
F 1 "+3.3V" H 6215 7273 50  0000 C CNN
F 2 "" H 6200 7100 50  0001 C CNN
F 3 "" H 6200 7100 50  0001 C CNN
	1    6200 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0133
U 1 1 5E673B74
P 6200 7300
F 0 "#PWR0133" H 6200 7050 50  0001 C CNN
F 1 "GND" H 6205 7127 50  0000 C CNN
F 2 "" H 6200 7300 50  0001 C CNN
F 3 "" H 6200 7300 50  0001 C CNN
	1    6200 7300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C16
U 1 1 5E673B7A
P 6200 7200
F 0 "C16" H 6292 7246 50  0000 L CNN
F 1 "100n" H 6292 7155 50  0000 L CNN
F 2 "otter:C_0603" H 6200 7200 50  0001 C CNN
F 3 "~" H 6200 7200 50  0001 C CNN
	1    6200 7200
	-1   0    0    1   
$EndComp
Text GLabel 5900 5950 2    50   Input ~ 0
D+
Text GLabel 5900 5850 2    50   Input ~ 0
D-
Text GLabel 5900 6050 2    50   Input ~ 0
SWDIO
Text GLabel 5900 6150 2    50   Input ~ 0
SWCLK
$Comp
L otter:TC2030-CTX-Tag-Connect P1
U 1 1 5E689D9E
P 1700 4800
F 0 "P1" H 1700 5092 40  0000 C CNN
F 1 "TC" H 1700 5016 40  0000 C CNN
F 2 "otter:TC2030" H 1700 4800 60  0001 C CNN
F 3 "" H 1700 4800 60  0001 C CNN
	1    1700 4800
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0134
U 1 1 5E68C67F
P 1250 4700
F 0 "#PWR0134" H 1250 4550 50  0001 C CNN
F 1 "+3.3V" V 1265 4828 50  0000 L CNN
F 2 "" H 1250 4700 50  0001 C CNN
F 3 "" H 1250 4700 50  0001 C CNN
	1    1250 4700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0135
U 1 1 5E68F0CF
P 1250 4900
F 0 "#PWR0135" H 1250 4650 50  0001 C CNN
F 1 "GND" H 1255 4727 50  0000 C CNN
F 2 "" H 1250 4900 50  0001 C CNN
F 3 "" H 1250 4900 50  0001 C CNN
	1    1250 4900
	1    0    0    -1  
$EndComp
Text GLabel 2150 4700 2    50   Input ~ 0
SWDIO
Text GLabel 2150 4800 2    50   Input ~ 0
SWCLK
Text GLabel 5950 5350 2    50   Input ~ 0
HX_MISO
Text GLabel 5900 5250 2    50   Input ~ 0
HX_CLK
Text GLabel 5900 5150 2    50   Input ~ 0
HX_RATE
Wire Wire Line
	5950 5350 5950 5450
Wire Wire Line
	5950 5450 5900 5450
Wire Wire Line
	5950 5350 5900 5350
$Comp
L Regulator_Linear:AMS1117-3.3 U3
U 1 1 5E6D07AF
P 4350 1250
F 0 "U3" H 4350 1492 50  0000 C CNN
F 1 "AMS1117-3.3" H 4350 1401 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 4350 1450 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 4450 1000 50  0001 C CNN
	1    4350 1250
	1    0    0    -1  
$EndComp
$Comp
L power:VBUS #PWR0138
U 1 1 5E6D26A8
P 3300 1500
F 0 "#PWR0138" H 3300 1350 50  0001 C CNN
F 1 "VBUS" V 3315 1628 50  0000 L CNN
F 2 "" H 3300 1500 50  0001 C CNN
F 3 "" H 3300 1500 50  0001 C CNN
	1    3300 1500
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR0139
U 1 1 5E6D68A1
P 5200 1250
F 0 "#PWR0139" H 5200 1100 50  0001 C CNN
F 1 "+3.3V" V 5215 1378 50  0000 L CNN
F 2 "" H 5200 1250 50  0001 C CNN
F 3 "" H 5200 1250 50  0001 C CNN
	1    5200 1250
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C9
U 1 1 5E6DCA57
P 3850 1400
F 0 "C9" H 3942 1446 50  0000 L CNN
F 1 "100n" H 3942 1355 50  0000 L CNN
F 2 "otter:C_0603" H 3850 1400 50  0001 C CNN
F 3 "~" H 3850 1400 50  0001 C CNN
	1    3850 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C8
U 1 1 5E6DCA5D
P 3550 1400
F 0 "C8" H 3642 1446 50  0000 L CNN
F 1 "10u" H 3642 1355 50  0000 L CNN
F 2 "otter:C_0603" H 3550 1400 50  0001 C CNN
F 3 "~" H 3550 1400 50  0001 C CNN
	1    3550 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 1250 3550 1250
Wire Wire Line
	3550 1300 3550 1250
Connection ~ 3550 1250
Wire Wire Line
	3550 1250 3850 1250
Wire Wire Line
	3850 1300 3850 1250
Connection ~ 3850 1250
Wire Wire Line
	3850 1250 4050 1250
$Comp
L Device:C_Small C11
U 1 1 5E701FC1
P 4700 1400
F 0 "C11" H 4792 1446 50  0000 L CNN
F 1 "100n" H 4792 1355 50  0000 L CNN
F 2 "otter:C_0603" H 4700 1400 50  0001 C CNN
F 3 "~" H 4700 1400 50  0001 C CNN
	1    4700 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C12
U 1 1 5E704E75
P 5050 1400
F 0 "C12" H 5142 1446 50  0000 L CNN
F 1 "10u" H 5142 1355 50  0000 L CNN
F 2 "otter:C_0603" H 5050 1400 50  0001 C CNN
F 3 "~" H 5050 1400 50  0001 C CNN
	1    5050 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 1250 5050 1250
Wire Wire Line
	4700 1300 4700 1250
Connection ~ 4700 1250
Wire Wire Line
	4700 1250 4650 1250
Wire Wire Line
	5050 1300 5050 1250
Connection ~ 5050 1250
Wire Wire Line
	5050 1250 4700 1250
Wire Wire Line
	4350 1600 4350 1550
Wire Wire Line
	4350 1600 3850 1600
Wire Wire Line
	3550 1600 3550 1500
Wire Wire Line
	3850 1500 3850 1600
Connection ~ 3850 1600
Wire Wire Line
	3850 1600 3550 1600
Wire Wire Line
	4350 1600 4700 1600
Wire Wire Line
	5050 1600 5050 1500
Connection ~ 4350 1600
Wire Wire Line
	4700 1500 4700 1600
Connection ~ 4700 1600
Wire Wire Line
	4700 1600 5050 1600
$Comp
L power:GND #PWR0140
U 1 1 5E723C2E
P 4350 1650
F 0 "#PWR0140" H 4350 1400 50  0001 C CNN
F 1 "GND" H 4355 1477 50  0000 C CNN
F 2 "" H 4350 1650 50  0001 C CNN
F 3 "" H 4350 1650 50  0001 C CNN
	1    4350 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 1650 4350 1600
$Comp
L Connector_Generic:Conn_01x13 J5
U 1 1 5E74644F
P 7400 5700
F 0 "J5" H 7318 4875 50  0000 C CNN
F 1 "Display" H 7318 4966 50  0000 C CNN
F 2 "otter:0.96IPS" H 7400 5700 50  0001 C CNN
F 3 "~" H 7400 5700 50  0001 C CNN
	1    7400 5700
	-1   0    0    1   
$EndComp
Text GLabel 7600 6300 2    50   Input ~ 0
TP0
Text GLabel 7600 6200 2    50   Input ~ 0
TP1
Text GLabel 7600 6100 2    50   Input ~ 0
IPS_SDA
Text GLabel 7600 6000 2    50   Input ~ 0
IPS_SCL
Text GLabel 7600 5900 2    50   Input ~ 0
IPS_DC
Text GLabel 7600 5800 2    50   Input ~ 0
IPS_RESET
Text GLabel 7600 5700 2    50   Input ~ 0
IPS_CS
$Comp
L power:GND #PWR0143
U 1 1 5E75CF7D
P 7600 5600
F 0 "#PWR0143" H 7600 5350 50  0001 C CNN
F 1 "GND" V 7605 5472 50  0000 R CNN
F 2 "" H 7600 5600 50  0001 C CNN
F 3 "" H 7600 5600 50  0001 C CNN
	1    7600 5600
	0    -1   -1   0   
$EndComp
NoConn ~ 7600 5500
$Comp
L power:+3.3V #PWR0144
U 1 1 5E761CF2
P 7600 5400
F 0 "#PWR0144" H 7600 5250 50  0001 C CNN
F 1 "+3.3V" V 7615 5528 50  0000 L CNN
F 2 "" H 7600 5400 50  0001 C CNN
F 3 "" H 7600 5400 50  0001 C CNN
	1    7600 5400
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0146
U 1 1 5E765E98
P 7600 5100
F 0 "#PWR0146" H 7600 4850 50  0001 C CNN
F 1 "GND" V 7605 4972 50  0000 R CNN
F 2 "" H 7600 5100 50  0001 C CNN
F 3 "" H 7600 5100 50  0001 C CNN
	1    7600 5100
	0    -1   -1   0   
$EndComp
Text GLabel 4600 5450 0    50   Input ~ 0
IPS_SDA
Text GLabel 4600 5350 0    50   Input ~ 0
IPS_SCL
Text GLabel 4600 5150 0    50   Input ~ 0
IPS_RESET
Text GLabel 4600 5050 0    50   Input ~ 0
IPS_CS
Text GLabel 4600 5250 0    50   Input ~ 0
IPS_DC
$Comp
L power:+3.3V #PWR0145
U 1 1 5E79699C
P 7600 5200
F 0 "#PWR0145" H 7600 5050 50  0001 C CNN
F 1 "+3.3V" V 7615 5328 50  0000 L CNN
F 2 "" H 7600 5200 50  0001 C CNN
F 3 "" H 7600 5200 50  0001 C CNN
	1    7600 5200
	0    1    1    0   
$EndComp
Text GLabel 7600 5300 2    50   Input ~ 0
IPS_LEDK
$Comp
L Transistor_FET:2N7002 Q2
U 1 1 5E79F210
P 8350 4550
F 0 "Q2" H 8554 4596 50  0000 L CNN
F 1 "AO3400" H 8554 4505 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8550 4475 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N7002.pdf" H 8350 4550 50  0001 L CNN
	1    8350 4550
	1    0    0    -1  
$EndComp
Text GLabel 8450 4350 1    50   Input ~ 0
IPS_LEDK
$Comp
L power:GND #PWR0147
U 1 1 5E7A5545
P 8450 4750
F 0 "#PWR0147" H 8450 4500 50  0001 C CNN
F 1 "GND" H 8455 4577 50  0000 C CNN
F 2 "" H 8450 4750 50  0001 C CNN
F 3 "" H 8450 4750 50  0001 C CNN
	1    8450 4750
	1    0    0    -1  
$EndComp
Text GLabel 8150 4550 0    50   Input ~ 0
IPS_PWM
Text GLabel 5900 6250 2    50   Input ~ 0
IPS_PWM
$Comp
L Device:LED D3
U 1 1 5E7D1774
P 750 5350
F 0 "D3" V 789 5232 50  0000 R CNN
F 1 "STATUS" V 698 5232 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 750 5350 50  0001 C CNN
F 3 "~" H 750 5350 50  0001 C CNN
	1    750  5350
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0150
U 1 1 5E7D962D
P 750 5500
F 0 "#PWR0150" H 750 5250 50  0001 C CNN
F 1 "GND" H 755 5327 50  0000 C CNN
F 2 "" H 750 5500 50  0001 C CNN
F 3 "" H 750 5500 50  0001 C CNN
	1    750  5500
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R13
U 1 1 5E7E55B1
P 750 5100
F 0 "R13" V 854 5100 50  0000 C CNN
F 1 "5k1" V 750 5100 50  0000 C CNN
F 2 "otter:R_0603" H 750 5100 50  0001 C CNN
F 3 "~" H 750 5100 50  0001 C CNN
	1    750  5100
	1    0    0    -1  
$EndComp
Text GLabel 4600 4750 0    50   Input ~ 0
LED_ERR
Text GLabel 4600 4850 0    50   Input ~ 0
LED_STATUS
Text GLabel 750  5000 1    50   Input ~ 0
LED_STATUS
$Comp
L Switch:SW_Push SW2
U 1 1 5E821B1D
P 4150 3650
F 0 "SW2" V 4196 3602 50  0000 R CNN
F 1 "TARA" V 4105 3602 50  0000 R CNN
F 2 "otter:K2-1102DP-C4SW-04" H 4150 3850 50  0001 C CNN
F 3 "~" H 4150 3850 50  0001 C CNN
	1    4150 3650
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_BJT:BC807 Q1
U 1 1 5E870987
P 8400 1500
F 0 "Q1" V 8728 1500 50  0000 C CNN
F 1 "s8550" V 8637 1500 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 8600 1425 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC807.pdf" H 8400 1500 50  0001 L CNN
	1    8400 1500
	0    -1   -1   0   
$EndComp
Connection ~ 4150 3850
$Comp
L otter:QMA7981 U5
U 1 1 5E8CDC85
P 9650 5800
F 0 "U5" H 9900 6250 50  0000 C CNN
F 1 "QMA7981" H 9900 6150 50  0000 C CNN
F 2 "Package_LGA:LGA-12_2x2mm_P0.5mm" H 9700 6200 50  0001 C CNN
F 3 "" H 9700 6200 50  0001 C CNN
	1    9650 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0152
U 1 1 5E8D575F
P 9650 6250
F 0 "#PWR0152" H 9650 6000 50  0001 C CNN
F 1 "GND" H 9655 6077 50  0000 C CNN
F 2 "" H 9650 6250 50  0001 C CNN
F 3 "" H 9650 6250 50  0001 C CNN
	1    9650 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9600 6200 9650 6200
Wire Wire Line
	9650 6200 9650 6250
Connection ~ 9650 6200
Wire Wire Line
	9650 6200 9700 6200
Wire Wire Line
	9700 5400 9650 5400
$Comp
L power:+3.3V #PWR0156
U 1 1 5E8E5923
P 9650 5350
F 0 "#PWR0156" H 9650 5200 50  0001 C CNN
F 1 "+3.3V" V 9665 5478 50  0000 L CNN
F 2 "" H 9650 5350 50  0001 C CNN
F 3 "" H 9650 5350 50  0001 C CNN
	1    9650 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 5350 9650 5400
Connection ~ 9650 5400
Wire Wire Line
	9650 5400 9600 5400
$Comp
L Device:C_Small C17
U 1 1 5E8F6F26
P 10600 5750
F 0 "C17" H 10692 5796 50  0000 L CNN
F 1 "100n" H 10692 5705 50  0000 L CNN
F 2 "otter:C_0603" H 10600 5750 50  0001 C CNN
F 3 "~" H 10600 5750 50  0001 C CNN
	1    10600 5750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0157
U 1 1 5E8F6F2C
P 10600 5850
F 0 "#PWR0157" H 10600 5600 50  0001 C CNN
F 1 "GND" H 10605 5677 50  0000 C CNN
F 2 "" H 10600 5850 50  0001 C CNN
F 3 "" H 10600 5850 50  0001 C CNN
	1    10600 5850
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0158
U 1 1 5E8F6F32
P 10600 5650
F 0 "#PWR0158" H 10600 5500 50  0001 C CNN
F 1 "+3.3V" V 10615 5778 50  0000 L CNN
F 2 "" H 10600 5650 50  0001 C CNN
F 3 "" H 10600 5650 50  0001 C CNN
	1    10600 5650
	1    0    0    -1  
$EndComp
Text GLabel 4600 5850 0    50   Input ~ 0
ACC_SDA
Text GLabel 4600 5750 0    50   Input ~ 0
ACC_SCL
Text GLabel 9200 5800 0    50   Input ~ 0
ACC_SDA
Text GLabel 9200 5650 0    50   Input ~ 0
ACC_SCL
Text GLabel 3100 3050 0    50   Input ~ 0
ACC_SDA
Text GLabel 3100 2950 0    50   Input ~ 0
ACC_SCL
$Comp
L Device:R_Small R14
U 1 1 5E91F6D2
P 3200 2950
F 0 "R14" V 3304 2950 50  0000 C CNN
F 1 "5k1" V 3200 2950 50  0000 C CNN
F 2 "otter:R_0603" H 3200 2950 50  0001 C CNN
F 3 "~" H 3200 2950 50  0001 C CNN
	1    3200 2950
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R15
U 1 1 5E91F6D8
P 3200 3050
F 0 "R15" V 3304 3050 50  0000 C CNN
F 1 "5k1" V 3200 3050 50  0000 C CNN
F 2 "otter:R_0603" H 3200 3050 50  0001 C CNN
F 3 "~" H 3200 3050 50  0001 C CNN
	1    3200 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	3300 2950 3300 3000
Wire Wire Line
	3300 3000 3350 3000
Connection ~ 3300 3000
Wire Wire Line
	3300 3000 3300 3050
$Comp
L power:+3.3V #PWR0159
U 1 1 5E936659
P 3350 3000
F 0 "#PWR0159" H 3350 2850 50  0001 C CNN
F 1 "+3.3V" V 3365 3128 50  0000 L CNN
F 2 "" H 3350 3000 50  0001 C CNN
F 3 "" H 3350 3000 50  0001 C CNN
	1    3350 3000
	0    1    1    0   
$EndComp
Text GLabel 3100 3450 0    50   Input ~ 0
IPS_SDA
Text GLabel 3100 3350 0    50   Input ~ 0
IPS_SCL
$Comp
L Device:R_Small R16
U 1 1 5E93AE66
P 3200 3350
F 0 "R16" V 3304 3350 50  0000 C CNN
F 1 "5k1" V 3200 3350 50  0000 C CNN
F 2 "otter:R_0603" H 3200 3350 50  0001 C CNN
F 3 "~" H 3200 3350 50  0001 C CNN
	1    3200 3350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R17
U 1 1 5E93AE6C
P 3200 3450
F 0 "R17" V 3304 3450 50  0000 C CNN
F 1 "5k1" V 3200 3450 50  0000 C CNN
F 2 "otter:R_0603" H 3200 3450 50  0001 C CNN
F 3 "~" H 3200 3450 50  0001 C CNN
	1    3200 3450
	0    1    1    0   
$EndComp
Wire Wire Line
	3300 3350 3300 3400
Wire Wire Line
	3300 3400 3350 3400
Connection ~ 3300 3400
Wire Wire Line
	3300 3400 3300 3450
$Comp
L power:+3.3V #PWR0160
U 1 1 5E93AE76
P 3350 3400
F 0 "#PWR0160" H 3350 3250 50  0001 C CNN
F 1 "+3.3V" V 3365 3528 50  0000 L CNN
F 2 "" H 3350 3400 50  0001 C CNN
F 3 "" H 3350 3400 50  0001 C CNN
	1    3350 3400
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0161
U 1 1 5E9450DA
P 10100 5600
F 0 "#PWR0161" H 10100 5350 50  0001 C CNN
F 1 "GND" V 10105 5472 50  0000 R CNN
F 2 "" H 10100 5600 50  0001 C CNN
F 3 "" H 10100 5600 50  0001 C CNN
	1    10100 5600
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C18
U 1 1 5E9512C8
P 10950 5750
F 0 "C18" H 11042 5796 50  0000 L CNN
F 1 "10u" H 11042 5705 50  0000 L CNN
F 2 "otter:C_0603" H 10950 5750 50  0001 C CNN
F 3 "~" H 10950 5750 50  0001 C CNN
	1    10950 5750
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0162
U 1 1 5E95583A
P 10950 5650
F 0 "#PWR0162" H 10950 5500 50  0001 C CNN
F 1 "+3.3V" V 10965 5778 50  0000 L CNN
F 2 "" H 10950 5650 50  0001 C CNN
F 3 "" H 10950 5650 50  0001 C CNN
	1    10950 5650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0163
U 1 1 5E95989A
P 10950 5850
F 0 "#PWR0163" H 10950 5600 50  0001 C CNN
F 1 "GND" H 10955 5677 50  0000 C CNN
F 2 "" H 10950 5850 50  0001 C CNN
F 3 "" H 10950 5850 50  0001 C CNN
	1    10950 5850
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0164
U 1 1 5E95F0A4
P 9200 5950
F 0 "#PWR0164" H 9200 5800 50  0001 C CNN
F 1 "+3.3V" V 9215 6078 50  0000 L CNN
F 2 "" H 9200 5950 50  0001 C CNN
F 3 "" H 9200 5950 50  0001 C CNN
	1    9200 5950
	0    -1   -1   0   
$EndComp
NoConn ~ 10100 5700
$Comp
L power:GND #PWR0165
U 1 1 5E973F0D
P 10100 5800
F 0 "#PWR0165" H 10100 5550 50  0001 C CNN
F 1 "GND" V 10105 5672 50  0000 R CNN
F 2 "" H 10100 5800 50  0001 C CNN
F 3 "" H 10100 5800 50  0001 C CNN
	1    10100 5800
	0    -1   -1   0   
$EndComp
NoConn ~ 10100 5900
NoConn ~ 10100 6000
$Comp
L Device:C_Small C19
U 1 1 5EA1E6C8
P 6050 4750
F 0 "C19" V 6279 4750 50  0000 C CNN
F 1 "100n" V 6188 4750 50  0000 C CNN
F 2 "otter:C_0603" H 6050 4750 50  0001 C CNN
F 3 "~" H 6050 4750 50  0001 C CNN
	1    6050 4750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5950 4750 5900 4750
Text GLabel 5900 4850 2    50   Input ~ 0
TSC_01
Text GLabel 5900 4950 2    50   Input ~ 0
TSC_02
Text GLabel 5900 5050 2    50   Input ~ 0
TSC_03
$Comp
L Connector:Screw_Terminal_01x01 J6
U 1 1 5EA6CD60
P 7650 3800
F 0 "J6" H 7730 3842 50  0000 L CNN
F 1 "TOUCH" H 7730 3751 50  0000 L CNN
F 2 "otter:Touchpad_1305_0925" H 7650 3800 50  0001 C CNN
F 3 "~" H 7650 3800 50  0001 C CNN
	1    7650 3800
	1    0    0    -1  
$EndComp
Text GLabel 7450 3800 0    50   Input ~ 0
TSC_01
$Comp
L power:GND #PWR0101
U 1 1 5EA96641
P 8500 3200
F 0 "#PWR0101" H 8500 2950 50  0001 C CNN
F 1 "GND" V 8505 3072 50  0000 R CNN
F 2 "" H 8500 3200 50  0001 C CNN
F 3 "" H 8500 3200 50  0001 C CNN
	1    8500 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5EAAAF73
P 8050 3200
F 0 "#PWR0102" H 8050 2950 50  0001 C CNN
F 1 "GND" V 8055 3072 50  0000 R CNN
F 2 "" H 8050 3200 50  0001 C CNN
F 3 "" H 8050 3200 50  0001 C CNN
	1    8050 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5EAAE9A9
P 7250 3250
F 0 "#PWR0103" H 7250 3000 50  0001 C CNN
F 1 "GND" V 7255 3122 50  0000 R CNN
F 2 "" H 7250 3250 50  0001 C CNN
F 3 "" H 7250 3250 50  0001 C CNN
	1    7250 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5EAB7422
P 7200 2650
F 0 "#PWR0104" H 7200 2400 50  0001 C CNN
F 1 "GND" V 7205 2522 50  0000 R CNN
F 2 "" H 7200 2650 50  0001 C CNN
F 3 "" H 7200 2650 50  0001 C CNN
	1    7200 2650
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 5EABAE89
P 7200 2800
F 0 "#PWR0105" H 7200 2550 50  0001 C CNN
F 1 "GND" V 7205 2672 50  0000 R CNN
F 2 "" H 7200 2800 50  0001 C CNN
F 3 "" H 7200 2800 50  0001 C CNN
	1    7200 2800
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 5EACE422
P 9300 1650
F 0 "#PWR0107" H 9300 1400 50  0001 C CNN
F 1 "GND" V 9305 1522 50  0000 R CNN
F 2 "" H 9300 1650 50  0001 C CNN
F 3 "" H 9300 1650 50  0001 C CNN
	1    9300 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5EAD1DCA
P 9650 1650
F 0 "#PWR0108" H 9650 1400 50  0001 C CNN
F 1 "GND" V 9655 1522 50  0000 R CNN
F 2 "" H 9650 1650 50  0001 C CNN
F 3 "" H 9650 1650 50  0001 C CNN
	1    9650 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5EAD692B
P 7700 1700
F 0 "#PWR0109" H 7700 1450 50  0001 C CNN
F 1 "GND" V 7705 1572 50  0000 R CNN
F 2 "" H 7700 1700 50  0001 C CNN
F 3 "" H 7700 1700 50  0001 C CNN
	1    7700 1700
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5EADA634
P 6200 1750
F 0 "#PWR0110" H 6200 1500 50  0001 C CNN
F 1 "GND" V 6205 1622 50  0000 R CNN
F 2 "" H 6200 1750 50  0001 C CNN
F 3 "" H 6200 1750 50  0001 C CNN
	1    6200 1750
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 5EADE04E
P 6800 1650
F 0 "#PWR0111" H 6800 1400 50  0001 C CNN
F 1 "GND" V 6805 1522 50  0000 R CNN
F 2 "" H 6800 1650 50  0001 C CNN
F 3 "" H 6800 1650 50  0001 C CNN
	1    6800 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 5EAE1A83
P 7150 1650
F 0 "#PWR0112" H 7150 1400 50  0001 C CNN
F 1 "GND" V 7155 1522 50  0000 R CNN
F 2 "" H 7150 1650 50  0001 C CNN
F 3 "" H 7150 1650 50  0001 C CNN
	1    7150 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0153
U 1 1 5EAEAE74
P 6150 4750
F 0 "#PWR0153" H 6150 4500 50  0001 C CNN
F 1 "GND" V 6155 4622 50  0000 R CNN
F 2 "" H 6150 4750 50  0001 C CNN
F 3 "" H 6150 4750 50  0001 C CNN
	1    6150 4750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6550 1850 6200 1850
Wire Wire Line
	6550 1850 6550 2350
Wire Wire Line
	6200 1950 6700 1950
Wire Wire Line
	6700 1950 6700 2150
$Comp
L otter:TP4056 U6
U 1 1 5E69DFD2
P 2000 7100
F 0 "U6" H 2000 7515 50  0000 C CNN
F 1 "TP4056" H 2000 7424 50  0000 C CNN
F 2 "Package_SO:SOP-8_3.9x4.9mm_P1.27mm" H 2000 7100 50  0001 C CNN
F 3 "" H 2000 7100 50  0001 C CNN
	1    2000 7100
	1    0    0    -1  
$EndComp
$Comp
L Jumper:Jumper_3_Bridged12 JP1
U 1 1 5E6B4A0A
P 3300 1250
F 0 "JP1" V 3346 1317 50  0000 L CNN
F 1 "BATT" V 3255 1317 50  0000 L CNN
F 2 "otter:J_0603_90" H 3300 1250 50  0001 C CNN
F 3 "~" H 3300 1250 50  0001 C CNN
	1    3300 1250
	0    -1   -1   0   
$EndComp
$Comp
L power:VBUS #PWR0141
U 1 1 5E6BE96C
P 750 6950
F 0 "#PWR0141" H 750 6800 50  0001 C CNN
F 1 "VBUS" V 765 7078 50  0000 L CNN
F 2 "" H 750 6950 50  0001 C CNN
F 3 "" H 750 6950 50  0001 C CNN
	1    750  6950
	0    -1   -1   0   
$EndComp
Text GLabel 3300 1000 1    50   Input ~ 0
VBat
Text Notes 7850 -650 0    50   ~ 0
TODO:\nLED
Wire Wire Line
	1600 7050 1500 7050
Wire Wire Line
	1500 7050 1500 6950
Wire Wire Line
	1500 6950 1600 6950
Connection ~ 1500 6950
$Comp
L Device:R_Small R12
U 1 1 5E6F63E6
P 2700 7350
F 0 "R12" V 2804 7350 50  0000 C CNN
F 1 "5k1" V 2700 7350 50  0000 C CNN
F 2 "otter:R_0603" H 2700 7350 50  0001 C CNN
F 3 "~" H 2700 7350 50  0001 C CNN
	1    2700 7350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0142
U 1 1 5E6F63EC
P 2700 7450
F 0 "#PWR0142" H 2700 7200 50  0001 C CNN
F 1 "GND" H 2705 7277 50  0000 C CNN
F 2 "" H 2700 7450 50  0001 C CNN
F 3 "" H 2700 7450 50  0001 C CNN
	1    2700 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 7150 2700 7150
Wire Wire Line
	2700 7150 2700 7250
$Comp
L power:GND #PWR0148
U 1 1 5E6FEDCB
P 2500 7450
F 0 "#PWR0148" H 2500 7200 50  0001 C CNN
F 1 "GND" H 2505 7277 50  0000 C CNN
F 2 "" H 2500 7450 50  0001 C CNN
F 3 "" H 2500 7450 50  0001 C CNN
	1    2500 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 7450 2500 7250
Wire Wire Line
	2500 7250 2400 7250
NoConn ~ 1600 7250
$Comp
L Connector_Generic_MountingPin:Conn_01x02_MountingPin J3
U 1 1 5E70FE29
P 3850 6950
F 0 "J3" H 3938 6864 50  0000 L CNN
F 1 "Batt" H 3938 6773 50  0000 L CNN
F 2 "Connector_JST:JST_GH_SM02B-GHS-TB_1x02-1MP_P1.25mm_Horizontal" H 3850 6950 50  0001 C CNN
F 3 "~" H 3850 6950 50  0001 C CNN
	1    3850 6950
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R19
U 1 1 5E717AB8
P 3000 7200
F 0 "R19" V 3104 7200 50  0000 C CNN
F 1 "5k1" V 3000 7200 50  0000 C CNN
F 2 "otter:R_0603" H 3000 7200 50  0001 C CNN
F 3 "~" H 3000 7200 50  0001 C CNN
	1    3000 7200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R18
U 1 1 5E71BD86
P 3000 6750
F 0 "R18" V 3104 6750 50  0000 C CNN
F 1 "5k1" V 3000 6750 50  0000 C CNN
F 2 "otter:R_0603" H 3000 6750 50  0001 C CNN
F 3 "~" H 3000 6750 50  0001 C CNN
	1    3000 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 7100 3000 7050
$Comp
L power:GND #PWR0149
U 1 1 5E72EB1E
P 3000 7300
F 0 "#PWR0149" H 3000 7050 50  0001 C CNN
F 1 "GND" H 3005 7127 50  0000 C CNN
F 2 "" H 3000 7300 50  0001 C CNN
F 3 "" H 3000 7300 50  0001 C CNN
	1    3000 7300
	1    0    0    -1  
$EndComp
Connection ~ 3000 7050
$Comp
L power:VBUS #PWR0151
U 1 1 5E737464
P 3000 6650
F 0 "#PWR0151" H 3000 6500 50  0001 C CNN
F 1 "VBUS" H 3015 6823 50  0000 C CNN
F 2 "" H 3000 6650 50  0001 C CNN
F 3 "" H 3000 6650 50  0001 C CNN
	1    3000 6650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C21
U 1 1 5E7442D9
P 3250 7100
F 0 "C21" H 3342 7146 50  0000 L CNN
F 1 "10u" H 3342 7055 50  0000 L CNN
F 2 "otter:C_0603" H 3250 7100 50  0001 C CNN
F 3 "~" H 3250 7100 50  0001 C CNN
	1    3250 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 7050 3000 7050
Wire Wire Line
	3000 6850 3000 7050
$Comp
L power:GND #PWR0155
U 1 1 5E77A857
P 3250 7200
F 0 "#PWR0155" H 3250 6950 50  0001 C CNN
F 1 "GND" H 3255 7027 50  0000 C CNN
F 2 "" H 3250 7200 50  0001 C CNN
F 3 "" H 3250 7200 50  0001 C CNN
	1    3250 7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0166
U 1 1 5E77EFDB
P 3650 7050
F 0 "#PWR0166" H 3650 6800 50  0001 C CNN
F 1 "GND" H 3655 6877 50  0000 C CNN
F 2 "" H 3650 7050 50  0001 C CNN
F 3 "" H 3650 7050 50  0001 C CNN
	1    3650 7050
	1    0    0    -1  
$EndComp
Text GLabel 3450 6950 1    50   Input ~ 0
VBat
$Comp
L Device:LED D1
U 1 1 5E7B0FB2
P 1350 7150
F 0 "D1" H 1343 7273 50  0000 C CNN
F 1 "CHARGING" H 1343 7364 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 1350 7150 50  0001 C CNN
F 3 "~" H 1350 7150 50  0001 C CNN
	1    1350 7150
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R11
U 1 1 5E7B0FB8
P 1100 7050
F 0 "R11" V 1204 7050 50  0000 C CNN
F 1 "5k1" V 1100 7050 50  0000 C CNN
F 2 "otter:R_0603" H 1100 7050 50  0001 C CNN
F 3 "~" H 1100 7050 50  0001 C CNN
	1    1100 7050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 7150 1500 7150
Wire Wire Line
	1200 7150 1100 7150
Connection ~ 1100 6950
Wire Wire Line
	1100 6950 1500 6950
Connection ~ 3250 6950
Wire Wire Line
	2400 6950 3250 6950
Wire Wire Line
	3250 7000 3250 6950
Wire Wire Line
	3250 6950 3650 6950
$Comp
L Device:C_Small C20
U 1 1 5E8D67C5
P 800 7100
F 0 "C20" H 892 7146 50  0000 L CNN
F 1 "10u" H 892 7055 50  0000 L CNN
F 2 "otter:C_0603" H 800 7100 50  0001 C CNN
F 3 "~" H 800 7100 50  0001 C CNN
	1    800  7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0136
U 1 1 5E8D67CB
P 800 7200
F 0 "#PWR0136" H 800 6950 50  0001 C CNN
F 1 "GND" H 805 7027 50  0000 C CNN
F 2 "" H 800 7200 50  0001 C CNN
F 3 "" H 800 7200 50  0001 C CNN
	1    800  7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  7000 800  6950
Wire Wire Line
	800  6950 750  6950
Wire Wire Line
	800  6950 1100 6950
Connection ~ 800  6950
$Comp
L power:GND #PWR?
U 1 1 5E9164E2
P 3850 7250
F 0 "#PWR?" H 3850 7000 50  0001 C CNN
F 1 "GND" H 3855 7077 50  0000 C CNN
F 2 "" H 3850 7250 50  0001 C CNN
F 3 "" H 3850 7250 50  0001 C CNN
	1    3850 7250
	1    0    0    -1  
$EndComp
$EndSCHEMATC
