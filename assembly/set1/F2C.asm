.data
prompt:	.asciiz	"Enter temp in F: "
response: .asciiz "Temp in C is: "

.text
	li $v0, 4		# Set syscall to print string
	la $a0, prompt		# Load syscall argument
	syscall
	
	li $v0, 5		# Set syscall to read integer
	syscall
	
	add $t1, $v0, $zero	# Copy syscall output to $t1
	
	li $t2, 5
	li $t3, 9
	
	sub $t1, $t1, 32		# t1 = t1 - 32
	mul $t1, $t1, $t2	# t1 = t1 * 5
	div $t1, $t1, $t3	# t1 = t1 / 9
	
	li $v0, 4		# Set syscall to print string
	la $a0, response		# Load syscall argument
	syscall
	
	li $v0, 1		# Set syscall to print integer
	add $a0, $t1, $zero	# Load sycall argument $t1
	syscall
	
	li $v0, 10		# Set syscall to exit
	syscall
