
# Ho ten: Vo Cao Nguyen
# MSSV: 24521217
# Muc dich: Tinh dien nang va dem so thang theo bac

.data
m1:      .asciiz "Thang "
m2:      .asciiz ": "
mt:      .asciiz "Tong: "
mm:      .asciiz "Thang cao nhat: "
lp:      .asciiz " ("
rp:      .asciiz ")"
nl:      .asciiz "\n"
mb:      .asciiz "Bac "

reading: .word 1000, 1095, 1205, 1345, 1510, 1715, 1955
         .word 2210, 2440, 2625, 2775, 2895, 2995
usage:   .space 48
cnt:     .word 0, 0, 0, 0

.text
.globl main
main:
    la $s0, reading
    la $s1, usage
    la $s7, cnt

    addi $s2, $zero, 0
    addi $s3, $zero, 12

    # Khoi tao tong va gia tri lon nhat
    add $s4, $zero, $zero
    add $s5, $zero, $zero
    add $s6, $zero, $zero

# PHAN 1: TINH DIEN NANG 12 THANG

Loop:
    beq $s2, $s3, DoneMonths

    # Dia chi reading[i]
    sll $t1, $s2, 2
    add $t2, $s0, $t1

    # Doc hai chi so lien tiep
    lw $t3, 0($t2)
    lw $t4, 4($t2)

    # Tinh usage[i]
    sub $t5, $t4, $t3

    # Ghi vao mang usage
    add $t6, $s1, $t1
    sw $t5, 0($t6)

    # Tinh tong
    add $s4, $s4, $t5

    # Tim thang tieu thu cao nhat
    slt $t7, $s5, $t5
    beq $t7, $zero, SkipMax
    add $s5, $t5, $zero
    addi $s6, $s2, 1

SkipMax:
    # In "Thang "
    li $v0, 4
    la $a0, m1
    syscall

    # In so thang
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

    addi $s2, $s2, 1
    j Loop

DoneMonths:
    # In tong
    li $v0, 4
    la $a0, mt
    syscall

    li $v0, 1
    add $a0, $s4, $zero
    syscall

    li $v0, 4
    la $a0, nl
    syscall

    # In thang cao nhat
    li $v0, 4
    la $a0, mm
    syscall

    li $v0, 1
    add $a0, $s6, $zero
    syscall

    li $v0, 4
    la $a0, lp
    syscall

    li $v0, 1
    add $a0, $s5, $zero
    syscall

    li $v0, 4
    la $a0, rp
    syscall

    li $v0, 4
    la $a0, nl
    syscall

# PHAN 2: DEM SO THANG THEO BAC

    addi $s2, $zero, 0

CountLoop:
    beq $s2, $s3, InitPrint

    # Doc usage[i]
    sll $t1, $s2, 2
    add $t2, $s1, $t1
    lw $t3, 0($t2)

    # Bac 1: <= 100
    slti $t0, $t3, 101
    bne $t0, $zero, Bac1

    # Bac 2: <= 150
    slti $t0, $t3, 151
    bne $t0, $zero, Bac2

    # Bac 3: <= 200
    slti $t0, $t3, 201
    bne $t0, $zero, Bac3

    # Bac 4: >= 201
    addi $t4, $zero, 3
    j IncreaseCount

Bac1:
    addi $t4, $zero, 0
    j IncreaseCount

Bac2:
    addi $t4, $zero, 1
    j IncreaseCount

Bac3:
    addi $t4, $zero, 2

IncreaseCount:
    # Dia chi cnt[bac - 1]
    sll $t5, $t4, 2
    add $t6, $s7, $t5

    # Tang cnt bang lw, addi, sw
    lw $t7, 0($t6)
    addi $t7, $t7, 1
    sw $t7, 0($t6)

    # Chuyen sang thang tiep theo
    addi $s2, $s2, 1
    j CountLoop

# PHAN 3: IN SO THANG CUA 4 BAC

InitPrint:
    addi $s2, $zero, 0
    addi $t8, $zero, 4

PrintLoop:
    beq $s2, $t8, End

    # In "Bac "
    li $v0, 4
    la $a0, mb
    syscall

    # In so bac
    li $v0, 1
    addi $a0, $s2, 1
    syscall

    # In ": "
    li $v0, 4
    la $a0, m2
    syscall

    # Doc cnt[i]
    sll $t1, $s2, 2
    add $t2, $s7, $t1
    lw $a0, 0($t2)

    # In so thang
    li $v0, 1
    syscall

    # Xuong dong
    li $v0, 4
    la $a0, nl
    syscall

    addi $s2, $s2, 1
    j PrintLoop

End:
    li $v0, 10
    syscall
