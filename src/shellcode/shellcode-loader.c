// loader.c
#include <stdio.h>
#include <sys/mman.h>
#include <unistd.h>

int main() {
    FILE *f = fopen("shellcode.o", "rb");
    fseek(f, 0, SEEK_END);
    long size = ftell(f);
    fseek(f, 0, SEEK_SET);
    
    unsigned char *shellcode = mmap(NULL, size, PROT_READ | PROT_WRITE | PROT_EXEC, 
                                  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    fread(shellcode, 1, size, f);
    fclose(f);
    
    printf("Shellcode size: %ld bytes\n", size);
    printf("Executing shellcode...\n");
    
    void (*func)() = (void(*)())shellcode;
    func();
    
    return 0;
}
