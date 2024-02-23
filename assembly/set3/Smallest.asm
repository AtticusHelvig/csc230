.data
PROMPT: .asciiz "Enter an integer: "
RESPONSE: .asciiz "The smallest number is "

.text
DO:
    addi $v0, $0, 4 			# system call #4 - print string
    la $a0, PROMPT
    syscall 					# execute

    addi $v0, $0, 5 			# system call #5 - input int
    syscall 					# execute
    addi $s0, $v0, 0  			# $s0 = $v0 + 0
    
LOOP:
    beq $v0, $zero, EXIT        # if $v0 == $zero then goto EXIT

    addi $v0, $0, 4 			# system call #4 - print string
    la $a0, PROMPT
    syscall 					# execute

    addi $v0, $0, 5 			# system call #5 - input int
    syscall 					# execute

    slt $t0, $s0, $v0           # $t0 = ($s0 < $v0) ? 1 : 0
    bne $t0, $zero, SKIP 		# if $t0 != $zero then goto SKIP
    add $s0, $v0, $0 			# $s0 = $v0 + $0

SKIP:
    j LOOP                      # jump to LOOP
    
EXIT:
    addi $v0, $0, 4 			# system call #4 - print string
    la $a0, RESPONSE
    syscall 					# execute

    addi $v0, $0, 1 			# system call #1 - print int
    add $a0, $0, $s0
    syscall 					# execute

    addi $v0, $0, 10            # System call 10 - Exit
    syscall                     # execute

    
    
    
    
    
    
    
    
    