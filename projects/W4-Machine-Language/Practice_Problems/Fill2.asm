// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

@8192
D=A 
@max
M=D

(RESTART)
@i
M=0

(LOOP)
//incrementing i 
@i 
M=M+1

//Reset iterarion if needed
D=M 
@max
D=D-M 
@RESTART
D;JEQ

//Read the KBD 
@KBD 
D=M 
@BLACK 
D;JNE //if key pressed 

    //Draw white pixels 
    @i 
    D=M 
    @SCREEN 
    A=A+D 
    M=0 
    @LOOP
    0;JMP 

(BLACK)
    @i 
    D=M 
    @SCREEN 
    A=A+D 
    M=-1
    @LOOP
    0;JMP 


