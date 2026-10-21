
# Ma nguon 4 - chuyen cau lenh thanh lenh hop ngu

# y = $s0 = 8
# z = $s1 = 5
# w = $s2 = 3
# x1 = $t0
# x2 = $t1
# x3 = $t2
# x4 = $t3
# $t5: thanh ghi tam

.text
.globl main
main:
    addi $s0, $zero, 8
    addi $s1, $zero, 5
    addi $s2, $zero, 3

    # x1 = y + z + w
    add $t0, $s0, $s1
    add $t0, $t0, $s2

    # x2 = (y + z) - (w + 5)
    addi $t5, $s2, 5
    add $t1, $s0, $s1
    sub $t1, $t1, $t5

    # x3 = y
    add $t2, $s0, $zero

    # x4 = z - y
    sub $t3, $s1, $s0

    li $v0, 10
    syscall
