.data
.balign 4
var1: .word 7

.text
.global main
@ main:
@     MOV R0, #0
@     MOV R1, #0

@ for1: 
@     CMP R1, #5
@     BGE end
@     MOV R2, #0
@     ADD R1, R1, #1

@ for2: 
@     CMP R2, #5
@     BGE for1
@     ADD R0, R0, #1
@     ADD R2, R2, #1
@     B for2

main:
    MOV R1, #5
    MOV R0, #0
    LDR R0, [R1, #7]
    BX LR

var1_addr: .word var1

end: BX LR