# Module 2

## Practice Question Answers & Explanations

### Question 1

A RISC processor Simplifies the processor by efficiently implementing only the instructions that are frequently used in programs. What Great Idea is this?

- `Prediction`

- `Redundancy`

- `Hierarchies of Memory`

- `Pipelining`

- `Moore’s Law`

- `Parallelism`

- `Common Case Fast`

- `Abstraction`

**Answer**: `Common Case Fast`

**Explanation:** The idea behind "Common Case Fast" is to prioritize the common operations to be executed quickly, thereby improving overall processor performance. This approach aligns with the RISC philosophy of simplicity and efficiency in processor design. Therefore, the statement accurately describes the concept of "Common Case Fast" as a great idea in processor design, particularly associated with RISC architectures.
 
### Question 2
Match the register set to the conventional use:
- `$zero`
 
- `$vn`
 
- `$an`
 
- `$tn`
 
- `$sn`
 
- `$sp`
 
- `$ra`

`Values that a function must preserve`

`Values passed to a function`

`Represents the constant 0`

`Points to location of instruction following a jal`

`Values returned from funcitons`

`Points to dynamic memory that can be used`

`Values that may not survive a function call`

**Answer:**
- `$zero`: Represents the constant 0
- `$vn`: Values returned from funcitons
- `$an`: Values passed to a function
- `$tn`: Values that may not survive a function call
- `$sn`: Values that a function must preserve
- `$sp`: Points to dynamic memory that can be used
- `$ra`: Points to location of instruction following a jal

> [!NOTE]
> In this question `n` refers to some number.
> For example, `$tn` refers to `$t0`, `$t1`, etc.

A good way to remember these is by looking at what they stand for.
- `$vn`: return **value**
- `$an`: function **arguments**
- `$tn`: **temporary**
- `$sn`: **saved**
- `$sp`: **stack pointer**
- `$ra`: **return address**
 
 
### Question 3
The following is a legal MIPS instruction: `lw $zero, 0($s1)`

- `True`

- `False`

**Answer:** `False`

**Explanation:** The `$zero` register is **always** 0. You are not allowed to change it. Therefore, trying to load anything into `$zero` will fail.
 
### Question 4
Which of the following instructions is unnecessary?

- `lbu`

- `sb`

- `sbu`

- `lb`

**Answer:** `sbu`

**Explanation:** `sb` is the "store byte" instruction. As it stands, `sb` already stores the bytes in an *unsigned* way. No sign extension or anything like that occurs. Therefore there is no need for a "store byte unsigned" instruction like `sbu`.
 
### Question 5

Translate the following into machine code: `add $t0, $s1, $s2`

All answers should be in decimal. Enter 0, not blank, if appropriate for a field.

- `opcode:`

- `rs:`

- `rt:`

- `rd:`

- `shamt:`

- `funct:`

**Answer:**

- `opcode:` `0`

- `rs:` `17`

- `rt:` `18`

- `rd:` `8`

- `shamt:` `0`

- `funct:` `32`

**Explnation:**

> [!NOTE]
> Many of these values can be found on your green MIPS sheet.

The MIPS R-type instruction format is typically represented as follows:

```
  6        5    5    5    5       6
| opcode | rs | rt | rd | shamt | funct |
```

Given the instruction `add $t0, $s1, $s2`, where:
- `$t0`, `$s1`, and `$s2` are registers.

Let's break down the instruction:

- `add`: Opcode for addition operation in MIPS is `0x00` or `0` in decimal.
- `$s1` is the first source register, so it corresponds to `rs`.
- `$s2` is the second source register, so it corresponds to `rt`.
- `$t0` is the destination register, so it corresponds to `rd`.

>[!WARNING]
> Remember, the machine code register order is not the same as the assembly register order. For R-type instructions the order is `OP rd, rs, rt`.

Let's find the values for each field:

- `opcode`: `0` (for `add` operation)
- `rs`: The register number for `$s1` is typically `17` in decimal.
- `rt`: The register number for `$s2` is typically `18` in decimal.
- `rd`: The register number for `$t0` is typically `8` in decimal.
- `shamt`: Not used in this instruction, so it's `0`.
- `funct`: For `add` operation, the function code is typically `0x20` in hex or `32` in decimal.
 
### Question 6

