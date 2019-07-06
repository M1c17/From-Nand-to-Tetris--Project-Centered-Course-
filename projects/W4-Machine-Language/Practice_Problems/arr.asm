//Program: arr.asm
// computes: for(i=0; i<n; i++){
//          arr[i] = -1
//}
//Usage: put a num where arr[i]=-1
//PSEUDO CODE
// Set the first n entries of this array to the value -1 
// arr base address 100 & the lenght is n=10 

//variables declaration & assigments
@100   //arr[100] //RAM[100]=-1
D=A 
@arr
M=D 

@10   //n=10
D=A 
@n 
M=D 

@i
M=0 

(LOOP)
@i 
D=M
@n      // i-n // 0 - 10
D=D-M      
@END
D;JEQ   //i==0

@arr
D=M
@i       //RAM[arr+i]=-1//next register 101 102....110
A=D+M    //value of base adress + index
M=-1

@i 
M=M+1     //i++

@LOOP
0;JMP

(END)
   @END
   0;JMP






