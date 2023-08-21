
.section .text
.global load
.type load, @function

load:

add a5, a0, zero
add a2, a0, a1
add a3, a0, zero

loop:

add a5, a3, a5
addi a3, a3, 1
blt a3, a2, loop
add a0, a5, zero
ret
