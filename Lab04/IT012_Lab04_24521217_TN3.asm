
# Ho ten: Vo Cao Nguyen | MSSV: 24521217 | Muc dich: Tinh dien nang 12 thang

.data
m1:      .asciiz "Thang "
m2:      .asciiz ": "
mt:      .asciiz "Tong: "
mm:      .asciiz "Thang cao nhat: "
lp:      .asciiz " ("
rp:      .asciiz ")"
nl:      .asciiz "\n"

# reading: .word 1000, 1095, 1205, 1345, 1510, 1715, 1955
        # .word 2210, 2440, 2625, 2775, 2895, 2995
         
         
reading: .word 1140, 1377, 1569, 1726, 1853, 1960, 2062
         .word 2179, 2326, 2498, 2710, 2957, 3219

usage:   .space 48

.text
.globl main
main:
    la   $s0, reading
    la   $s1, usage
    addi $s2, $zero, 0
    addi $s3, $zero, 12
    
   # Khoi tao tong, max, thang max
	add $s4, $zero, $zero
	add $s5, $zero, $zero
	add $s6, $zero, $zero

Loop:
    # Thoat neu i = 12
    beq $s2, $s3, Done

    # Tinh dia chi reading[i]
    sll $t1, $s2, 2
    add $t2, $s0, $t1

    # Doc reading[i] va reading[i+1]
    lw $t3, 0($t2)
    lw $t4, 4($t2)

    # Tinh dien nang thang
    sub $t5, $t4, $t3

    # Luu vao usage[i]
    add $t6, $s1, $t1
    sw $t5, 0($t6)
    
    # Cong don dien nang
    add $s4, $s4, $t5

    # Kiem tra dien nang lon nhat
    slt $t7, $s5, $t5
    beq $t7, $zero, SkipMax

    # Cap nhat max
    add $s5, $t5, $zero
    addi $s6, $s2, 1

SkipMax:

    # In "Thang "
    li $v0, 4
    la $a0, m1
    syscall

    # In i + 1
    li $v0, 1
    addi $a0, $s2, 1
    syscall

    # In ": "
    li $v0, 4
    la $a0, m2
    syscall

    # In dien nang
    li $v0, 1
    add $a0, $t5, $zero
    syscall

    # Xuong dong
    li $v0, 4
    la $a0, nl
    syscall

    # Tang i va lap lai
    addi $s2, $s2, 1
    j Loop


Done:
    # In "Tong: "
    li $v0, 4
    la $a0, mt
    syscall

    # In tong dien nang
    li $v0, 1
    add $a0, $s4, $zero
    syscall

    # Xuong dong
    li $v0, 4
    la $a0, nl
    syscall

    # In "Thang cao nhat: "
    li $v0, 4
    la $a0, mm
    syscall

    # In so thang
    li $v0, 1
    add $a0, $s6, $zero
    syscall

    # In " ("
    li $v0, 4
    la $a0, lp
    syscall

    # In dien nang lon nhat
    li $v0, 1
    add $a0, $s5, $zero
    syscall

    # In ")"
    li $v0, 4
    la $a0, rp
    syscall

    # Xuong dong
    li $v0, 4
    la $a0, nl
    syscall

    # Ket thuc
    li $v0, 10
    syscall

