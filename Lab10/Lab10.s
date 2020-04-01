    # Data segment
    .data
    .balign 4
intro: .asciz "wiringPi LED blinking\n"
errMsg: .asciz "Setup problem ... Abort!\n"
pin: .int 7
i: .int 0
duration: .int 250
OUTPUT = 1 @ constant

    # Text segment
    .text
    .global main
    .extern printf
    .extern wiringPiSetup
    .extern delay
    .extern digitalWrite
    .extern pinMode

main: 
    PUSH {ip, lr} @ push link return register on stack segment
    LDR R0, =intro
    BL printf
    BL wiringPiSetup
    MOV R1, #-1
    CMP R0, R1 @ if setup error 
    BNE init
    LDR R0, =errMsg
    BL printf
    B done  
init: 
    LDR R0, =pin @ argument 1
    LDR R0, [R0] 
    MOV R1, #OUTPUT @ argument 2
    BL pinMode @ call function with parameters (R0, R1)
    LDR R4, =i
    LDR R4, R[4]
    MOV R5, #10
forLoop:
    CMP R4, R5
    BGT done
    LDR R0, =pin
    LDR R0, [R0]
    MOV R1, #1
    BL digitalWrite
    LDR R0, =duration
    LDR R0, R[0]
    BL delay
    LDR R0, =pin
    LDR R0, [R0]
    MOV R1, #0
    BL digitalWrite
    LDR R0, =duration
    LDR R0, R[0]
    BL delay
    ADD R4, #1
    B forLoop
done:
    POP {ip, pc} @ pop return address into pc