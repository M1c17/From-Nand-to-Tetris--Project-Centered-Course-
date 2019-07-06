// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.
//PSEUDOCODE
//initialize
//addr=SCREEN
//how many words to paint?
//counter : i=0
//LOOP
//Starting clearing the screen if key = 0 = WHITE 
//otherwise blackness 
//(black) if i == 0 max-i
//set all the words to -1 RAM[addr+i]=-1 
//i++
//end loop 
//white
//set all the words to -1 RAM[addr+i]=0
//if i==0 go to LOOP
//decrementing i-1
//END LOOP


@SCREEN
D=A 
@addr        // addr=SCREEN = 16384
M=D 
//How many pixels to paint in the whole matrix?
// 32 words * 256 rows = 8192
@8192
D=A 
@maxpaint
M=D 
  //Keeping track of where the fill in the screen **
@i 
M=0
(LOOP)
   //Start clearing the screen if no key pressed
    @KBD 
    D=M 
    @WHITE 
    D;JEQ  // if KEY==0

(BLACK)
    @addr
    D=M 
    @i    //** //set all the words to -1 RAM[addr+i]=-1
    A=D+M
    M=-1 //Set color -1 

    @maxpaint
    D=M 
    @i 
    D=D-M   // 8192 - 0 
    @LOOP 
    D;JEQ   //if i==0
    
    @i 
    M=M+1

    @LOOP //Jump back 
    0;JMP

(WHITE)
    @addr
    D=M 
    @i  //** //set all the words to 0 RAM[addr+i]=0
    A=D+M
    M=0

    //Jump back if i == 0 
    @i 
    D=M 
    @LOOP
    D;JEQ 

    //Decrementing i **
    @i // counter i to put the screen white
    M=M-1

    //Jump back
    @LOOP
    0;JMP






