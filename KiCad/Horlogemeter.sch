EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Horlogemeter"
Date "2021-01-25"
Rev "1.2"
Comp "Jeroen Venema"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Microchip_ATmega:ATmega328P-PU U1
U 1 1 5FF075FF
P 1100 3000
F 0 "U1" H 456 3046 50  0000 R CNN
F 1 "ATmega328P-PU" H 1300 2300 50  0000 R CNN
F 2 "Package_DIP:DIP-28_W7.62mm" H 1100 3000 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 1100 3000 50  0001 C CNN
	1    1100 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y1
U 1 1 5FF0C179
P 2500 2500
F 0 "Y1" H 2500 2768 50  0000 C CNN
F 1 "16Mhz" H 2500 2677 50  0000 C CNN
F 2 "Crystal:Crystal_HC18-U_Vertical" H 2500 2500 50  0001 C CNN
F 3 "~" H 2500 2500 50  0001 C CNN
	1    2500 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 2400 2350 2150
Wire Wire Line
	2350 2150 2650 2150
Wire Wire Line
	2650 2150 2650 2500
Wire Wire Line
	1700 2400 2350 2400
Wire Wire Line
	1700 2500 2150 2500
$Comp
L Device:C C3
U 1 1 5FF0F7EA
P 2150 2650
F 0 "C3" H 2265 2696 50  0000 L CNN
F 1 "22p" H 2265 2605 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 2188 2500 50  0001 C CNN
F 3 "~" H 2150 2650 50  0001 C CNN
	1    2150 2650
	1    0    0    -1  
$EndComp
Connection ~ 2150 2500
Wire Wire Line
	2150 2500 2350 2500
$Comp
L Device:C C5
U 1 1 5FF0FD5C
P 2850 2650
F 0 "C5" H 2965 2696 50  0000 L CNN
F 1 "22p" H 2965 2605 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 2888 2500 50  0001 C CNN
F 3 "~" H 2850 2650 50  0001 C CNN
	1    2850 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 2500 2850 2500
Connection ~ 2650 2500
$Comp
L power:GND #PWR06
U 1 1 5FF108A3
P 2500 2800
F 0 "#PWR06" H 2500 2550 50  0001 C CNN
F 1 "GND" H 2505 2627 50  0000 C CNN
F 2 "" H 2500 2800 50  0001 C CNN
F 3 "" H 2500 2800 50  0001 C CNN
	1    2500 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 2800 2500 2800
Wire Wire Line
	2500 2800 2850 2800
Connection ~ 2500 2800
$Comp
L power:GND #PWR04
U 1 1 5FF13E8C
P 1100 4500
F 0 "#PWR04" H 1100 4250 50  0001 C CNN
F 1 "GND" H 1105 4327 50  0000 C CNN
F 2 "" H 1100 4500 50  0001 C CNN
F 3 "" H 1100 4500 50  0001 C CNN
	1    1100 4500
	1    0    0    -1  
$EndComp
$Comp
L Connector:AVR-ISP-6 J2
U 1 1 5FF14B9C
P 2250 950
F 0 "J2" V 1783 1000 50  0000 C CNN
F 1 "AVR-ISP-6" V 1874 1000 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" V 2000 1000 50  0001 C CNN
F 3 " ~" H 975 400 50  0001 C CNN
	1    2250 950 
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5FF1E7EC
P 1850 850
F 0 "#PWR05" H 1850 600 50  0001 C CNN
F 1 "GND" H 1855 677 50  0000 C CNN
F 2 "" H 1850 850 50  0001 C CNN
F 3 "" H 1850 850 50  0001 C CNN
	1    1850 850 
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR07
U 1 1 5FF1ED38
P 2750 850
F 0 "#PWR07" H 2750 700 50  0001 C CNN
F 1 "VCC" H 2765 1023 50  0000 C CNN
F 2 "" H 2750 850 50  0001 C CNN
F 3 "" H 2750 850 50  0001 C CNN
	1    2750 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 1350 2150 1500
Wire Wire Line
	2150 1500 1900 1500
Wire Wire Line
	1900 1500 1900 3300
Wire Wire Line
	1900 3300 1700 3300
Wire Wire Line
	2250 1350 2250 2300
Wire Wire Line
	2250 2300 1700 2300
Wire Wire Line
	2350 1350 2350 2100
Wire Wire Line
	2350 2100 1700 2100
Wire Wire Line
	2450 2000 2150 2000
Wire Wire Line
	2150 2000 2150 2200
