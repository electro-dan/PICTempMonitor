#include <system.h>
#include "PICTempMonitor.h"

//https://www.maximintegrated.com/en/design/technical-documents/app-notes/1/162.html

//Target PIC16F627A configuration word
#pragma DATA _CONFIG, _PWRTE_OFF & _WDT_OFF & _INTOSC_OSC_NOCLKOUT & _CP_OFF & _LVP_OFF & _BOREN_OFF & _MCLRE_OFF

//Set clock frequency
#pragma CLOCK_FREQ  4000000


/*********************************************************************************************
  oneWireBusResetTimerStart()
  Resets and starts timer2, which will interrupt after 500us
*********************************************************************************************/
void oneWireBusResetTimerStart() {
    pr2 = 250;
    cTask.TASK_TIMER2 = 0;
    t2con.TMR2ON = 1;
}

/*********************************************************************************************
  oneWireBusReset()
  First part of the reset routine - drive the bus low for 500us
*********************************************************************************************/
void oneWireBusReset() {
    char isPresent;
    oneWireTris = 1; // start with high
    isPresent = 0;
    // Send the reset pulse - drive low for 500us
    oneWireBus = 0;      
    oneWireTris = 0;
    oneWireBusResetTimerStart();
}

/*********************************************************************************************
  oneWireBusReset()
  Second part of the reset routine, check for presence pulse, and wait a further 500us
*********************************************************************************************/
void oneWireBusReset2() {
    // Called after timer2 counts 500us
    // Release line and wait 70us for PD Pulse
    oneWireTris = 1;
    delay_10us(7);
    // Now sample, if there is a sensor on the bus, the line should be low
    if (oneWireBus) {
        oneWireIsPresent = 0; // no devices
    }
    oneWireBusResetTimerStart();
}

/*********************************************************************************************
  oneWireTxByte(char data)
  Transmits a single byte from the bus
*********************************************************************************************/
void oneWireTxByte(char cData) {
    char cTemp = 1;
    // Loop through the eight bits in the byte
    for (char i = 0; i < 8; i++) {
        // Send the LSB first

        // Drive the line low initially for 3us
        oneWireTris = 0;
        oneWireBus = 0;

        // Delay not needed for 4MHz PIC
        //delay_us(3); // Delay 3us
        
        if (cData & cTemp) {
            oneWireTris = 1; // Release the bus
        }
        
        delay_10us(5); // Delay 60us - 50us works fine with code delays
        oneWireTris = 1; // Release the bus
        
        // move the test bit
        cTemp <<= 1;
    }
}

/*********************************************************************************************
  oneWireTxBytes(char data, char data2)
  Transmits a 2 bytes from the bus
*********************************************************************************************/
void oneWireTxBytes(char cData, char cData2) {
    // Reset first - done in main
    //oneWireBusReset();
    // Send first byte
    oneWireTxByte(cData);
    // Send second byte
    oneWireTxByte(cData2);
}

/*********************************************************************************************
  oneWireRxByte()
  Receives a single byte from the bus
*********************************************************************************************/
char oneWireRxByte() {
    char cDataIn = 0;
    // Loop through the eight bits in the byte
    for(char i = 0; i < 8; i++) {
        // Bring bus low for 15us
        oneWireTris = 0;
        oneWireBus = 0;

        // Delay not needed for 4MHz PIC
        //delay_us(15); // Delay 15us

        // Release bus for 6us, this is enough time for the slave to respond
        oneWireTris = 1;
        delay_us(6); // Delay 6us
        
        // Shift data already received left
        cDataIn >>= 1;
        // Check the value of the onewire bus - set the MSB of cDataIn if so
        if (oneWireBus)
            cDataIn.7 = 1;

        // To finish time slot
        delay_10us(6); // 60us
    } 
    
    return cDataIn;
}

