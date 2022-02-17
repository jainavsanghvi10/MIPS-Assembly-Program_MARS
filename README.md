# MIPS-Assembly-Program_MARS
A MIPS assembly program written using the MIPS MARS simulator to read N numbers stored in consecutive memory locations. and sort them in ascending order and store the sorted numbers in a different set of memory locations.
Inputs to the code:\
* N numbers
* Starting memory address X of the input numbers
* Starting memory address Y of the output sorted numbers

# Instructions to run the Program
### Method-1:
1) Make sure you are in the directory which contains the file IMT2020098-MIPS_MARS_Sorting.asm ​
2) Execute the following command in terminal:​
    * java -jar Mars4_5.jar nc IMT2020098​ 
    * MIPS_MARS_Sorting.asm​ 
### Method-2​:
In MARS-MIPS, use the F3 to assemble the code and F5 to run it.

## Input  for Running the program:
* The first line of input is the value of N. This value gets stored in register t1.
* The next line of input is the starting memory location where these N numbers will get stored. This value gets stored in register t2.​
* The next line of input is the starting memory location where these N numbers have to be stored after sorting them. This * value gets stored in register t3.​
* The next N lines of input are the N numbers that have to be sorted and stored

# Sorting Algorithm used: 
The bubble sort algorithm has been used to sort the N numbers.​ \
Bubble sort is a simple sorting algorithm. This sorting algorithm is comparison-based algorithm in which each pair of adjacent elements is compared and the elements are swapped if they are not in order. \​
Time Complexity: O(n^2)

# Explanation of MIPS code
* The numbers are first copied from the set of memory locations whose starting address is stored in $t2 to the set of memory locations whose starting address is stored in $t3. There is a separate loop for accomplishing this task and is named ‘copyloop’.​

* After the copying is complete, the sorting begins.​

* The driving variable for the outer loop for sorting is i in the above-given C program. $s1 has been used for the same purpose in the assembly program.​

* The driving variable for the inner loop is j in the above-given C program. $s2 has been used for the same purpose in the assembly program.​

* i and j are incremented appropriately in each iteration.​

* If i<N-1, the program continues with the next instruction. Else, it branches to ‘sortloop1end’, which indicates the end of the sorting program.​

* If j<N-1-i, the program continues with the next instruction and calculates the address of OA[j] and OA[j+1] ,stores them in $s3 and $s4 and then compares them. Else, it branches to ‘sortloop2end’.​

* If OA[j] > OA[j+1], then the memory contents are swapped, else it branches to ‘continueloop2’.​

* After completion of sort, the N numbers whose starting address is given by $t3 are printed​

* A more detailed explanation of every instruction used in the assembly program in MARS is conveyed through comments in the .asm file.

# MARS-MARS Code
![IMT2020098_Code1](https://user-images.githubusercontent.com/79016037/154545133-a6ff1906-43e7-446c-84f4-05701ae1b1ff.jpg)
\
![IMT2020098_Code2](https://user-images.githubusercontent.com/79016037/154545138-28d739b8-b6fa-4aca-88c4-997cea98f9b2.jpg)

# Sample Input and Output Screenshots:
### Sample 1
![Output1_IMT2020098](https://user-images.githubusercontent.com/79016037/154545329-a28976db-0cca-4a0d-9b9d-607376d5f58c.jpg)
### Sample 2
![Output2_IMT2020098](https://user-images.githubusercontent.com/79016037/154545334-e73776a2-76d2-4083-84ff-d8846eb8a9dd.jpg)