Wire Wire Line
	2150 2200 1700 2200
Wire Wire Line
	2450 1350 2450 2000
$Comp
L power:VCC #PWR03
U 1 1 5FF22F44
P 1100 1500
F 0 "#PWR03" H 1100 1350 50  0001 C CNN
F 1 "VCC" H 1115 1673 50  0000 C CNN
F 2 "" H 1100 1500 50  0001 C CNN
F 3 "" H 1100 1500 50  0001 C CNN
	1    1100 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5FF27A85
P 950 7350
F 0 "C1" H 1065 7396 50  0000 L CNN
F 1 "100n" H 1065 7305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 988 7200 50  0001 C CNN
F 3 "~" H 950 7350 50  0001 C CNN
	1    950  7350
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR01
U 1 1 5FF287B6
P 950 7200
F 0 "#PWR01" H 950 7050 50  0001 C CNN
F 1 "VCC" H 965 7373 50  0000 C CNN
F 2 "" H 950 7200 50  0001 C CNN
F 3 "" H 950 7200 50  0001 C CNN
	1    950  7200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5FF2A097
P 950 7500
F 0 "#PWR02" H 950 7250 50  0001 C CNN
F 1 "GND" H 955 7327 50  0000 C CNN
F 2 "" H 950 7500 50  0001 C CNN
F 3 "" H 950 7500 50  0001 C CNN
	1    950  7500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 4400 6650 5150
Connection ~ 6650 4400
Wire Wire Line
	6350 4400 6650 4400
Connection ~ 6650 5150
Wire Wire Line
	6650 4000 6650 4400
Wire Wire Line
	6350 4000 6650 4000
Wire Wire Line
	6500 5150 6650 5150
Connection ~ 5750 4400
Wire Wire Line
	5750 4000 5750 4400
Wire Wire Line
	6050 4000 5750 4000
Wire Wire Line
	5750 5250 5900 5250
Connection ~ 5750 5250
Wire Wire Line
	5750 4400 5750 5250
Wire Wire Line
	6050 4400 5750 4400
Wire Wire Line
	5500 5850 5350 5850
Wire Wire Line
	5500 5050 5900 5050
Wire Wire Line
	5500 5050 5500 5850
$Comp
L Device:R R7
U 1 1 5FF8F1BC
P 6200 4400
F 0 "R7" V 5993 4400 50  0000 C CNN
F 1 "470k" V 6084 4400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6130 4400 50  0001 C CNN
F 3 "~" H 6200 4400 50  0001 C CNN
	1    6200 4400
	0    1    1    0   
$EndComp
$Comp
L Device:C C13
U 1 1 5FF8E620
P 6200 4000
F 0 "C13" V 5948 4000 50  0000 C CNN
F 1 "100p" V 6039 4000 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 6238 3850 50  0001 C CNN
F 3 "~" H 6200 4000 50  0001 C CNN
	1    6200 4000
	0    1    1    0   
$EndComp
Wire Wire Line
	3300 4000 3300 4400
Wire Wire Line
	4550 4000 4550 4400
Wire Wire Line
	4550 4400 4550 5250
Connection ~ 4550 4400
Connection ~ 3300 4400
Wire Wire Line
	5350 6300 4900 6300
Wire Wire Line
	5350 6250 5350 6300
Wire Wire Line
	5350 5850 4900 5850
Connection ~ 5350 5850
Wire Wire Line
	5350 5950 5350 5850
Wire Wire Line
	4850 5250 5000 5250
Wire Wire Line
	5300 5250 5750 5250
$Comp
L Device:C C11
U 1 1 5FF751E3
P 5350 6100
F 0 "C11" H 5465 6146 50  0000 L CNN
F 1 "100n" H 5465 6055 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 5388 5950 50  0001 C CNN
F 3 "~" H 5350 6100 50  0001 C CNN
	1    5350 6100
	1    0    0    -1  
$EndComp
Connection ~ 4900 6300
Wire Wire Line
	4900 6250 4900 6300
Wire Wire Line
	4900 5850 4900 5950
Connection ~ 4900 5850
Wire Wire Line
	3300 5850 4900 5850
Wire Wire Line
	3300 5350 3300 5850
Wire Wire Line
	4900 5000 4900 5850
Wire Wire Line
	2600 6300 3800 6300
Wire Wire Line
	2600 5250 2600 6300
Wire Wire Line
	2550 5250 2600 5250
