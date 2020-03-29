    .global gcd_s
gcd_s:
    while: CMP R0, R1
        BEQ endw
        BGT cond1
        BLT cond2
    cond1:
        SUB R0,R0,R1
        B while
	cond2:
        SUB R1,R1,R0
        B while
	endw:
        BX LR
