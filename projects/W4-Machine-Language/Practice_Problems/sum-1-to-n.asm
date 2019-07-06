//Program: sum 1 to n.asm
// computes: RAM[1] = 1 + 2 + 3 +......+ n 
//Usage: put a number(n) in RAM[0]

//PSEUDO CODE
//LOOP
// if i > n go to STOP 
// n = R0
// i = 1 // i++
// sum = 0
//STOP
//R1 = sum

@R0
D=M     // n = R0
@n
M=D

@i         // i = 1
M=1

@sum       // sum = 0
M=0

(LOOP)
@i 
D=M
@n        // n = R0 - i
D=D-M
@STOP
D;JGT     //if i >n go to STOP 

@sum 
D=M 
@i 
D=D+M 
@sum       // sum = sum+i
M=D

@i 
M=M+1      //i++

@LOOP      //inifinite loop 
0;JMP

(STOP)
   @sum
   D=M 
   @R1
   M=D     //R1 = sum

(END)
   @END
   0;JMP
   

