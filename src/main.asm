org 0x7C00
bits 16

%define ENDLINE 0x0D, 0x0A

start:
	jmp main

;Printing to screen
puts:
;Registers to change
	push si
	push ax

.loop:
;Loads character into al, then jumps to done when flag is 0
	lodsb
	or al, al
	jz .done

;BIOS interrupt for teletype mode
	mov ah, 0x0e
	mov bh, 0
	int 0x10

	jmp .loop

.done
;Free registers in reverse
	pop ax
	pop si
	ret

main:

;Data segments
mov ax, 0
mov ds, ax
mov es, ax

;Stack segment
mov ss, ax
mov sp, 0x7C00

;Print hello world
mov si, hellostring
call puts

	hlt
.halt:
	jmp .halt

hellostring: db 'Hello World!', ENDLINE,  0

times 510-($-$$) db 0
dw 0AA55h