$Comp
L power:GND #PWR010
U 1 1 5FF6D906
P 4900 6300
F 0 "#PWR010" H 4900 6050 50  0001 C CNN
F 1 "GND" H 4905 6127 50  0000 C CNN
F 2 "" H 4900 6300 50  0001 C CNN
F 3 "" H 4900 6300 50  0001 C CNN
	1    4900 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 5350 3300 5350
$Comp
L Device:R R5
U 1 1 5FF6B09E
P 4900 6100
F 0 "R5" H 4970 6146 50  0000 L CNN
F 1 "10k" H 4970 6055 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4830 6100 50  0001 C CNN
F 3 "~" H 4900 6100 50  0001 C CNN
	1    4900 6100
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR08
U 1 1 5FF6A2C3
P 3800 4750
F 0 "#PWR08" H 3800 4600 50  0001 C CNN
F 1 "+12V" H 3815 4923 50  0000 C CNN
F 2 "" H 3800 4750 50  0001 C CNN
F 3 "" H 3800 4750 50  0001 C CNN
	1    3800 4750
	1    0    0    -1  
$EndComp
Connection ~ 4550 5250
Wire Wire Line
	3300 5150 3300 4400
$Comp
L Device:R R4
U 1 1 5FF57C7D
P 4900 4850
F 0 "R4" H 4970 4896 50  0000 L CNN
F 1 "10k" H 4970 4805 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4830 4850 50  0001 C CNN
F 3 "~" H 4900 4850 50  0001 C CNN
	1    4900 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5FF57511
P 5150 5250
F 0 "R6" V 4943 5250 50  0000 C CNN
F 1 "4k7" V 5034 5250 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5080 5250 50  0001 C CNN
F 3 "~" H 5150 5250 50  0001 C CNN
	1    5150 5250
	0    1    1    0   
$EndComp
$Comp
L Device:C C10
U 1 1 5FF518B0
P 4700 5250
F 0 "C10" V 4448 5250 50  0000 C CNN
F 1 "10n" V 4539 5250 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 4738 5100 50  0001 C CNN
F 3 "~" H 4700 5250 50  0001 C CNN
	1    4700 5250
	0    1    1    0   
$EndComp
Wire Wire Line
	4100 4400 4550 4400
Wire Wire Line
	4100 4000 4550 4000
Wire Wire Line
	3800 4400 3300 4400
Wire Wire Line
	3300 5150 3400 5150
Connection ~ 3300 5150
Wire Wire Line
	3800 4000 3300 4000
$Comp
L Device:C C8
U 1 1 5FF3AA83
P 3950 4000
F 0 "C8" V 3698 4000 50  0000 C CNN
F 1 "220p" V 3789 4000 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 3988 3850 50  0001 C CNN
F 3 "~" H 3950 4000 50  0001 C CNN
	1    3950 4000
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5FF39FBA
P 3950 4400
F 0 "R3" V 3743 4400 50  0000 C CNN
F 1 "470k" V 3834 4400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3880 4400 50  0001 C CNN
F 3 "~" H 3950 4400 50  0001 C CNN
	1    3950 4400
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 5150 3300 5150
Wire Wire Line
	2850 5150 2950 5150
$Comp
L Device:R R2
U 1 1 5FF38C3E
P 3100 5150
F 0 "R2" V 2893 5150 50  0000 C CNN
F 1 "4k7" V 2984 5150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 3030 5150 50  0001 C CNN
F 3 "~" H 3100 5150 50  0001 C CNN
	1    3100 5150
	0    1    1    0   
$EndComp
$Comp
L Device:C C4
U 1 1 5FF38542
P 2700 5150
F 0 "C4" V 2952 5150 50  0000 C CNN
F 1 "100n" V 2861 5150 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 2738 5000 50  0001 C CNN
F 3 "~" H 2700 5150 50  0001 C CNN
	1    2700 5150
	0    -1   -1   0   
$EndComp
$Comp
L Amplifier_Operational:TL072 U2
U 1 1 5FF34512
P 6200 5150
F 0 "U2" H 6200 5517 50  0000 C CNN
F 1 "TL072" H 6200 5426 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 6200 5150 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 6200 5150 50  0001 C CNN
	1    6200 5150
	1    0    0    -1  
