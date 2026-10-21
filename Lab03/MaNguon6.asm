
# Ma nguon 6 - dien nang tieu thu giua hai chi so

.data
prompt1: .asciiz "Nhap chi so cu (kWh): "
prompt2: .asciiz "Nhap chi so moi (kWh): "
label:   .asciiz "Dien nang (kWh): "
newline: .asciiz "\n"

.text
.globl main
main:
    # Doc chi so cu vao $s0
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5
    syscall
    add $s0, $v0, $zero

    # Doc chi so moi vao $s1
    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 5
    syscall
    add $s1, $v0, $zero

    # usage = current - previous
    sub $t0, $s1, $s0

    # In label
    li $v0, 4
    la $a0, label
    syscall

    # In usage
    li $v0, 1
    add $a0, $t0, $zero
    syscall

    # In newline
    li $v0, 4
    la $a0, newline
    syscall

    # Ket thuc
    li $v0, 10
    syscall
