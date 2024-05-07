.global _start

_start:
   MOV R0, #5
   MOV R1, #9
   ADD R2,R0,R1// r2 = r0 + r1
   SUB R2, R0, R1// r2 = r0-r1
   MUL R2, R0, R1 //r2 = r0-r1
   ADC R2, R0, R1// r2 = r0 + r1 + carry