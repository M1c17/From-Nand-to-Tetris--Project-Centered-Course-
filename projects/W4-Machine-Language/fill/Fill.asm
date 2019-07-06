// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.
(LOOP)
//32 words * 256 rows = 8192 register to paint in the matrix
    @8192
    D=A
    @max
    M=D
// Set D to the value of keyboard. 0=> No press // 1=> press
    @KBD
    D=M
//if i is not 0 => go to FILL
    @FILL // if key pressed, go below and fill screen
    D;JNE
//if i is 0 => go to CLEAR
    @CLEAR // else, clear the screen
    D;JEQ
//end of the loop //to terminate a program safely
    @LOOP
    0;JMP

(FILL)
//Set D to the value of SCREEN 
    @SCREEN
    D=M
//if i is not 0 => go to LOOP
    @LOOP
    D;JNE

    @max 
    M=M-1    //8192 - 1

    @SCREEN
    D=A
    @max   // 8192 + 16384
    D=D+M

    //the first register of the screen
    //address the select memory R0
    @R0
    M=D
    @0
    D=!A   //if register D is not equal to A

    //ACCESS MEMORY USING A POINTER 
    //the first register in Screen 
    @R0
    A=M
    M=D
    //end of FILL 
    @FILL
    0;JMP

(CLEAR)
    //Set D to the value of SCREEN 
    @SCREEN
    D=M
    //if i is 0 => go to LOOP
    @LOOP
    D;JEQ
  
    @max 
    M=M-1   //8192 - 1

    //SCREEN into A then move into D register 
    @SCREEN
    D=A
    @max 
    A=D+M 
    M=0 //color white 
    //end of CLEAR 
    @CLEAR
    0;JMP