$EndComp
$Comp
L Venema:OPA37GP U3
U 1 1 5FF33973
P 3900 4400
F 0 "U3" H 4550 3350 50  0000 L CNN
F 1 "OPA37GP" H 4400 3250 50  0000 L CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 3900 4400 50  0001 C CNN
F 3 "" H 3900 4400 50  0001 C CNN
	1    3900 4400
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:TL072 U2
U 2 1 60003A09
P 7600 5050
F 0 "U2" H 7600 5417 50  0000 C CNN
F 1 "TL072" H 7600 5326 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 7600 5050 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 7600 5050 50  0001 C CNN
	2    7600 5050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV1
U 1 1 60006766
P 6850 5700
F 0 "RV1" H 6780 5654 50  0000 R CNN
F 1 "10k" H 6780 5745 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Piher_PT-10-V05_Vertical" H 6850 5700 50  0001 C CNN
F 3 "~" H 6850 5700 50  0001 C CNN
	1    6850 5700
	-1   0    0    1   
$EndComp
Connection ~ 5350 6300
$Comp
L Device:R R9
U 1 1 600190F0
P 7150 6100
F 0 "R9" H 7220 6146 50  0000 L CNN
F 1 "10k" H 7220 6055 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7080 6100 50  0001 C CNN
F 3 "~" H 7150 6100 50  0001 C CNN
	1    7150 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 6002BB05
P 7150 4100
F 0 "R8" H 7220 4146 50  0000 L CNN
F 1 "10k" H 7220 4055 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7080 4100 50  0001 C CNN
F 3 "~" H 7150 4100 50  0001 C CNN
	1    7150 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 3700 4900 3700
$Comp
L power:VCC #PWR011
U 1 1 5FF5964F
P 5400 3700
F 0 "#PWR011" H 5400 3550 50  0001 C CNN
F 1 "VCC" H 5415 3873 50  0000 C CNN
F 2 "" H 5400 3700 50  0001 C CNN
F 3 "" H 5400 3700 50  0001 C CNN
	1    5400 3700
	1    0    0    -1  
$EndComp
Connection ~ 5400 3700
Wire Wire Line
	4900 4700 4900 3700
Connection ~ 4900 3700
Wire Wire Line
	4900 3700 5400 3700
Wire Wire Line
	7150 6250 7150 6300
$Comp
L Device:C C16
U 1 1 6004928C
P 7600 4450
F 0 "C16" V 7348 4450 50  0000 C CNN
F 1 "1u" V 7439 4450 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 7638 4300 50  0001 C CNN
F 3 "~" H 7600 4450 50  0001 C CNN
	1    7600 4450
	0    1    1    0   
$EndComp
Wire Wire Line
	7450 4450 7300 4450
Wire Wire Line
	7300 4450 7300 4550
Wire Wire Line
	7750 4450 7900 4450
Wire Wire Line
	7900 4450 7900 5050
Wire Wire Line
	5400 3700 7150 3700
Wire Wire Line
	7150 3950 7150 3700
Connection ~ 7150 3700
$Comp
L Device:C C17
U 1 1 6005D429
P 8250 4450
F 0 "C17" H 8135 4404 50  0000 R CNN
F 1 "10n" H 8135 4495 50  0000 R CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 8288 4300 50  0001 C CNN
F 3 "~" H 8250 4450 50  0001 C CNN
	1    8250 4450
	-1   0    0    1   
$EndComp
$Comp
L Device:R R11
U 1 1 6005DBA2
P 8600 4750
F 0 "R11" H 8670 4796 50  0000 L CNN
F 1 "10k" H 8670 4705 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 8530 4750 50  0001 C CNN
F 3 "~" H 8600 4750 50  0001 C CNN
	1    8600 4750
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC327 Q1
U 1 1 6005E861
P 9200 4750
F 0 "Q1" V 9435 4750 50  0000 C CNN
F 1 "BC327" V 9526 4750 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline_Wide" H 9400 4675 50  0001 L CIN
F 3 "http://www.onsemi.com/pub_link/Collateral/BC327-D.PDF" H 9200 4750 50  0001 L CNN
	1    9200 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	7900 5050 8250 5050
Wire Wire Line
	8250 5050 8250 4600
Connection ~ 7900 5050
Wire Wire Line
	8250 5050 8600 5050
Wire Wire Line
	8600 5050 8600 4900
Connection ~ 8250 5050
Wire Wire Line
	8250 4100 8250 4300
Wire Wire Line
	8600 4600 8600 4100
Connection ~ 8600 4100
Wire Wire Line
	8600 4100 8250 4100
