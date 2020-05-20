#valores
li	$s1 5 
li	$s2 23
li	$s3 -8

#compara o 1
bgt $s1, $s2, L1
j L7
L1: bgt $s1, $s3, L2
L2: move $t1, $s1
j Exit

#compara o 2
L7: bgt $s2, $s1, L3
L3: bgt $s2, $s3, L4
j L8
L4: move $t1, $s2
j Exit

#compara o 3
L8: bgt $s3, $s1, L5
L5: bgt $s3, $s2, L6
L6: move $t1, $s3

Exit :  
