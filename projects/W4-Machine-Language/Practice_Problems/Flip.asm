//Program: Flip.asm 
//flip the values of 
//RAM[0] and RAM[1]

//tem = RAM[0]
//R0 = R1
//R1=temp
@R0
D=M  //D=RAM[0]

@temp   //temp = RAM[0]
M=D

@R1  // R0 = R1
D=M 
@R0
M=D

@temp // R1= temp 
D=M 
@R1
M=D

(END)
    @END
    0;JMP