$Comp
L Device:LED D2
U 1 1 600758F0
P 9600 5900
F 0 "D2" V 9639 5782 50  0000 R CNN
F 1 "Pulse" V 9548 5782 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 9600 5900 50  0001 C CNN
F 3 "~" H 9600 5900 50  0001 C CNN
	1    9600 5900
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R12
U 1 1 60076810
P 9600 5450
F 0 "R12" H 9670 5496 50  0000 L CNN
F 1 "1k" H 9670 5405 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 9530 5450 50  0001 C CNN
F 3 "~" H 9600 5450 50  0001 C CNN
	1    9600 5450
	1    0    0    -1  
$EndComp
Connection ~ 7150 6300
Wire Wire Line
	6650 5150 6850 5150
Wire Wire Line
	6850 5850 6850 6300
Connection ~ 6850 6300
Wire Wire Line
	6850 6300 7150 6300
Wire Wire Line
	6850 5550 6850 5150
Connection ~ 6850 5150
Wire Wire Line
	6850 5150 7300 5150
$Comp
L Device:C C14
U 1 1 600A1A90
P 6550 5700
F 0 "C14" V 6298 5700 50  0000 C CNN
F 1 "100n" V 6389 5700 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 6588 5550 50  0001 C CNN
F 3 "~" H 6550 5700 50  0001 C CNN
	1    6550 5700
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 600AE261
P 2550 4400
F 0 "R1" H 2480 4354 50  0000 R CNN
F 1 "22k" H 2480 4445 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 2480 4400 50  0001 C CNN
F 3 "~" H 2550 4400 50  0001 C CNN
	1    2550 4400
	-1   0    0    1   
$EndComp
Wire Wire Line
	2550 3700 2550 4250
Wire Wire Line
	2550 4550 2550 5150
Wire Wire Line
	3800 5750 3800 6300
Connection ~ 3800 6300
Wire Wire Line
	3800 6300 4900 6300
Wire Wire Line
	7150 3700 8850 3700
Wire Wire Line
	9600 5600 9600 5700
Wire Wire Line
	9600 6300 9600 6050
Wire Wire Line
	9200 4100 9200 4550
Wire Wire Line
	8600 4100 9200 4100
Wire Wire Line
	8850 3700 8850 4850
Wire Wire Line
	8850 4850 9000 4850
Wire Wire Line
	7150 6300 9250 6300
Wire Wire Line
	9600 4850 9600 5300
Wire Wire Line
	9400 4850 9600 4850
Wire Wire Line
	9600 3400 9600 4850
Connection ~ 9600 4850
$Comp
L Device:C C6
U 1 1 60155A72
P 3250 7350
F 0 "C6" H 3365 7396 50  0000 L CNN
F 1 "100n" H 3365 7305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 3288 7200 50  0001 C CNN
F 3 "~" H 3250 7350 50  0001 C CNN
	1    3250 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 601560BF
P 3650 7350
F 0 "C7" H 3765 7396 50  0000 L CNN
F 1 "100n" H 3765 7305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 3688 7200 50  0001 C CNN
F 3 "~" H 3650 7350 50  0001 C CNN
	1    3650 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C9
U 1 1 6015668A
P 4050 7350
F 0 "C9" H 4165 7396 50  0000 L CNN
F 1 "100n" H 4165 7305 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.4mm_W2.1mm_P2.50mm" H 4088 7200 50  0001 C CNN
F 3 "~" H 4050 7350 50  0001 C CNN
	1    4050 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C2
U 1 1 60157AFD
P 1900 7350
F 0 "C2" H 2018 7396 50  0000 L CNN
F 1 "10u" H 2018 7305 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 1938 7200 50  0001 C CNN
F 3 "~" H 1900 7350 50  0001 C CNN
	1    1900 7350
	1    0    0    -1  
$EndComp
Connection ~ 950  7500
Connection ~ 1900 7500
Wire Wire Line
	1900 7500 2850 7500
Connection ~ 3250 7500
Wire Wire Line
	3250 7500 3650 7500
Connection ~ 3650 7500
Wire Wire Line
	3650 7500 4050 7500
Connection ~ 950  7200
$Comp
L power:+12V #PWR09
U 1 1 60167494
P 3850 6900
F 0 "#PWR09" H 3850 6750 50  0001 C CNN
F 1 "+12V" H 3865 7073 50  0000 C CNN
F 2 "" H 3850 6900 50  0001 C CNN
F 3 "" H 3850 6900 50  0001 C CNN
	1    3850 6900
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:TL072 U2
U 3 1 5FF0FA7A
P 2950 7200
F 0 "U2" H 2908 7246 50  0000 L CNN
F 1 "TL072" H 2908 7155 50  0000 L CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 2950 7200 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 2950 7200 50  0001 C CNN
	3    2950 7200
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR012
U 1 1 5FF39C59
P 5450 800
F 0 "#PWR012" H 5450 650 50  0001 C CNN
F 1 "+12V" H 5465 973 50  0000 C CNN
F 2 "" H 5450 800 50  0001 C CNN
F 3 "" H 5450 800 50  0001 C CNN
	1    5450 800 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR013
