//EXAMPLES
//Set the D resgister to -1 
D=-1

//Set RAM[300] to the value of the D register minus 1
@300   //A=300
M=D-1  //RAM[300]=D-1

//if(D-1==0) jump to execute the instructions in ROM[56]
@56      //A=56
D-1;JEQ //if(D-1==0) go to 56

//
@1 // the value of A register is 1 
M=A-1;JEQ //Computes A-1, which is = 0 
// it then stores this coputation in the M register,
//which is RAM[1](The value of the A register is still 1).
// The JEQ jump directive checks wheter the computation is equal to 0.
// This is true, so the next instruction will be the value stored in the A register, which is 1 

