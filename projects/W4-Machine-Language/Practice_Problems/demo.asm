// Adds up two numbers \\ describe what this program is doing
// RAM[2] = RAM[0] + RAM[1]
// Usage:  put the values that you wish to add in
// RAM[0] and RAM[1] \\advice to the person who is going to use this program

@R0
D=M

@R1
D=D+M

@R2
M=D

@6
0;JMP


