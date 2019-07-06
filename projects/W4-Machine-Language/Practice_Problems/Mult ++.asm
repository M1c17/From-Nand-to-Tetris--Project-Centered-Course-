//Program: Mult.asm
//Write a simple algebraic program.
//this program compute the value R1 * R0 and stores the result in R2
//Usage: put a non-negative number in RAM[0].
// for(i=7;i==0;i-1)
// R2=R0*R1

//initialize i to R1
@R1             //RAM[1] = n
D=M
@n
M=D

//initialize result to 0 
@R2
M=0

//initialize i=0
@i
M=0

(LOOP)
//if i>n goto END
@i
D=M 
@n
D=D-M 
@END
D;JEQ

//Add RO to result 
@R0
D=M
@R2
M=D+M

//i++
@i
M=M+1

@LOOP
0;JMP 

(END)
@END
0;JMP

