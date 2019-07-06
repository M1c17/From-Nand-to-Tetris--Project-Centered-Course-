//Progam:Mult1.asm
//Compute: R0*R1 Stores in R2
//Usage: give non-negative RO & R1 to compute Mult R2
//PSEUDOCODE
//initialize 
//n=R1
//i=0
//sum=0
//LOOP
//if i>n goto END
//i++
//sum=sum+R0
//sum = R2

@R1
D=M 
@n
M=D 

@i 
M=1

@sum
M=0

(LOOP)
@i 
D=M 
@n
D=D-M 
@END
D;JGT

@sum
D=M 
@R0
D=D+M 
@sum
M=D 

@i
M=M+1

@LOOP
0;JMP

(END)
   @sum 
   D=M 
   @R2
   M=D 
   @END
   0;JMP