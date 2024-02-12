.ORIG x3000

LD R0, Number1     ; Load dividend into R0
LD R1, Number2     ; Load divisor into R1

AND R2, R2, #0     ; Clear R2 (quotient)
AND R3, R3, #0     ; Clear R3 (remainder)

DIV_LOOP:
    ADD R3, R3, R0  ; Add dividend to remainder
    BRp DIV_SKIP    ; Skip division if remainder is positive or zero

    ADD R2, R2, #1  ; Increment quotient
    ADD R3, R3, R1  ; Subtract divisor from remainder

DIV_SKIP:
    ADD R0, R0, #-1 ; Decrement dividend
    BRp DIV_LOOP    ; Continue dividing if dividend is positive

    ; Display the result and remainder
    TRAP x22        ; Display the quotient
    TRAP x21        ; Display a newline character
    TRAP x20        ; Display the remainder
    TRAP x21        ; Display a newline character

    HALT

Number1 .FILL 10
Number2 .FILL 3

.END
