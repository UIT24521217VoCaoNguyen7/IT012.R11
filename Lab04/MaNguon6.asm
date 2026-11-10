
# Ma nguon 6 - duyet va in mang reading
.data
nl:      .asciiz "\n"
reading: .word 1000, 1095, 1205, 1345, 1510, 1715, 1955
         .word 2210, 2440, 2625, 2775, 2895, 2995

.text
.globl main
main:
    la   $s0, reading
    addi $s2, $zero, 0
    addi $s3, $zero, 13

Loop:
    beq  $s2, $s3, Done
    sll  $t1, $s2, 2
    add  $t1, $t1, $s0
    lw   $a0, 0($t1)

    li   $v0, 1
    syscall

    li   $v0, 4
    la   $a0, nl
    syscall

    addi $s2, $s2, 1
    j Loop

Done:
    li $v0, 10
    syscall
