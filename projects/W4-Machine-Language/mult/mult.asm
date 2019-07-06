// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
//Program: Mult.asm
//Write a simple algebraic program.
//this program compute the value R1 * R0 and stores the result in R2
//Usage: put a non-negative number in RAM[0].
// for(i=7;i==0;i-1)
// R2=R0*R1
// Sum R1 with itself R2 times 


//initialize i to R1
@R1             //RAM[1] = i
D=M
@i 
M=D

//initialize result to 0 
@R2
M=0

(LOOP)
@i 
D=M 
@END 
D;JEQ        //if i==0 END the program

//Add R0 to result
@R0
D=M
@R2
M=D+M

//Decrease i-1
@i 
M=M-1

@LOOP
0;JMP 

(END)
@END
0;JMP