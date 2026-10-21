
# Ma nguon 5 - in mot thong bao va mot so nguyen
.data
msg: .asciiz "Dien nang (kWh): "
nl:  .asciiz "\n"

.text
.globl main
main:
    addi $t0, $zero, 150

    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 1 #s?a
    add $a0, $t0, $zero
    syscall

    li $v0, 4
    la $a0, nl
    syscall

    li $v0, 10
    syscall
