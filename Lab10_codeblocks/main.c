#include <stdio.h>
#include <stdlib.h>
#include <wiringPi.h>''

int main()
{
    int pin = 7;
    if(wiringPiSetup() == -1) {
        printf("Setup problem ... Abort");
        exit(1);
    }
    pinMode(pin, OUTPUT);
    int i;
    for(i=0;i<10;i++){
        digitalWrite(pin, 1);
        delay(250);
        digitalWrite(pin, 0);
        delay(250);
    }
    return 0;
}
