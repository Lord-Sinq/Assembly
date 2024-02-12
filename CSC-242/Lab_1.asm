.ORIG x3000

        LD R0, X_ADDRESS   ; Load the address of X into R0
        LD R1, X_VALUE      ; Load the value of X from memory into R1
        AND R2, R2, #0      ; Clear R2 (counter)
        
LOOP    ADD R2, R2, #1      ; Increment the counter
        ADD R1, R1, #-1     ; Decrement X
        BRz DONE            ; If X is zero, exit the loop
        BRnzp LOOP          ; Branch unconditionally to LOOP
        
DONE    HALT

X_ADDRESS   .FILL x3020      ; Address of X in memory
X_VALUE     .FILL x000F      ; Initial value of X

.END