/*********************************************************************************************
  Function called once only to initialise variables and
  setup the PIC registers
*********************************************************************************************/
void initialise() {
    pcon.OSCF = 1; // 4MHz internal osc

    // Configure port A - ra3 and ra2 input, rest outputs
    /*      DS1 DS2 DS3 DS4
    ra6     x
    ra7         x
    ra0                 x
    ra1             x
    */
    porta = 0xC3; // ra0,1,6,7 all high (displays off)
    trisa = 0x0C;
    
    // Configure port B
    /*      DS1 DS2 DS3 DS4
    rb7     DP  e   DP  e
    rb6     c   d   c   d
    rb5     d   c   d   c
    rb4     e   DP  e   DP
    rb3     g   b   g   b
    rb2     f   a   f   a
    rb1     a   f   a   f
    rb0     b   g   b   g
    */
    trisb = 0x00; // all outputs
    portb = 0xFF; // all on due to common anode display

    option_reg = 0;
    option_reg.NOT_RBPU = 1; // disable port b pull ups

    // ADC setup
    cmcon = 7; // disable all comparators so port a is usable as digital io

    // Setup timer 0, used to flag the 7 segment display to refresh a digit - 4ms timer0 works best
    // https://fsimdeck.wordpress.com/electronics3/led-7-segment-multiplexing/
    // Timer calculator: http://eng-serve.com/pic/pic_timer.html
    // Timer0 Registers Prescaler= 16 - TMR0 Preset = 0 - Freq = 244.14 Hz - Period = 0.004096 seconds
    //option_reg.T0CS = 0; // bit 5  TMR0 Clock Source Select bit...0 = Internal Clock (CLKO) 1 = Transition on T0CKI pin
    //option_reg.T0SE = 0; // bit 4 TMR0 Source Edge Select bit 0 = low/high 1 = high/low
    //option_reg.PSA = 0; // bit 3  Prescaler Assignment bit...0 = Prescaler is assigned to the Timer0
    //option_reg.PS2 = 0; // bits 2-0  PS2:PS0: Prescaler Rate Select bits
    option_reg.PS1 = 1;
    option_reg.PS0 = 1;
    tmr0 = 0; // preset for timer register
    intcon.T0IF = 0; // Clear timer 1 interrupt flag bit
    intcon.T0IE = 1; // Timer 1 interrupt enabled

    // Setup timer 1, used to periodically ask for a temperature reading, and receive it after sending - 262ms
    // Timer calculator: http://eng-serve.com/pic/pic_timer.html
    // Timer 1 setup - interrupt every 262ms seconds 4MHz
    t1con = 0;
    t1con.T1CKPS1 = 1;   // bits 5-4  Prescaler Rate Select bits
    //t1con.T1CKPS0 = 0;   // bit 4
    //t1con.T1OSCEN = 0;   // bit 3 Timer1 Oscillator Enable Control bit 1 = off - this should be cleared so we can use RB7 and RB6 as outputs
    t1con.NOT_T1SYNC = 1;    // bit 2 Timer1 External Clock Input Synchronization Control bit...1 = Do not synchronize external clock input
    //t1con.TMR1CS = 0;    // bit 1 Timer1 Clock Source Select bit...0 = Internal clock (FOSC/4)
    //t1con.TMR1ON = 0;    // bit 0 enables timer
    pie1.TMR1IE = 1; // Timer 1 interrupt
    pir1.TMR1IF = 0; // Clear timer 1 interrupt flag bit

    // Setup timer 2, used to count ds18b20 bus time slots - 500us
    //Timer2 Registers Prescaler= 1 - TMR2 PostScaler = 2 - PR2 = 250 - Freq = 2000.00 Hz - Period = 0.000500 seconds
    //t2con |= 8;        // bits 6-3 Post scaler 1:1 thru 1:16
    //t2con.TMR2ON = 1;  // bit 2 turn timer2 on;
    //t2con.T2CKPS1 = 0; // bits 1-0  Prescaler Rate Select bits
    //t2con.T2CKPS0 = 0;
    t2con = 8; // timer off by default
    pr2 = 250;         // PR2 (Timer2 Match value)
    pie1.TMR2IE = 1; // Timer 1 interrupt
    pir1.TMR2IF = 0; // Clear timer 1 interrupt flag bit

    // Start up delay to allow things to settle
    delay_s(1);
        
    // Enable all interrupts
    intcon.GIE = 1;
    // Enable all unmasked peripheral interrupts (required for TMR2 interrupt)
    intcon.PEIE = 1;
    t1con.TMR1ON = 1;
}

/*********************************************************************************************
  displayValue(char iDigit)
  Function called by multiplexing
  Used to light one digit out of the four with the correct segments
*********************************************************************************************/
void displayValue(char iDigit) {
    // turn all digits off first
    // add on current bits 2 to 5 of port a to keep their value
    porta = 195 + (porta & 60);
    delay_us(5);
    
    // get the digit to display
    char cDig = arrTemp[iDigit];
        
    // Set port b to the correct value
    // Use the array zero for the displays 0 and 2, otherwise array 1
    // Display 0 is the right most display
    if ((iDigit == 0) || (iDigit == 2)) {
        portb = arrSegments0[cDig];
        if ((iDigit == iDecimalPosition) || (iDigit == iTempUnit))
            portb -= 16;
    } else {        
        // minus 128 (rb7) to turn the decimal on
        portb = arrSegments1[cDig];
        if (iDigit == iDecimalPosition)
            portb -= 128;
    }
    
    // Now set porta to the correct value to light the correct digit
    porta = arrDigits[iDigit] + (porta & 60);
    delay_us(5);
}

