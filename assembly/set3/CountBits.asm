.data   
PROPMT: .asciiz "Enter an integer: "
RESPONSE: .asciiz "Number of 1's: "

.text   
    addi $v0, $zero, 4      # system call #4 - print string
    la $a0, PROPMT
    syscall                 # execute

    addi $v0, $zero, 5      # system call #5 - input int
    syscall                 # execute

    move $s0, $v0           # move read int to $s0

    li $t0, 0               # initialize $t0 to 0
    li $t1, 32              # initialize $t1 to 32
    li $t2, 2               # initialize $t2 to 2

LOOP:   
    rem $t3, $s0, $t2       # $t3 = $s0 % 2
    beq $t3, $zero, SKIP
    addi $t0, $t0, 1        # increment $t0
SKIP:   
    srl $s0, $s0, 1         # shift $s0 to the right
    subi $t1, $t1, 1        # decrement $t1
    bne $t1, $zero, LOOP    # continue the loop if $t1 != 0

    addi $v0, $0, 4		    # system call #4 - print string
    la $a0, RESPONSE
    syscall                 # execute

    addi $v0, $zero, 1      # system call #1 - print int
    add $a0, $zero, $t0
    syscall                 # execute

    addi $v0, $0, 10        # System call 10 - Exit
    syscall                 # execute