Translate the following into machine code: `lw $s1, 5($t0)`

All answers should be in decimal. Enter 0, not blank, if appropriate for a field.

- `opcode:`

- `rs:`

- `rt:`

- `constant:`

**Answer:**

- `opcode:` `35`

- `rs:` `8`

- `rt:` `17`

- `constant:` `5`

**Explanation:**

I-type MIPS instructions have the following format:

```
  6        5    5    16
| opcode | rs | rt | constant/immediate |
```

Now let's break down the given instruction:

- `lw` is the opcode for "load word" operation, which is `0x23` in hex, `35` in decimal.
- `$s1` is the destination register, which corresponds to `rt` in the MIPS instruction format.
- `$t0` is the base register, which corresponds to `rs` in the MIPS instruction format.
- `5` is the constant offset value.

Register `$s1` is represented by `17` in decimal, register `$t0` is represented by `8` in decimal, and the constant offset value is `5`.
 
### Question 7

Translate the following into machine code: `sll $t0, $t1, 12`

All answers should be in decimal. Enter 0, not blank, if appropriate for a field.

- `opcode:`

- `rs:`

- `rt:`

- `rd:`

- `shamt:`

- `funct:`

**Answer:**

- `opcode:` `0`

- `rs:` `0`

- `rt:` `9`

- `rd:` `8`

- `shamt:` `12`

- `funct:` `0`

**Explanation:**

`sll` is an R-type instruction.

Given the instruction `sll $t0, $t1, 12`, here's how we break it down:

- `opcode`: This operation is a shift left logical (`sll`) operation, which is represented by `0` in decimal.
- `rs`: There's no source register operand in this instruction, so this field will be `0`.
- `rt`: The target register operand is `$t1`, which corresponds to register `9`.
- `rd`: The destination register operand is `$t0`, which corresponds to register `8`.
- `shamt`: The shift amount is `12`.
- `funct`: Since `sll` is an R-type instruction, the function field is used for specifying the operation. For `sll`, the function code is `0x0` in hex, which is also `0` in decimal.
 
### Question 8
MIPS has 32 registers. In an R-type instruction we need to refer to up to 3 registers. Based on these facts, how many bits total will we need to set aside for register references in an R-type instruction?

**Answer:** `15`

**Explanation:** To store one number, from 0 to 31, we need 5 bits `(2⁵)`. So to store three numbers, from 0 to 31 we need three times as much room. 3 * 5 = 15.
 
### Question 9
Write the assembler instruction (not the machine code) to transfer the contents of the $s1 register into the $t1 register.

Do not use pseudo-instructions!

**Answer:** 
```mips
add $t1, $s1, $zero
```

**Explanation:**

To transfer the contents of the `$s1` register into the `$t1` register in MIPS without using pseudo-instructions, you would use the `ADD` instruction with `$zero` as the source register. This may seem counterintuitive, but it effectively copies the contents of one register to another without performing any arithmetic operation.

- `ADD`: While its primary purpose is arithmetic addition, when one of the source operands is `$zero`, it effectively becomes a move operation.
- `$t1`: This is the destination register where the contents of `$s1` will be copied.
- `$s1`: This is the source register whose contents will be copied into `$t1`.
- `$zero`: This register always contains the value zero. Using it as the source operand in an `ADD` instruction effectively just copies the contents of the other source register (in this case, `$s1`) into the destination register (`$t1`) without performing any arithmetic operation.
 
### Question 10
For each of the following I-type instructions, indicate how the immediate value is used. That is, what role does the immediate play in each instruction?

- `addi`
- `lw`
- `beq`

**Answer:**

1. **`addi`** (Add Immediate):
   - The immediate value in the `addi` instruction is used to specify a constant value to be added to the contents of a register. It is a way to perform addition with a constant value directly within the instruction itself. For example, `addi $t0, $t1, 10` means add the value `10` to the contents of register `$t1` and store the result in register `$t0`.

2. **`lw`** (Load Word):
   - In the `lw` instruction, the immediate value is used as an offset to calculate the memory address from which data is loaded. The instruction syntax typically looks like `lw $t0, offset($t1)`, where the immediate value (`offset`) is added to the contents of register `$t1` to calculate the memory address from which to load the word, and then the loaded data is stored in register `$t0`.

