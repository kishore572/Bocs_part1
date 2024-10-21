// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.
// Fill.asm
// Fills R2 memory locations starting from R0 with the value in R1.
// R0: Starting memory address
// R1: Value to fill
// R2: Number of locations to fill

@R2
D=M       // D = R2 (Number of memory locations to fill)
@END      // Check if R2 is zero
D;JEQ     // If R2 == 0, skip filling and jump to END

@i
M=0       // i = 0, initialize loop counter

(LOOP)
@i
D=M       // D = i
@R2
D=D-M     // D = i - R2
@FINISH
D;JGE     // If i >= R2, jump to FINISH (end of loop)

@R0
D=M       // D = R0 (base address)
@i
A=D+M     // A = R0 + i, calculate address to fill
@R1
D=M       // D = R1 (value to fill)
M=D       // Store R1 in memory[R0 + i]

@i
M=M+1     // i = i + 1
@LOOP
0;JMP     // Repeat the loop

(FINISH)
@END      // Finish the program
0;JMP     // Infinite loop or halt

