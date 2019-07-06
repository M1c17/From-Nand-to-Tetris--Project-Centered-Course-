//Program: Rectangel1.asm
//compute: draw a filled rectangle 16 pixels wide 
//         RAM[0] pixels long
//Usage: give non-negative number to 
//       compute the heigth you want to compute in RAM[0]

// PSEUDO CODE
//initialiaze
//address = SCREEN
//n=RAM[0]
//i=0
//LOOP
//if i>n goto END
//RAM[addr]=-1 //// 1111
//addr = addr +32 paint 32 words*row 
//i++ i=i+1
//goto LOOP
//END:
//goto END

@SCREEN
D=A 
@address
M=D        //addres = SCREEN = 16384 

@R0       //n=RAM[0]
D=M 
@n
M=D

@i       //i=0
M=0

(LOOP)
@i
D=M
@n 
D=D-M 
@END
D;JGT      // if i>n goto END

@address
A=M 
M=-1 //color black   //RAM[address]=-1 = 1111

@i
M=M+1     //i++

@32   // advances to the next row 
D=A
@address   //address = 32 words + address 
M=D+M 
@LOOP
0;JMP

(END)
  @END
  0;JMP 







