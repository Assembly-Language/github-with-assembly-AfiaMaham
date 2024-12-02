; Afia Maham
; 23-NTU-CS-1126

include irvine32.inc
.data
arr1 SWORD 1,2,-6,8,-5,9,-8,-9,-7
msg1 BYTE 'Sum of all positive elements: ',0
msg2 BYTE 'No. of Positive elements: ',0
.code
main proc

mov esi,OFFSET arr1
mov eax,0
mov ebx,0
mov ecx,lengthof arr1

L1:      
test SWORD PTR [esi],8000h         ;test array elements with 8000h
jz add_positive                    ;jump to calculate sum if zf = 0
jnz cont                           ;jump to continue loop if zf != 0

add_positive:                     ; label to add positive elements    
inc bx
add ax,[esi]                      

cont:                             ;label to continue loop
add esi,2
loop L1
call clrscr 

mov edx,OFFSET msg1              ; display sum
call writestring
call writedec
call crlf
mov edx,OFFSET msg2             ;display number of positive elements
call writestring
mov ax,bx
call writedec


exit
main endp
end main