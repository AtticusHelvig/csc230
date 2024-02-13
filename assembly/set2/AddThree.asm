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
	add $t1, $v0, $zero	# Store first integer in $t1
	
	li $v0, 4	# Set syscall to print string
	syscall
	
	li $v0, 5	# Set syscall to read integer
	syscall
	add $t2, $v0, $zero	# Store first integer in $t2
	
	add $s0, $t0, $t1	# Add ints 1 & 2, store in $s0
	add $s0, $s0, $t2	# Add int 3 to total, store in $s0
	
	li $v0, 1	# Set syscall to print integer
	add $a0, $s0, $zero	# Set syscall argument to $s0
	syscall
	
	li $v0, 10	# Set syscall to exit
	syscall
	