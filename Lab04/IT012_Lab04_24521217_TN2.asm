
# Ma nguon 5 - phan bac dien nang
.data
prompt: .asciiz "Nhap dien nang (kWh): "
msg:    .asciiz "Bac: "
nl:     .asciiz "\n"

.text
.globl main
main:
    # In thong bao nhap
    li $v0, 4
    la $a0, prompt
    syscall

    # Nhap dien nang
    li $v0, 5
    syscall
    add $s0, $v0, $zero

    # Kiem tra bac 1: kWh <= 100
    slti $t0, $s0, 101
    bne $t0, $zero, Bac1

    # Kiem tra bac 2: kWh <= 150
    slti $t0, $s0, 151
    bne $t0, $zero, Bac2

    # Kiem tra bac 3: kWh <= 200
    slti $t0, $s0, 201
    bne $t0, $zero, Bac3

    # Con lai la bac 4
    j Bac4

Bac1:
    addi $s1, $zero, 1
    j InKetQua

Bac2:
    addi $s1, $zero, 2
    j InKetQua

Bac3:
    addi $s1, $zero, 3
    j InKetQua

Bac4:
    addi $s1, $zero, 4
    j InKetQua

InKetQua:
    # In "Bac: "
    li $v0, 4
    la $a0, msg
    syscall

    # In so bac
    li $v0, 1
    add $a0, $s1, $zero
    syscall

    # Xuong dong
    li $v0, 4
    la $a0, nl
    syscall

    # Ket thuc
    li $v0, 10
    syscall