3. **`beq`** (Branch if Equal):
   - In the `beq` instruction, the immediate value is used as a target address relative to the current instruction address. It specifies the offset to branch to if the two registers being compared are equal. For example, `beq $t0, $t1, 10` means if the contents of registers `$t0` and `$t1` are equal, branch to the instruction that is `10` instructions ahead of the current instruction.

>[!NOTE]
> Answers may vary.
 
### Question 11
Use the register and memory values in the tables below for the next FOUR questions. The first table says, for example, that Register R1 has the value 12. The second table says that the memory at address 12 has the value 16.

Assume each of the following questions starts from the table values; that is, **DO NOT** use value changes from one question as propagating into future parts of the question.
```
Register 	Register Value (decimal)
R1 	        12
R2 	        16
R3 	        20
R4 	        24
```

```
Memory Address (decimal) 	Memory Value (decimal)
12 	                        16
16 	                        20
20 	                        24
24 	                        28
```

`add R3, R2, R1`

Give the values of R1: , R2: , and R3: after this instruction.

All answers should be in decimal. Enter 0, not blank, if appropriate for a field.

**Answer:**

- `R1:` `12`
- `R2:` `16`
- `R3:` `28`

**Explanation:**
The instruction `add R3, R2, R1` adds the values stored in registers R2 and R1 and stores the result in register R3. So, R3 will contain the sum of R2 and R1, i.e., 16 + 12 = 28.

### Question 12

`lw R3, 12(R1)`

Give the values of R1: and R3: after this instruction.

All answers should be in decimal. Enter 0, not blank, if appropriate for a field.
 
**Answer:**

- `R1:` `12`
- `R3:` `16`

**Explanation:**
The instruction `lw R3, 12(R1)` loads the value from memory address 12 + content of R1 into register R3. From the memory table, the value at address 12 is 16. Hence, R3 will contain 16.
 
### Question 13

addi R2, R3, 16

Give the values of R2: and R3: after this instruction. 

All answers should be in decimal. Enter 0, not blank, if appropriate for a field.

**Answer:**

- `R2:` `36`
- `R3:` `20`

**Explanation:**
The instruction `addi R2, R3, 16` adds the immediate value 16 to the value stored in register R3 and stores the result in register R2. So, R2 will contain 20 + 16 = 36. The value of R3 remains unchanged, which is 20.

### Question 14

`slt R1, R3, R4`

Give the values of R1: , R3: , and R4: after this instruction.

All answers should be in decimal. Enter 0, not blank, if appropriate for a field.

**Answer:**

- `R1:` `1`
- `R3:` `20`
- `R4:` `24`

Explanation:
The instruction `slt R1, R3, R4` sets the value of R1 to 1 if the value of R3 is less than the value of R4; otherwise, it sets R1 to 0. Here, R3 has the value 20 and R4 has the value 24. Since 20 is less than 24, R1 will be set to 1.
 
 
### Question 15

Convert the following sequence of code into MIPS assembler. Its OK to use additional temporary registers if you feel it is necessary.

`x = x + y + z - q;`

Assume that x, y, z, q are stored in registers $s1-$s4. There is no need to save the registers on the stack beforehand.

**Answer:**

```mips
# Add y and z and store the result in temporary register $t0
add $t0, $s2, $s3

# Subtract q from the result of y + z and store the result in temporary register $t1
sub $t1, $t0, $s4

# Add the previous result to the current value of x and store the final result back in $s1 (x)
add $s1, $s1, $t1
```

Explanation:

1. `add $t0, $s2, $s3`: This instruction adds the contents of registers `$s2` (y) and `$s3` (z) and stores the result in temporary register `$t0`.

2. `sub $t1, $t0, $s4`: This instruction subtracts the content of register `$s4` (q) from the value stored in `$t0` (result of y + z) and stores the result in temporary register `$t1`.

3. `add $s1, $s1, $t1`: This instruction adds the content of `$t1` (result of y + z - q) to the current value of `$s1` (x) and stores the final result back in `$s1`.
 
### Question 16

Convert the following sequence of code into MIPS assembler. It is not necessary to save the $s registers on the stack first. Assume ints. Its OK to use additional temporary registers if you feel it is necessary.

`g = h + a[10];`

g in $s1, h in $s2, base address of a in $s3

**Answer:**