U 1 1 5FF3AAFB
P 5450 1650
F 0 "#PWR013" H 5450 1400 50  0001 C CNN
F 1 "GND" H 5455 1477 50  0000 C CNN
F 2 "" H 5450 1650 50  0001 C CNN
F 3 "" H 5450 1650 50  0001 C CNN
	1    5450 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 950  5450 800 
$Comp
L Regulator_Linear:L7805 U4
U 1 1 5FF43884
P 6450 950
F 0 "U4" H 6450 1192 50  0000 C CNN
F 1 "L7805" H 6450 1101 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 6475 800 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 6450 900 50  0001 C CNN
	1    6450 950 
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C12
U 1 1 5FF488B1
P 5900 1200
F 0 "C12" H 6018 1246 50  0000 L CNN
F 1 "220u" H 6018 1155 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 5938 1050 50  0001 C CNN
F 3 "~" H 5900 1200 50  0001 C CNN
	1    5900 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 950  5900 950 
Connection ~ 5450 950 
Wire Wire Line
	5900 1050 5900 950 
Connection ~ 5900 950 
Wire Wire Line
	5900 950  6150 950 
$Comp
L Device:CP C15
U 1 1 5FF65377
P 7000 1200
F 0 "C15" H 7118 1246 50  0000 L CNN
F 1 "0,1u" H 7118 1155 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 7038 1050 50  0001 C CNN
F 3 "~" H 7000 1200 50  0001 C CNN
	1    7000 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 950  7000 950 
Wire Wire Line
	7000 950  7000 1050
$Comp
L Device:LED D1
U 1 1 5FF70100
P 7500 1100
F 0 "D1" V 7539 982 50  0000 R CNN
F 1 "power" V 7448 982 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 7500 1100 50  0001 C CNN
F 3 "~" H 7500 1100 50  0001 C CNN
	1    7500 1100
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R10
U 1 1 5FF7079D
P 7500 1400
F 0 "R10" H 7570 1446 50  0000 L CNN
F 1 "1k" H 7570 1355 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 7430 1400 50  0001 C CNN
F 3 "~" H 7500 1400 50  0001 C CNN
	1    7500 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 950  7250 950 
Connection ~ 7000 950 
Wire Wire Line
	7500 1600 7200 1600
Wire Wire Line
	5450 1600 5450 1650
Connection ~ 5450 1600
Wire Wire Line
	5900 1350 5900 1600
Connection ~ 5900 1600
Wire Wire Line
	6450 1250 6450 1600
Connection ~ 6450 1600
Wire Wire Line
	6450 1600 5900 1600
Wire Wire Line
	7000 1350 7000 1600
Connection ~ 7000 1600
Wire Wire Line
	7000 1600 6450 1600
$Comp
L power:VCC #PWR014
U 1 1 5FF9792D
P 7250 950
F 0 "#PWR014" H 7250 800 50  0001 C CNN
F 1 "VCC" H 7265 1123 50  0000 C CNN
F 2 "" H 7250 950 50  0001 C CNN
F 3 "" H 7250 950 50  0001 C CNN
	1    7250 950 
	1    0    0    -1  
$EndComp
Connection ~ 7250 950 
Wire Wire Line
	7250 950  7500 950 
Wire Wire Line
	7500 1550 7500 1600
$Comp
L Connector:Conn_01x06_Female J7
U 1 1 5FFA22E8
P 8200 2300
F 0 "J7" H 8150 2750 50  0000 L CNN
F 1 "RTC connector board" H 8100 2650 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x06_P2.54mm_Horizontal" H 8200 2300 50  0001 C CNN
F 3 "~" H 8200 2300 50  0001 C CNN
	1    8200 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 1600 5450 1600
Wire Wire Line
	8000 2200 7200 2200
Wire Wire Line
	7200 2200 7200 1600
Connection ~ 7200 1600
Wire Wire Line
	7200 1600 7000 1600
Wire Wire Line
	8000 2100 7850 2100
Wire Wire Line
	7850 2100 7850 950 
