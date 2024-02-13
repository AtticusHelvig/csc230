.data
prompt: .asciiz "Enter an integer: "

.text
	li $v0, 4	# Set syscall to print string
	la $a0, prompt	# Set argument of syscall
	syscall
	
	li $v0, 5	# Set syscall to read integer
	syscall
	add $t0, $v0, $zero	# Store first integer in $t0
	
	li $v0, 4	# Set syscall to print string
	syscall
	
	li $v0, 5	# Set syscall to read integer
	syscall
	add $t1, $v0, $zero	# Store second integer in $t1
	
	li $v0, 4	# Set syscall to print string
	syscall
	
	li $v0, 5	# Set syscall to read integer
	syscall
	add $t2, $v0, $zero	# Store third integer in $t2
	
	blt $t0, $t1, SKIP	# int 1 < int 2
	move $t0, $t1		# int 1 = int 2
SKIP:
	blt $t0, $t2, RESULT	# int 1 < int 3
	move $t0, $t2			# int 1 = int 3
RESULT:

	li $v0, 1	# Set syscall to print int
	move $a0, $t0
	syscall
	
	li $v0, 10	# Set syscall to exit
	syscall
	