```mips
# Load the base address of array 'a' into a register
lw $t0, 40($s3)   # Assuming each integer occupies 4 bytes, so the offset for a[10] would be 40 bytes.

# Add the value of 'h' to the value loaded from a[10]
add $s1, $s2, $t0   # Add 'h' ($s2) to the value loaded from a[10] ($t1)

# Result: g = h + a[10]
```

Explanation:

- We load the value stored at `a[10]` into `$t0` using the calculated memory address (`$s3 + offset`).
- Then we add the value of `h` stored in `$s2` to the value loaded from `a[10]` stored in `$t0`.
- Finally, the result is stored in `$s1`, which represents `g`.
 
### Question 17

Convert the following sequence of code into MIPS assembler. Its OK to use additional temporary registers if you feel it is necessary.

```c
if (i==j)
    f = g+h;
else
    f = g-h;
```

f, g, h, i, j in $s0, $s1, $s2, $s3, $s4. There is no need to save the registers on the stack beforehand.

**Answer:**
```mips
IF:
    bne $s3, $s4, ELSE  # if i != j go to ELSE
    add $s0, $s1, $s2   # f = g + h;
    j SKIP              # SKIP the ELSE block
ELSE:
    sub $s0, $s1, $s2   # f = g - h;
SKIP:
```

**Explanation:** The logic might look backward at first, but we want to go to the `ELSE` block if the condition `i == j` is **NOT** true. For that we use the `bne` instruction. If the condition was true, we would continue in the `IF` block until we hit the `j SKIP`. This instruction is important because it stops us from wandering into the `ELSE` block after we finish with the `IF` block.

### Question 18

Convert the following sequence of code into MIPS assembler:

Save $s1, $s2 and $ra on the stack.

**Answer:**

```mips
# Adjust the stack pointer to allocate space for three words
addi $sp, $sp, -12   # Assuming each register occupies 4 bytes

# Store $s1 onto the stack
sw $s1, 0($sp)

# Store $s2 onto the stack
sw $s2, 4($sp)

# Store $ra onto the stack
sw $ra, 8($sp)
```

Let's break down each instruction:

1. `addi $sp, $sp, 12`: This instruction subtracts 12 from the stack pointer, effectively allocating space for three words (assuming each register is 4 bytes).
2. `sw $s1, 0($sp)`: This instruction stores the value of `$s1` onto the stack at the current stack pointer location (`$sp`). Since `$s1` is the first register we're storing, we offset it by 0 bytes from the stack pointer.
3. `sw $s2, 4($sp)`: This instruction stores the value of `$s2` onto the stack, offsetting it by 4 bytes from the stack pointer, as it comes after `$s1`.
4. `sw $ra, 8($sp)`: This instruction stores the value of `$ra` onto the stack, offsetting it by 8 bytes from the stack pointer, as it comes after `$s2`.
  
This sequence effectively saves `$s1`, `$s2`, and `$ra` onto the stack, making space for them and storing their values accordingly.
 
### Question 19

Convert the following sequence of code into MIPS assembler:

Restore $s1, $s2 and $ra from the stack (assuming code from previous question).

**Answer:**

```mips
# Load $ra from the stack
lw $ra, 8($sp)

# Load $s2 from the stack
lw $s2, 4($sp)

# Load $s1 from the stack
lw $s1, 0($sp)

# Adjust the stack pointer to deallocate the space
addi $sp, $sp, 12   # Assuming each register occupies 4 bytes
```

Let's break down each instruction:

1. `lw $ra, 8($sp)`: This instruction loads the value of `$ra` from the stack. Since `$ra` was stored at an offset of 8 bytes from the stack pointer, we use `lw` (load word) with an offset of 8 bytes from the stack pointer.
2. `lw $s2, 4($sp)`: This instruction loads the value of `$s2` from the stack. Since `$s2` was stored at an offset of 4 bytes from the stack pointer, we use `lw` with an offset of 4 bytes from the stack pointer.
3. `lw $s1, 0($sp)`: This instruction loads the value of `$s1` from the stack. `$s1` was stored at the top of the stack (no offset), so we use `lw` with no offset from the stack pointer.
4. `addi $sp, $sp, 12`: This instruction adjusts the stack pointer to deallocate the space used for storing `$s1`, `$s2`, and `$ra`. We add 12 to the stack pointer to move it back to its original position before the registers were saved.

