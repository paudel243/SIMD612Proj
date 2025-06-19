section .text
default rel
bits 64
global xmmfunction

xmmfunction:
    push rbp
    mov rbp, rsp
    mov rsi, rdx
    mov rdi, rcx
    mov rcx, r8
    xor rax, rax
    xor r9, r9
    add rax, 3
    add r9, 2

loop_start:
    cmp r9, r8
    jg loop_end

    vmovupd xmm1, [rdi + rax*8]
    vmovupd xmm2, [rdi + (rax - 3)*8]
    vmovupd xmm3, [rdi + (rax - 2)*8]
    vmovupd xmm4, [rdi + (rax - 1)*8]
    vmovupd xmm5, [rdi + (rax + 1)*8]
    vmovupd xmm6, [rdi + (rax + 2)*8]
    vmovupd xmm7, [rdi + (rax + 3)*8]

    vaddpd xmm0, xmm1, xmm2
    vaddpd xmm0, xmm0, xmm3
    vaddpd xmm0, xmm0, xmm4
    vaddpd xmm0, xmm0, xmm5
    vaddpd xmm0, xmm0, xmm6
    vaddpd xmm0, xmm0, xmm7

    vmovupd [rsi], xmm0

    add rsi, 16
    add rax, 2
    add r9, 2
    jmp loop_start

loop_end:
    pop rbp
    ret
