.data
N: .word 4 #number of words
L: .word 6 #lenght of sequnces
seqs: .word 43, 52, 25, 32  
result: .space 64 # we need to store 16 results #each sequence is 4x4 words and it is 16x4 bytes in space
.text
main:

#load N into registers
la $t0, N #address of N is t0, expandable
lw $t1, 0($t0) #reads address goes to memory and stores value in t1 register

#calculate hamming distance and record it into memory array
la $t2, L 
lw $t3, 0($t2)


#int z;
#for(int i = 0, i < 4, i ++)
#{
#for(int y = 0, y < 4, y++)
#{
#if y!=i
   # int number = seq(i) xor seq(y)
    #result[z] = number
    #z++
#}
#}
#Write results into result array

add $t0, $0, $0 #i in first loop
add $t2, $0, $0 # y in the second loop

la $t4, result  # z or address in memory for result array

la $t5, seqs # address of seq is in $t5 register for x in the loop


outerloop:
    beq $t1, $t0, jump
    lw $t6, 0($t5) #contains the word corresponding to that address x
    la $t7, seqs #address of seq for y in the loop
    add $t2, $0, $0
    blt $t0, $t1, innerloop
    
innerloop:
    lw $t8, 0($t7) #contains the word corresponding to that address y
    xor $t9, $t6, $t8 #Computes hamming distance but in binary
    add $s0, $0, $0 #i for counter in the loop
    add $s1, $0, $0
    count1s:
        andi $s2, $t9, 1 # and the first element to check for 1
        add $s1, $s1, $s2 # add the count from the and operation. Either 1 or 0 
        addi $s0, $s0, 1 # increment counter
        srl $t9, $t9, 1
        blt $s0, $t3, count1s 
    sw $s1, 0($t4)#Store result in memory
    addi $t4, $t4, 4 #increment Z
    addi $t2, $t2, 1
    addi $t7, $t7, 4 #increment address of inner loop  
blt $t2, $t1, innerloop

    addi $t5, $t5, 4 #increment address # go to the next address of x
    addi $t0, $t0, 1 # increment i
    add $t2, $0, $0 # reset y

blt $t0, $t1, outerloop


#Print result 
#for(int i =0; i < result.size(); i++)
#{
#    print(result[i])
#}


jump:
add $t0, $0, $0 #i variable in the for loop
la $t2, result #loads address of result
mul $t1, $t1, $t1 
print:
    beq $t0, $t1, endprint
    lw $a0, 0($t2)
    li $v0, 1
    syscall
    
    li $v0, 11     # print character
    li $a0, 10     # ASCII code for newline
    syscall

    addi $t0, $t0, 1
    addi $t2, $t2, 4
    j print

endprint:
    li $v0, 10
    syscall




