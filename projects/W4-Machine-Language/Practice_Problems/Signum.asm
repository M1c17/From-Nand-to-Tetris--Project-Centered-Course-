//Program: Signum.asm
//Computes: if R0 > 0 
//             R1 = 1
//          else 
//             R1 = 0

@R0
D=M  // D=RAM[0]
@POSSITIVE
D;JGT   // if RO > 0 go to 8 

@R1    //else R1=0
M=0
@END
0;JMP  //end program 
(POSSITIVE)
    @R1
    M=1     //R1=1
(END)
    @END 
    0;JMP // if end program 

