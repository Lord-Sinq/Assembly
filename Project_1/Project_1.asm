#include Irvinde32.inc
GLOBAL _start

.data
        msg byte "             (You have 3 lifes to guess the number )",0
        mainMsg byte "Enter a int number from 0 to 10: ",0
        lessMsg byte "The number you entered is less then: ",0
        greaterMsg byte "The number you entered is greater: ",0
        equalMsg byte "WOW!! You got it! ",0

	random dword ?
	life dword
section .text

_start:
	call Randize
	Mov eax, 10
	call RandomRange
	mov random, eax
	call writedec
	call crif
	mov eax, offset msg
	call writestring
	call crlf
	call crlf
	call crlf

L1:
	inc life
	mov edx, offset mainMsg
	
