.data
PROMPT: .asciiz "Enter a String: "
INPUT: .space 256

OUT1: .asciiz "Number of characters: "
OUT2: .asciiz "\nNumber of spaces: "

.text
    addi $v0, $0, 4 			# system call #4 - print string
    la $a0, PROMPT
    syscall 					# execute

    addi $v0, $0, 8 			# system call #8 - input string
    la $a0, INPUT
    li $a1, 256
    syscall 					# execute

    add $s0, $a0, $0 			# $s0 = $a0 + $0
    addi $s7, $0, ' '            # $s7 = ' '
    
LOOP:
    lbu $t0, 0($s0)
    beq $t0, $0, EXIT

    addi $s1, $s1, 1  			# $s1 = $s1 + 1
    bne $t0, $s7, SKIP
    addi $s2, $s2, 1  			# $s2 = $s2 + 1

SKIP:
    addi $s0, $s0, 1  			# $s0 = $s0 + 1
    j LOOP 						# jump to LOOP
    

EXIT:
    addi $v0, $0, 4 			# system call #4 - print string
    la $a0, OUT1
    syscall 					# execute

    addi $v0, $0, 1 			# system call #1 - print int
    add $a0, $0, $s1
    syscall 					# execute

    addi $v0, $0, 4 			# system call #4 - print string
    la $a0, OUT2
    syscall 					# execute

    addi $v0, $0, 1 			# system call #1 - print int
    add $a0, $0, $s2
    syscall 					# execute

    addi $v0, $0, 10 			# System call 10 - Exit
    syscall 					# execute