Wire Wire Line
	7850 950  7500 950 
Connection ~ 7500 950 
Wire Wire Line
	8000 2300 7150 2300
Wire Wire Line
	3200 2300 3200 3100
Wire Wire Line
	3200 3100 1700 3100
Text Label 6200 2300 0    50   ~ 0
SDA
Wire Wire Line
	8000 2400 7100 2400
Wire Wire Line
	3300 2400 3300 3200
Wire Wire Line
	3300 3200 1700 3200
Text Label 6100 2400 2    50   ~ 0
SCL
Wire Wire Line
	8000 2600 3400 2600
Wire Wire Line
	3400 2600 3400 3300
Wire Wire Line
	3400 3300 1950 3300
Wire Wire Line
	1950 3300 1950 4000
Wire Wire Line
	1950 4000 1700 4000
Text Label 6150 2600 0    50   ~ 0
32Khz
$Comp
L Connector:Conn_01x04_Male J9
U 1 1 600361D8
P 9600 2400
F 0 "J9" H 9450 2750 50  0000 C CNN
F 1 "I2c display connector" H 9750 2650 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 9600 2400 50  0001 C CNN
F 3 "~" H 9600 2400 50  0001 C CNN
	1    9600 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 2300 10200 2300
Wire Wire Line
	10200 2300 10200 950 
Wire Wire Line
	10200 950  7850 950 
Connection ~ 7850 950 
$Comp
L power:GND #PWR015
U 1 1 6005B54A
P 9900 2600
F 0 "#PWR015" H 9900 2350 50  0001 C CNN
F 1 "GND" H 9905 2427 50  0000 C CNN
F 2 "" H 9900 2600 50  0001 C CNN
F 3 "" H 9900 2600 50  0001 C CNN
	1    9900 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9800 2600 9900 2600
Wire Wire Line
	9800 2400 10350 2400
Wire Wire Line
	10350 2400 10350 3000
Wire Wire Line
	10350 3000 7100 3000
Wire Wire Line
	7100 3000 7100 2400
Connection ~ 7100 2400
Wire Wire Line
	9800 2500 10300 2500
Wire Wire Line
	10300 2500 10300 2950
Wire Wire Line
	10300 2950 7150 2950
Wire Wire Line
	7150 2950 7150 2300
Connection ~ 7150 2300
$Comp
L Connector:Conn_01x04_Male J10
U 1 1 60085D8E
P 10700 2400
F 0 "J10" H 10750 2100 50  0000 R CNN
F 1 "I2c spare" H 10950 2000 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 10700 2400 50  0001 C CNN
F 3 "~" H 10700 2400 50  0001 C CNN
	1    10700 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10900 2300 10200 2300
Connection ~ 10200 2300
Wire Wire Line
	10900 2400 10350 2400
Connection ~ 10350 2400
Wire Wire Line
	10900 2500 10300 2500
Connection ~ 10300 2500
Wire Wire Line
	10900 2600 9900 2600
Connection ~ 9900 2600
Wire Wire Line
	2000 3400 9600 3400
NoConn ~ 4050 5600
NoConn ~ 4200 5500
NoConn ~ 1700 4200
NoConn ~ 1700 3900
NoConn ~ 1700 3000
NoConn ~ 1700 2900
NoConn ~ 1700 2800
NoConn ~ 1700 2700
NoConn ~ 1700 2000
NoConn ~ 1700 1900
NoConn ~ 1700 1800
NoConn ~ 500  1800
NoConn ~ 1200 1500
$Comp
L Connector:Conn_01x03_Male J1
U 1 1 602304CE
P 1300 5150
F 0 "J1" H 1200 4900 50  0000 C CNN
F 1 "Serial header" H 1300 4800 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 1300 5150 50  0001 C CNN
F 3 "~" H 1300 5150 50  0001 C CNN
	1    1300 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 3600 1850 3600
Wire Wire Line
	1700 3500 1900 3500
Wire Wire Line
	1500 5050 1600 5050
Wire Wire Line
	1600 5050 1600 4500
Wire Wire Line
	1600 4500 1100 4500
Connection ~ 1100 4500
Wire Wire Line
	1850 5150 1500 5150
Wire Wire Line
	1850 3600 1850 5150
Wire Wire Line
	1900 5250 1500 5250
Wire Wire Line
	1900 3500 1900 5250
Text Label 1650 5150 0    50   ~ 0
TXD
Text Label 1650 5250 0    50   ~ 0
RXD
Connection ~ 2850 7500
Wire Wire Line
	2850 7500 3250 7500
