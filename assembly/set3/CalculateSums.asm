.data
PROMPT: .asciiz "Value of N to try? "
OUT1: .asciiz "Iterative Sum: "
OUT2: .asciiz "\nFormula Sum: "

.text
    addi $v0, $0, 4 			# system call #4 - print string
    la $a0, PROMPT
    syscall 		            # execute

    addi $v0, $0, 5 			# system call #5 - input int
    syscall 		            # execute

    add $t0, $v0, $0
    add $s0, $v0, $0
    li $s1, 0       			# execute

LOOP:
    beq $t0, $0, FORMULA
    add $s1, $s1, $t0
    addi $t0, $t0, -1            # $t0 = $t0 - 1
    j LOOP 						 # jump to LOOP

FORMULA:
    mul $t0, $s0, $s0
    add $t0, $t0, $s0
    li $t1, 2
    div $s2, $t0, $t1

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
    