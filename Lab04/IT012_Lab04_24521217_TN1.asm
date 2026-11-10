
# Ma nguon 2 - doc reading, ghi usage
.data
reading: .word 1000, 1095, 1205, 1345, 1510, 1715, 1955
         .word 2210, 2440, 2625, 2775, 2895, 2995
usage:   .space 48

.text
.globl main
main:
    la $s0, reading
    la $s1, usage

    # Thang 1
    lw $t0, 0($s0)
    lw $t1, 4($s0)
    sub $t2, $t1, $t0
    sw $t2, 0($s1)

    # Thang 2
     lw $t0, 4($s0)
    # lw $t1, 2($s0)
    lw $t1, 8($s0)
    sub $t2, $t1, $t0
    sw $t2, 4($s1)

    # Thang 3
    lw $t0, 8($s0)
    lw $t1, 12($s0)
    sub $t2, $t1, $t0
    sw $t2, 8($s1)

    li $v0, 10
    syscall