Wire Wire Line
	2850 6900 3250 6900
Connection ~ 3850 6900
Wire Wire Line
	3850 6900 4050 6900
Wire Wire Line
	4050 7200 4050 6900
Wire Wire Line
	3650 7200 3650 6900
Connection ~ 3650 6900
Wire Wire Line
	3650 6900 3850 6900
Wire Wire Line
	3250 7200 3250 6900
Connection ~ 3250 6900
Wire Wire Line
	3250 6900 3650 6900
Wire Wire Line
	2000 3400 2000 3700
Wire Wire Line
	2000 3700 1700 3700
$Comp
L Connector:Screw_Terminal_01x02 J4
U 1 1 600343DE
P 4700 1050
F 0 "J4" H 4618 725 50  0000 C CNN
F 1 "12v input" H 4618 816 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 4700 1050 50  0001 C CNN
F 3 "~" H 4700 1050 50  0001 C CNN
	1    4700 1050
	-1   0    0    1   
$EndComp
Wire Wire Line
	4900 950  5450 950 
Wire Wire Line
	4900 1050 5450 1050
Wire Wire Line
	5450 1050 5450 1600
$Comp
L Connector:Screw_Terminal_01x02 J3
U 1 1 6005A601
P 2350 5250
F 0 "J3" H 2268 4925 50  0000 C CNN
F 1 "Piezo microphone" H 2500 5400 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 2350 5250 50  0001 C CNN
F 3 "~" H 2350 5250 50  0001 C CNN
	1    2350 5250
	-1   0    0    1   
$EndComp
Connection ~ 2550 5150
$Comp
L Connector:Screw_Terminal_01x02 J5
U 1 1 6005D483
P 6000 5800
F 0 "J5" H 5918 5475 50  0000 C CNN
F 1 "Headphones" H 5918 5566 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 6000 5800 50  0001 C CNN
F 3 "~" H 6000 5800 50  0001 C CNN
	1    6000 5800
	-1   0    0    1   
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 J6
U 1 1 600653E5
P 6850 4550
F 0 "J6" H 6768 4225 50  0000 C CNN
F 1 "Gain pot 10k" H 6850 4750 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-3_P5.08mm" H 6850 4550 50  0001 C CNN
F 3 "~" H 6850 4550 50  0001 C CNN
	1    6850 4550
	-1   0    0    1   
$EndComp
Wire Wire Line
	7150 4250 7150 4450
Wire Wire Line
	7150 4450 7050 4450
Wire Wire Line
	7050 4650 7150 4650
Wire Wire Line
	7150 4650 7150 5950
Wire Wire Line
	7050 4550 7300 4550
Connection ~ 7300 4550
Wire Wire Line
	7300 4550 7300 4950
$Comp
L Connector:Screw_Terminal_01x02 J8
U 1 1 600A1A5D
P 8950 5950
F 0 "J8" H 8868 5625 50  0000 C CNN
F 1 "External LED" H 8868 5716 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 8950 5950 50  0001 C CNN
F 3 "~" H 8950 5950 50  0001 C CNN
	1    8950 5950
	-1   0    0    1   
$EndComp
Wire Wire Line
	9150 5850 9400 5850
Wire Wire Line
	9400 5850 9400 5700
Wire Wire Line
	9400 5700 9600 5700
Connection ~ 9600 5700
Wire Wire Line
	9600 5700 9600 5750
Wire Wire Line
	9150 5950 9250 5950
Wire Wire Line
	9250 5950 9250 6300
Connection ~ 9250 6300
Wire Wire Line
	9250 6300 9600 6300
Wire Wire Line
	3200 2300 7150 2300
Wire Wire Line
	3300 2400 7100 2400
Wire Wire Line
	8000 2500 3350 2500
Wire Wire Line
	3350 2500 3350 3550
Wire Wire Line
	3350 3550 2050 3550
Wire Wire Line
	2050 3550 2050 3800
Wire Wire Line
	2050 3800 1700 3800
Wire Wire Line
	950  7200 1900 7200
Wire Wire Line
	950  7500 1900 7500
NoConn ~ 4050 4900
Wire Wire Line
	5350 6300 6200 6300
Wire Wire Line
	6200 5700 6400 5700
Wire Wire Line
	6200 5800 6200 6300
Connection ~ 6200 6300
Wire Wire Line
	6200 6300 6850 6300
NoConn ~ 1700 4100
$EndSCHEMATC
