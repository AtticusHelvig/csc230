.data
A:	.word	-491
	.word	490
	.word	144
	.word	-107
	.word	257
	.word	-233
	.word	-388
	.word	427
	.word	-324
	.word	269
	.word	179
	.word	41
	.word	-433
	.word	461
	.word	248
	.word	259
	.word	397
	.word	-326
	.word	435
	.word	-37
	.word	-446
	.word	410
	.word	73
	.word	-338
	.word	329
	.word	272
	.word	-216
	.word	-173
	.word	-125
	.word	117
	.word	179
	.word	-387
	.word	497
	.word	-375
	.word	-185
	.word	490
	.word	338
	.word	425
	.word	13
	.word	447

B:
	.word	-310
	.word	9
	.word	-266
	.word	-346
	.word	-179
	.word	-255
	.word	-398
	.word	94
	.word	-35
	.word	448
	.word	360
	.word	367
	.word	-498
	.word	-260
	.word	-132
	.word	418
	.word	412
	.word	-494
	.word	-53
	.word	-469
	.word	63
	.word	35
	.word	-322
	.word	-163
	.word	-177
	.word	-22
	.word	390
	.word	134
	.word	-52
	.word	-188
	.word	-483
	.word	325
	.word	107
	.word	-402
	.word	104
	.word	-322
	.word	31
	.word	-421
	.word	475
	.word	391

OUT: .asciiz "The index of the closest points is "

.text
    la $a0, A
    la $a1, B
    li $a2, 0	# $a2 = 0
    jal CALC	# jump to CALC and save position to $ra

    # s2 = smallestValue
    move $s2, $v0	# $s2 = $v0
    # s1 = smallestIndex
    li $s1, 0	# $s1 = 0
    # s0 = loopCounter
    li $s0, 0	# $s0 = 0
LOOP:
    slti $t0, $s0, 20	# $t0 = ($s0 < 20) ? 1 : 0
    beq $t0, $zero, EXIT	# if $t0 != $zero then goto EXIT

    la $a0, A
    la $a1, B
    move $a2, $s0	# $a0 = $s0
    jal CALC	# jump to CALC and save position to $ra
    move $t0, $v0	# $t0 = $v0

    slt $t1, $t0, $s2   # $t0 = ($t1 < $s2) ? 1 : 0
    beq $t1, $zero, SKIP	# if $t1 != $zero then goto SKIP
    move $s2, $t0	# $s2 = $t0
    move $s1, $s0	# $s1 = $s0

SKIP:
    addi $s0, $s0, 1	# $s0 = $s0 + 1
    j LOOP	# jump to LOOP


EXIT:
    addi $v0, $0, 4	# system call	#4 - print string
    la $a0, OUT
    syscall	# execute

    addi $v0, $0, 1	# system call	#1 - print int
    add $a0, $0, $s1
    syscall	# execute

    addi $v0, $0, 10	# System call 10 - Exit
    syscall	# execute

CALC:
    sll $t0, $a2, 3	# $t0 = $a2 << 3
    add $a0, $a0, $t0	# $a0 = $a0 + $t0
    add $a1, $a1, $t0	# $a1 = $a1 + $t0

    lw $t0, 0($a0)
    lw $t1, 0($a1)
    sub $t0, $t0, $t1	# $t0 = $t0 - $t1
    mul $t0, $t0, $t0   # $t0 = $t0 * $t0

    lw $t1, 4($a0)
    lw $t2, 4($a1)
    sub $t1, $t1, $t2	# $t1 = $t1 - $t2
    mul $t1, $t1, $t1   # $t0 = $t0 * $t0

    add $v0, $t0, $t1	# $v0 = $t0 + $t1
    jr $ra	# jump to $ra