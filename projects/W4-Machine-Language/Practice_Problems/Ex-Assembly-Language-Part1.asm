// Store N 10 in register D
@10
D=A
//Incrementing value of D
D=D+1 //D++
//Setting D=RAM[17]
@17
D=M 
// Setting RAM[17]=D
@17
M=D
//Setting RAM[17] to 10 
@10
D=A
@R17
M=D

//Setting RAM[3] to RAM[5]
@3
D=M    ///RAM[5] = RAM[3]
@5
M=D