This sequence effectively restores `$s1`, `$s2`, and `$ra` from the stack and deallocates the space used for them.
 
### Question 20
What instruction can you use to load a 16-bit constant into a register?

**Answer:** `addi`

**Explanation:**
Using `addi` in combination with the `$zero` register effectively loads an immediate value into a register. Example: `addi $t0, $zero, 221`, puts the value `221` into register `$t0`.

> [!NOTE]
> The `li` instruction would also be acceptable.
 
### Question 21
What two instructions do you use to load a 32-bit constant into a register?

**Answer:** `lui, ori`

**Explanation:**
1. `lui` (Load Upper Immediate): This instruction loads a 16-bit immediate value into the upper 16 bits of a register and sets the lower 16 bits to zero. To load a complete 32-bit constant, it needs to be combined with an `ori` to load the bottom 16 bits.
 
### Question 22

What value (in decimal) will the branch offset to the label done be translated to?

```mips
      bne $a0, $zero, done
      addi $a1, $a1, 1
      addi $s1, $s1, -1
done: lw $v0, 4($t1)
```

**Answer:** `2`

**Explanation:**

To answer the question, let's first understand how branch instructions work in MIPS assembly language.

The branch offset in MIPS instructions is specified as the number of words (not bytes) by which the program counter should be adjusted if the branch is taken. In MIPS, a word is 4 bytes.

Given the MIPS assembly code snippet provided:

```mips
      bne $a0, $zero, done
      addi $a1, $a1, 1
      addi $s1, $s1, -1
done: lw $v0, 4($t1)
```

The branch instruction `bne $a0, $zero, done` checks if the value in register `$a0` is not equal to zero. If it's not zero, it will branch to the label `done`.

To calculate the branch offset, we need to find the relative address of the label `done` from the branch instruction and convert it into a word offset. Keep in mind, the offset starts from `$pc + 4` which is the **next** instruction.

Let's analyze the instructions up to the label `done`:

- `addi $s1, $s1, -1` (1 instruction)
- `lw $v0, 4($t1)` (2 instructions)

So, the relative address of the label `done` from the branch instruction is 2 instructions ahead.

Since each instruction occupies 4 bytes (1 word) in memory, the branch offset will be 2 words. Therefore, the branch offset to the label `done` will be **2** in decimal.
 
### Question 23

A J-type instruction has room for 26 bits of address. The addresses in a MIPS machine are 32 bits. Where do the missing 6 bits of the address come from? 

Hint: the answer is NOT the opcode. How do we construct a 32-bit address when we only have 26 bits?

**Answer:**

`The first 4 bits are taken from the first 4 bits of the current $pc. The last 2 bits are set to 0.`

**Explanation:** Since we only have 26 bits to work with, MIPS has to cut some corners. We take the first 4 bits of `$pc` and use them for J-type instructions. This means that any place we have to jump has to be in the "vicinity" of our current location. Also, since instructions are always on word boundaries, which are multiples of four, we can set the last two bits to zero.
 
### Question 24

What instructions support synchronization in MIPS?

- `sync/unsync`

- `jar/jr`

- `lw/sw`

- `ll/sc`

**Answer:** `ll/sc`

**Explanation:**
Among the options provided, `ll/sc` are the instructions that support synchronization in MIPS architecture.

- `ll/sc` (Load Linked/Store Conditional): These instructions are specifically designed for synchronization purposes. `ll` loads a word from memory into a register, marking the beginning of a critical section. `sc` stores a word into memory if no other write has occurred since the corresponding `ll`. It returns a success or failure indication. This pair of instructions is often used to implement lock-free synchronization mechanisms such as spin locks or compare-and-swap (CAS) operations.

- `sync/unsync`: These instructions do not exist in the MIPS instruction set architecture. However, similar instructions may exist in other architectures to enforce memory synchronization.

- `jar/jr` (Jump And Return/Jump Register): These instructions are used for control flow and subroutine calls in MIPS assembly language. They do not directly relate to synchronization.

> [!TIP]
> Everything you need to know is in the presentations and the book Professor Eckert uses. Do not become overconfident, but also do not worry. You will do fine, and you will have a chance to make up any points you lose. Best of luck on your exam!
