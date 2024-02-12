.ORIG x3000

        LEA R4, X_ADDRESS    ; Load the address of x30A2 into R4
        LDR R2, R4, #0       ; Load the contents of x30A2 into R2
        LDR R3, R4, #1       ; Load the contents of x30A3 into R3
        NOT R1, R1           ; Clear R1
        
        ADD R1, R1, #1       ; Set R1 to 1 if R2 > R3
        ADD R2, R2, #-1      ; Decrement R2
        ADD R3, R3, #-1      ; Decrement R3
        
        BRp GREATER          ; If R2 > R3, branch to GREATER
        BRnzp LESS           ; If R2 <= R3, branch to LESS
        
GREATER ST R1, RESULT      ; Store 1 in R1
        BRnzp END            ; Branch unconditionally to END
        
LESS    AND R1, R1, #0     ; Clear R1
        ST R1, RESULT       ; Store 0 in R1

END     HALT

X_ADDRESS   .FILL x30A2    ; Address of x30A2 in memory
RESULT      .BLKW 1        ; Result storage location

.END
