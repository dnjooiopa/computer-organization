    .global mod_s
mod_s:
    CMP R0, R1
    BLT end
    SUB R0, R0, R1
    B mod_s
end:
    BX LR
