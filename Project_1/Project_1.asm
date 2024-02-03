#fasm#          ; this code is for flat assembler

name "Guessing-Number-Game"   ; output file name (max 8 chars for DOS compatibility)

org  100h	; set location counter to 100h

; you may customize this and other start-up templates 
; the location of this template is c:\emu8086\inc\fasm_0_com_template.txt

; disable blinking (for DOS/BIOS compatibility).
mov ax, 1003h  
mov bx, 0        
int 10h

; this is just a random code
mov ax, 1234h      ; load ax with hexadecimal value.
mov dx, 0x1234     ; 0x is a valid hexadecimal prefix too.
mov ax, 1234       ; load ax with 04D2h = decimal 1234 = 10011010010b.
mov ax, 0ABCDh     ; must have 0 prefix if first digit is A,B,C,D,E or F
mov dx, 0xABCD     ;                                      or use 0x prefix.
mov dl, [test1]    ; fasm IS case sensitive, test1<>TeSt1, AX=ax, etc...
jmp n              ; jump over 1 byte to skip over the test1 variable.
test1 db 20h       ; 1 byte variable 20h = 32.
n:
add dl, dl         ; dl = dl+dl = 20h+20h = 40h = 64 = 01000000b.
inc dl             ; dl = dl+1 = 41h = 65 = 'A' (ascii code).
mov ah, 2          ; ah and dl are parameters for int 21h.
int 21h            ; print 'A'.
mov dl, 1          ; ascii code 1 is a funny face.
int 21h            ; print it.
mov al, 11100101b  ; b suffix is for binary. 11100101b = 0xE5 = 229
xor al, 11111110b  ;


; Guessing Number Game from github
;   First asm project

;include Irvine32.inc

    .date
    
        msg byte "             (You have 3 lifes to guess the number )",0
        mainMsg byte "Enter a int number from 0 to 10: ",0
        lessMsg byte "The number you entered is less then: ",0
        greaterMsg byte "The number you entered is greater: ",0
        equalMsg byte "WOW!! You got it! ",0
        
        random dword ?
        life dword 

    .code
    main proc
            call Randize
            
            mov eax, 10
            call RandomRange
            mov random, eax
            
            call writedec
            call crlf
            
            mov edx, offset msg
            call writestring
            call crlf
            call crlf
            
            L1:
                inc life
                
                move edx, offset mainMsg
                call writestring
                call readdec
                call crlf
                
                cmp eax, random
                jl less
                je equal
                jg greater
                
            Loop L1
            
            less:
                
                mov edx, offset greaterMsg
                call writestring
                
                call crlf
                call crlf
                call crlf
                
                mov eax, 3
                je quit
                jl L1
            
            equal:
                
                mov edx, offset equalMsg
                call writestring
                mov edx, random
                call writedec
                
                call crlf
                call crlf
                jmp quit
                
            greater:
                
                mov edx, offset lessMsg
                call writestring
                
                call crlf
                call crlf
                call crlf    

                mov eax, life
                cmp eax, 3
                je quit
                jl L1
                
            quit:
            
 exit
 main endp
 end main
 


; end of my code
;


mov dx, 0705h      ; print message using BIOS function at 7,5
mov bx, 0          ; page 0.
mov bl, 10011111b  ; white on blue.
mov cx, msg_size   ; number of characters to print.
mov al, 01b        ; update cursor only.
mov bp, msg
mov ah, 13h        ; BIOS function for print.
int 10h            ; print message at es:bp.

mov ah, 0          ; wait for any key....
int 10110b         ; same as int 16h or int 22.

ret   ; return to the operating system.

msg:         db "press any key..."
msg_tail:
msg_size = msg_tail - msg






