#ifndef _PICTEMPMONITOR_H_
#define _PICTEMPMONITOR_H_

#define UNITBUTTON porta.3
char bUnitButtonPrev = 1;

// shortcuts for the task scheduler
#define TASK_TIMER0 1
#define TASK_TIMER1 2
#define TASK_TIMER1_START 3
#define TASK_TIMER1_READ 4
#define TASK_TIMER2 5
// refresh interval - time in ms divided by 262. Max value is 252.
#define TIMER_1_INTERVAL 114

// Hold the upper and lower bytes from the ds18b20
char cTempH;
char cTempL;

// numbers 0 to 9, blank, and minus sign
// arrays to hold the portb value to light the correct segments on the common anode display connected on portb
// This is 12 length array - 0 to 9 are numbers, 10 is minus symbol, 11 is blank
// display 0 and 2 use this array
char arrSegments0[12] = {17, 215, 50, 146, 212, 152, 24, 211, 16, 144, 254, 255};
// display 1 and 3 use this array
char arrSegments1[12] = {136, 190, 196, 148, 178, 145, 129, 188, 128, 144, 247, 255};

// array to hold the porta values in order to light the correct display during multiplexing
char arrDigits[4] = {194, 193, 67, 131};
// Used to store the rounded temperature reading, split into each unit (normally tens, units, decimal 1, decimal 2)
char arrTemp[4] = {0,0,0,0};
// Used to light the decimal on the correct display
char iDecimalPosition = 2;
// Array used to translate the decimal part of the ds18b20 reading (last 4 bits) to a rounded result
// 0=0, 1=0625, 2=0.125, 3=1875, 4=0.25, 5=0.3125, 6=0.375, 7=0.4375, 8=0.5, 9=0.5625, 10=0.625, 11=0.6875, 12=0.75, 13=0.8125, 14=0.875, 15=0.9375
//char arrDecTranslate[16] = {0,6,13,19,25,31,38,44,50,56,62,69,75,81,88,94};
//char arrDecTranslate1[16] = {0,1,1,2,2,3,4,4,5,6,6,7,8,8,9,9};

char iDigitCounter = 0; // Used to refresh the digits during multiplexing
char iTempUnit = 5; // 5 = Celcius, 0 = Farenheit
char cTask = 0; // Used for task scheduler
char iTimer1Count = TIMER_1_INTERVAL-1; // Used for counting timer 1 overflows

// shortcuts to the onewire pin
#define oneWireBus porta.2
#define oneWireTris trisa.2

char oneWireIsPresent = 0;
char oneWireResetStage = 0;
void oneWireBusReset();
void oneWireBusReset2();
void oneWireTxByte(char data);
void oneWireTxBytes(char data, char data2);
char oneWireRxByte();

void displayValue(char iDigit);
void refreshDisplay();
void storeTempDigits4(int iValue);
void storeTemp();
void startTemp();
void readTemp();

#endif //_PICTEMPMONITOR_H_
