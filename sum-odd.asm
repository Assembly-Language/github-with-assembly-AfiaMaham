 Afia Maham
; 23-NTU-CS-1126

include irvine32.inc
.data
arr1 SWORD 1,2,-6,8,-5,9,-8,-9,-7
msg1 BYTE 'Sum of all odd elements: ',0
msg2 BYTE 'No. of odd elements: ',0
sum SDWORD 0
.code
main proc

mov esi,OFFSET arr1
mov eax,0
mov ebx,0
mov ecx,lengthof arr1

L1:
test SWORD PTR [esi],1h                ;test array elements with 1h
jnz add_odd                             ;jump to calculate sum if zf != 0
jz cont                                 ;jump to continue loop if zf = 0

add_odd:                                 ; label to add odd elements
inc bx
movsx eax,SWORD PTR[esi]
add sum,eax
cont:                                    ;label to continue loop
add esi,2
loop L1

call clrscr
mov edx,OFFSET msg1                    ;display sum
call writestring
mov eax,sum
call writeint
call crlf
mov edx,OFFSET msg2                    ;display number of odd elements
call writestring
movzx eax,bx
call writedec

exit
main endp
end main