/*********************************************************************************************
  displayValue(char iDigit)
  Function to perform multiplexing
  Calls displayValue with the digit argument, resets to 0 when the counter reaches 4
*********************************************************************************************/
void refreshDisplay() {
    // if 4, reset to zero
    if (iDigitCounter == 4)
        iDigitCounter = 0;
            
    // display the digit
    displayValue(iDigitCounter);
            
    // increment counter
    iDigitCounter++;
}

/*********************************************************************************************
  interrupt()
  Interrupt handler
*********************************************************************************************/
void interrupt() {
    // Interrupt on timer0 - flag the task to refresh display
    if(intcon.T0IF) {
        cTask.TASK_TIMER0 = 1;
        // Clear interrupt flag
        intcon.T0IF = 0;
    }
    // Interrupt on timer1 - ask for temperature, get the temperature
    if (pir1.TMR1IF) {
        cTask.TASK_TIMER1 = 1;
        // timer 1 will interrupt every 262ms with a 1:4 prescaler at 4MHz
        // We'll ask for the temperatute every 2 seconds
        // Into 60 seconds, 262ms goes 229 times (roughly)
        if (iTimer1Count == TIMER_1_INTERVAL) {
            // If the number of tasks to perform is less than the limit,
            // then add this task to the task array
            cTask.TASK_TIMER1_START = 1;
        }
        // just over 750ms after asking for temperature, it should be ready, so get the reading
        // 0.75 seconds is three more ticks above TIMER_1_INTERVAL
        if (iTimer1Count >= TIMER_1_INTERVAL+3) {
            iTimer1Count = 0;
            // If the number of tasks to perform is less than the limit,
            // then add this task to the task array
            cTask.TASK_TIMER1_READ = 1;
        }
        // Count the number of times this timer overflowed
        iTimer1Count++;
        // Clear interrupt flag
        pir1.TMR1IF = 0; 
    }
    // Interrupt on timer2 - one-wire bus reset stage
    if (pir1.TMR2IF) {
        cTask.TASK_TIMER2 = 1;
        // Clear interrupt flag
        pir1.TMR2IF = 0; 
    }
}

/*********************************************************************************************
  storeTempDigits(int iValue)
  Used to split the temperature reading into digits and place on the arrTemp array
  iValue = temperature value part (0 to 9999)
  https://electronics.stackexchange.com/questions/158563/how-to-split-a-floating-point-number-into-individual-digits
*********************************************************************************************/
void storeTempDigits4(int iValue) {
    // simple way, but more program memory needed (more than 100 words more)
    //char cDig3 = iValue / 1000;
    //char cDig2 = (iValue / 100) % 10;
    //char cDig1 = (iValue / 10) % 10;
    //char cDig0 = iValue % 10;
    
    // less program memory needed - may be slower executing
    char cDig3 = 0;
    char cDig2 = 0;
    char cDig1 = 0;
    char cDig0 = 0;
    
    // incrementing variables for each digit

    // determine to thousands digit
    while (iValue >= 1000) {
        iValue = iValue - 1000;
        // each time we take off 1000, the digit is incremented
        cDig3++;
    }

    // determine to hundreds digit
    while (iValue >= 100) {
        iValue = iValue - 100;
        // each time we take off 100, the digit is incremented
        cDig2++;
    }

    // determine to tens digit
    while (iValue >= 10) {
        iValue = iValue - 10;
        // each time we take off 10, the left most digit is incremented
        cDig1++;
    }

    // the last digit is what's left on iValue
    cDig0 = iValue;

    // left fill zeroes with blanks up to the digit before the decimal place
    if (cDig3 == 0) {
        cDig3 = 11;
        if ((cDig2 == 0) && (iDecimalPosition == 1))
            cDig2 = 11;
    }
    arrTemp[3] = cDig3;
    arrTemp[2] = cDig2;
    arrTemp[1] = cDig1;
    arrTemp[0] = cDig0;
    
}

