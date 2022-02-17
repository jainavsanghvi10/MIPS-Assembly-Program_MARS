#run in linux terminal by java -jar Mars4_5.jar nc filename.asm(take inputs from console)

#system calls by MARS simulator:
#http://courses.missouristate.edu/kenvollmar/mars/help/syscallhelp.html
.data
	next_line: .asciiz "\n"	
.text
#input: N= how many numbers to sort should be entered from terminal. 
#It is stored in $t1	
jal input_int 
move $t1,$t4			

#input: X=The Starting address of input numbers (each 32bits) should be entered from
# terminal in decimal format.It is stored in $t2
jal input_int
move $t2,$t4

#input:Y= The Starting address of output numbers(each 32bits) should be entered
# from terminal in decimal. It is stored in $t3
jal input_int
move $t3,$t4 

#input: The numbers to be sorted are now entered from terminal.
#They are stored in memory array whose starting address is given by $t2
move $t8,$t2
move $s7,$zero	#i = 0
loop1: 	beq $s7,$t1,loop1end
	jal input_int
	sw $t4,0($t2)
	addi $t2,$t2,4
      	addi $s7,$s7,1
        j loop1      
loop1end: move $t2,$t8       
#############################################################
#Do not change any code above this line
#Occupied registers $t1,$t2,$t3. Don't use them in your sort function.
#############################################################
#function: should be written by students(sorting function)
#Written by Jainav Sanghvi(IMT2020098)
#Sorting based on Bubble Sort Algorithm
#First we will copy the given array into outputarray and will then sort the outputarray

#copying the contents of array into outputarray
#outputarray=OA
#array=A
arraycopy:  
	addi $s1,$0,0   #s1=> i=0	
	addi $t4,$t1,0	#t4=> p=n
	copyloop:
	beq $s1,$t4 exit #if(i==p) then exit the copyloop
	sll $t6,$s1,2	  #t6=i*4	
	add $t6,$t6,$t2   #t6 = s6+t2 = address of array[i]
	lw $s2,0($t6)	  #s2=array[i]
	sll $t6,$s1,2	  #t6=i*4
	add $t6,$t6,$t3	  #t6 = s6+t3 = address of outputarray[i]
	sw $s2,0($t6)	  #outputarray[i]=array[i]
	addi $s1,$s1,1    #i+=1
	j copyloop	  
exit:

#Now we will sort the outputarray using Bubble Sort algorithm
#OA=outputarray
sort:   addi $s1,$0,0        #s1=> i=0
	addi $t4,$t1,-1      #t4=> p=n-1
sortloop1:	
	beq $s1,$t4 sortloop1end     #if(i=p) then exit sortloop1 and branch to sortloop1end
	addi $s2,$0,0             #s2=> j=0
	sub $t5,$t4,$s1     	  #t5=> q=n-1-i
	sortloop2:  
		beq $s2,$t5 sortloop2end  #if(j==q)(j==n-1-i) then exit sortloop2 and branch to sortloop2end
		sll $t6,$s2,2	          #t6=i*4	
		add $t6,$t6,$t3           #t6 now contains the address of outputarray[j]
		lw $s3,0($t6)	          #s3=OA[j] -> outputarray[j] is loaded into $s3
		addi $t6,$t6,4            #t6 now contains the address of outputarray[j+1]
		lw $s4,0($t6)             #s4=OA[j+1] -> outputarray[j+1] is loaded into $s4
		slt $t7,$s4,$s3	         #if(s4<s3) then t7=1 else t7=0
		beq $t7,$0 continueloop2 #if(t7=0)  then branch to continueloop2(for next iteration of j) else swap OA[j] and OA[j+1]		
		sw $s3,0($t6)		  #OA[j+1]=s3=OA[j]  //contents of $s3 is stored into the memory location outputarray[j+1] 	
		addi $t6,$t6,-4		  #t6 now contains the address of outputarray[j]
		sw $s4,0($t6)		  #OA[j]=s4=OA[j+1]  //contents of $s4 is stored into the memory location outputarray[j]   
	continueloop2:
		addi $s2,$s2,1	 #j+=1 //incrementing j for next iteration of inner loop
		j sortloop2 	#jump to sortloop2
	sortloop2end:
		addi $s1,$s1,1	 #i+=1	//incrementing i for next iteration of outer loop 
		j sortloop1	#jump to sortloop1
sortloop1end:  		

#endfunction
#############################################################
#You need not change any code below this line

#print sorted numbers
move $s7,$zero	#i = 0
loop: beq $s7,$t1,end
      lw $t4,0($t3)
      jal print_int
      jal print_line
      addi $t3,$t3,4
      addi $s7,$s7,1
      j loop 
#end
end:  li $v0,10
      syscall
#input from command line(takes input and stores it in $t4)
input_int: li $v0,5
	   syscall
	   move $t4,$v0
	   jr $ra
#print integer(prints the value of $t4 )
print_int: li $v0,1		#1 implie
	   move $a0,$t4
	   syscall
	   jr $ra
#print nextline
print_line:li $v0,4
	   la $a0,next_line
	   syscall
	   jr $ra
