    
    .text
mod_vals:
	LDR R2, addr_lr_bu_2
	STR lr,[R2]

	CMP R0,R1
	BLT LR
	ADD R0, R0, R1
	SUBS R1 ,R1,#1
	AND R0, R0,R1

    .global main
main:
    MOV R0, #5
    MOV R1, #8
    BX LR
