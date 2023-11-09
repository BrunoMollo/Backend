section .bss
  result resb 10

section .text
  global _start

_start:
  ; Input the limit for the Fibonacci series
  mov eax, 0x4        ; syscall number for sys_write
  mov ebx, 0x1        ; file descriptor 1 (stdout)
  mov ecx, prompt
  mov edx, prompt_len
  int 0x80            ; invoke syscall

  mov eax, 0x3        ; syscall number for sys_read
  mov ebx, 0x0        ; file descriptor 0 (stdin)
  mov ecx, result
  mov edx, 10
  int 0x80            ; invoke syscall

  mov edx, ecx         ; save the limit
  call atoi           ; convert the input to an integer
  mov ecx, eax         ; load the limit back

  ; Initialize Fibonacci sequence
  mov eax, 0
  mov ebx, 1

print_next:
  ; Print the current Fibonacci number
  mov eax, 0x4
  mov ebx, 0x1
  lea ecx, [result]
  call print_int

  ; Calculate the next Fibonacci number
  add eax, ebx

  ; Swap ebx and eax to update the sequence
  mov edx, ebx
  mov ebx, eax
  mov eax, edx

  ; Decrease the limit
  loop print_next

  ; Exit
  mov eax, 1
  int 0x80

atoi:
  ; Convert a null-terminated string to an integer
  xor eax, eax        ; Clear the result
  xor ecx, ecx        ; Clear the character counter
.loop:
  movzx edx, byte [ecx] ; Load the next character
  test  dl, dl        ; Check for the null terminator
  jz    .done
  sub   edx, '0'      ; Convert ASCII to integer
  imul  eax, eax, 10  ; Multiply the current result by 10
  add   eax, edx      ; Add the new digit
  inc   ecx           ; Move to the next character
  jmp   .loop
.done:
  ret

print_int:
  ; Print an integer in EAX to stdout
  pushad
  mov     ebx, eax
  mov     ecx, 10
  mov     edi, esp
  add     edi, 32
  mov     byte [edi], 0
  dec     edi
print_digit:
  xor     edx, edx
  div     ecx
  add     dl, '0'
  dec     edi
  mov     [edi], dl
  test    ebx, ebx
  jnz     print_digit
  mov     eax, 4
  mov     ebx, 1
  lea     ecx, [edi]
  mov     edx, esp
  sub     edx, ecx
  int     0x80
  popad
  ret

section .data
  prompt db "Enter the limit for the Fibonacci series: ", 0
  prompt_len equ $ - prompt
