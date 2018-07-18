;
;	write : Kim Sang Ho.
;	 Date : 2018-07-17 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
global _start
section .text

_start:
	push rbp
	mov rbp,rsp
	sub rsp,0x0000000000000040
	mov rax, 1
	mov rdi, 1
	mov rsi, menu
	mov rdx, 40
	syscall
	mov rax, 0
	mov rdi, 0
	mov rsi, num
	mov rdx, 1
	syscall
	mov rbx, [num]
	cmp rbx, 0x31
	je _gugu1
	cmp rbx, 0x32
	je _gugu2
	leave
	ret
	

_gugu1:
	mov rbx, 0
	mov r13, 19
	jmp _loop
	leave
	ret

_gugu2:
	mov rax, 1
	mov rdi, 1
	mov rsi, newline
	mov rdx, 1
	syscall

	mov rax, 1
	mov rdi, 1
	mov rsi, menu2
	mov rdx, 20
	syscall

	
	mov rax, 0
	mov rdi, 0
	mov rsi, num
	mov rdx, 2
	syscall

	mov rax, 0
	mov rdi, 0
	mov rsi, num
	mov rdx, 2
	syscall

	mov r8, [num]
	cmp r8, 0x3030
	jb _n1
	jmp _n2
_n1:
	mov rax, r8
        sub rax, 0xa30
        mov rbx, rax
	mov r13, rbx
	sub rbx, 1
	jmp _loop

_n2:
	sub r8, 0x3030
	mov rax, r8
	mov r10, 0x100
        div r10
        mov r9, rax
        xor rax, rax
        mov rax, r8
        mov dl, 0xa
        mul dl
        add rax, r9
        mov bx, ax
        mov r13, rbx
	sub rbx, 1
	jmp _loop

_loop:
	cmp rbx, r13
	mov r8, 0
	inc rbx
	mov rax, 1
	mov rdi, 1
	mov rsi, line
	mov rdx, 14
	syscall
	mov rax, 1
	mov rdi, 1
	mov rsi, newline
	mov rdx, 1
	syscall
	jb _loop2
	ret

_loop2:
	cmp r8, 9
	inc r8
	jb _print_1
	jmp _loop
	ret
	
	

_print_1:

	mov ax, bx
	mov dl, 10
	div dl
	add rax, 0x303030
	push rax
	push rax
	mov rax, 1
	mov rdi, 1
	mov rsi, rsp
	mov rdx, 2
	syscall

	mov rax, 1
	mov rdi, 1
	mov rsi, data1
	mov rdx, 3
	syscall
	pop rax
	pop rax
	
	mov rax, 0
	mov ax, r8w
	mov dl, 10
	div dl
	add rax, 0x303030
	push rax
	push rax
	mov rax, 1
	mov rdi, 1
	mov rsi, rsp
	mov rdx, 2
	syscall
	
	mov rax, 1
	mov rdi, 1
	mov rsi, data2
	mov rdx, 3
	syscall

	pop rax
	pop rax

	mov rax, rbx
	mul r8 
	mov r10, rax
	mov rcx, 100
	div rcx
	mov r9, rax
	mov r11, r9
	add r11, 0x30
	push r11 
	
	mov rax, 100
	mul r9
	mov r9, rax
	mov rax, r10
	sub rax, r9
	mov r12, rax
	mov r10, 10
	div r10
	mov r11, rax
	mov r9, rax
	add r11, 0x30
	push r11

	mov rax, 10
	mul r9
	mov r9, rax
	mov rax, r12
	sub rax, r9
	add rax, 0x30
	push rax

	pop r9
	pop r10
	pop r11
	
	push r9
	push r10
	push r11

	mov rax, 1
	mov rdi, 1
	mov rsi, rsp
	mov rdx, 1
	syscall
	pop rax
	mov rax, 1

	mov rdi, 1
	mov rsi, rsp
	mov rdx, 1
	syscall
	pop rax

	mov rax, 1
	mov rdi, 1
	mov rsi, rsp
	mov rdx, 1
	syscall
	pop rax
	mov rax, 1
	mov rdi, 1
	mov rsi, newline
	mov rdx, 1
	syscall
	jmp _loop2
	ret

section .data

data1: db " x ", 0
data2: db " = ", 0
newline: db 0x0a, 0
line: db "======================================", 0
menu2: db "choice (1 ~ 19)dan: ", 0 
menu: db "choice 1(1 ~ 19 dan) or 2(n dan): ", 0 

section .bss

	num: resb 2
