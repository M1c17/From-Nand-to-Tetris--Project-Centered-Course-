//Program: Add2.asm
//Computes:RAM[2] = RAM[0] + RAM[1]
//Usage:put values in RAM[0],RAM[1]

//Add R0 + R1 
@R0
D=M 
@R1
D=D+M 
//Store in R2   
@R2
M=D    // R2 = R0 + R1
@6
0;JMP



