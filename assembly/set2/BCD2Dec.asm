.data
prompt: .asciiz "BCD: "

.text
	li $v0, 4			# Set syscall to print string
	la $a0, prompt		# Set argument of syscall
	syscall
	
	li $v0, 5			# Set syscall to read int
	syscall
	
	addi $s0, $v0, 0	# Store input in $s0
	
	li $t0, 4			# Loop 4 times (4 digit number)
	li $t1, 1000		# Set current place value (1000s place)
	
	li $s1, 0			# Initialize $s1 to 0
LOOP:
	div $t2, $s0, $t1	# Divide by current place-value
	sll $s1, $s1, 4		# Shift bits (BCD is 4 bits each)
	or $s1, $s1, $t2	# Or digit to end
	
	mul $t3, $t2, $t1
	sub $s0, $s0, $t3	# Subtract from original value
	
	div $t1, $t1, 10	# Reduce place value
	
	subu $t0, $t0, 1	# Decrement loop variable
	bnez $t0, LOOP
	
	li $v0, 1			# Set syscall to print int
	addi $a0, $s1, 0	# Set argument of syscall
	syscall
	
	li $v0, 10			# Exit
	syscall
	