/*********************************************************************************************
  storeTemp()
  Used to split the 16 bit integer returned from the ds18b20 into parts for display
  cTempH - upper 8 bits
  cTempL - lower 8 bits
*********************************************************************************************/
void storeTemp() {
    // convert both bytes to a 16bit int - e.g. 0000 0001 0100 0110 (1 and 70, gives 326)
    
    signed int iTemp = (cTempH << 8) | cTempL;
    iDecimalPosition = 2;
    
    if (iTempUnit) {
        // Celcius
        char isMinus = (iTemp < 0);
        if (isMinus) {
            iTemp = ~iTemp + 1;
        }
        // this gets celcius * 100 - https://www.phanderson.com/PIC/PICC/sourceboost/ds18b20_1.html
        int iTempC = (6 * iTemp) + (iTemp / 4);
        // display it
        storeTempDigits4(iTempC);
        if (isMinus) {
            if (iTempC >= 1000) {
                // shift digits right
                iDecimalPosition = 1;
                arrTemp[0] = arrTemp[1];
                arrTemp[1] = arrTemp[2];
                arrTemp[2] = arrTemp[3];
            }
            // overwrite left most digit with minus sign
            arrTemp[3] = 10;
        }
    } else {
        // Fahrenheit 
        iDecimalPosition = 1;
        // -17.8125 (-285/65251) results in minus fahrenheit (-0.125), -17.75 (-284/65250) results in positive fahrenheit (1)
        // this gets Fahrenheit * 10 - https://www.electro-tech-online.com/threads/temperature-sensor-ds18b20-display-fahrenhiet.117377/
        signed int iTempF = ((iTemp + 4) / 8) + iTemp + 320;
        // convert to absolute value
        char isMinus = (iTempF < 0);
        if (isMinus) {
            iTempF = ~iTempF + 1;
        }
        // display it
        storeTempDigits4(iTempF);
        if (isMinus) {
            // overwrite left most digit with minus sign
            arrTemp[3] = 10;
        }
    }
}

/*********************************************************************************************
  startTemp()
  Sends the Convert T [44h] function command to the ds18b20
*********************************************************************************************/
void startTemp() {
    // CC indicates to skip rom - addressing all devices (there is only one)
    // 44 is the convert function
    oneWireTxBytes(0xCC, 0x44);
}

/*********************************************************************************************
  startTemp()
  Sends the Read Scratchpad [BEh] function command to the ds18b20
*********************************************************************************************/
void readTemp() {
    // CC indicates to skip rom - addressing all devices (there is only one)
    // BE indicates to read scratchpad
    oneWireTxBytes(0xCC, 0xBE);
    // multiplex the display here
    refreshDisplay();

    // Now get the temperature from the scratchpad
    // This is in the first two bytes - so get those only and ignore the rest
    cTempL = oneWireRxByte();
    // multiplex the display here
    refreshDisplay();
    cTempH = oneWireRxByte();

    // multiplex the display here
    refreshDisplay();
    // store it in the array, next display refresh will pick it up
    storeTemp();
}

void main() {
    initialise();

    while(1) {
        // Task scheduler
        // If there are tasks to be performed, find out the
        // most recent task from the array and execute it
        while (cTask > 0) {
            if (cTask.TASK_TIMER2) {
                // multiplex the display here
                refreshDisplay();
                oneWireResetStage++;
                if (oneWireResetStage == 2) {
                    oneWireBusReset2();
                } else if (oneWireResetStage == 3) {
                    // stop timer, reset stage
                    t2con.TMR2ON = 0;
                    oneWireResetStage = 0;
                    if (cTask.TASK_TIMER1_START) {
                        startTemp(); 
                        cTask.TASK_TIMER1_START = 0;
                    } else if (cTask.TASK_TIMER1_READ) {
                        readTemp(); 
                        cTask.TASK_TIMER1_READ = 0;
                    }
                }
                cTask.TASK_TIMER2 = 0;
            }
            if (cTask.TASK_TIMER1) {
                // Use the 262ms timer to periodically check if the temperature unit button was pressed and held
                if (!UNITBUTTON && bUnitButtonPrev) {
                    if (iTempUnit)
                        iTempUnit = 0;
                    else
                        iTempUnit = 5;
                    storeTemp();
                }
                bUnitButtonPrev = UNITBUTTON;
                cTask.TASK_TIMER1 = 0;
            }
            if (cTask.TASK_TIMER0) {
                // Timer 0 has finished counting - refresh the multiplexed display to the next digit
                refreshDisplay(); 
                cTask.TASK_TIMER0 = 0;
            }
            if (cTask.TASK_TIMER1_START && !oneWireResetStage) {
                // Timer 1 has finished counting to 2 seconds, ask to convert
                oneWireResetStage++;
                oneWireBusReset();
            }
            if (cTask.TASK_TIMER1_READ && !oneWireResetStage) {
                // Timer 1 has finished counting a further 750ms, read the converted temperature
                oneWireResetStage++;
                oneWireBusReset();
            }
        }
    }
}
