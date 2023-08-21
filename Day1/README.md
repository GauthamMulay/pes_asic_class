# Introduction to RISCV ISA and GNU Compiler Toolchain
## DAY 1 
**Introduction to RISCV ISA and GNU Compiler Toolchain**
+ Introduction to Basic Keywords
  - Introduction
  - From Apps to Hardware

+ Labwork for RISCV Toolchain
  - C Program
  - RISCV GCC Compiler and Dissemble
  - spike simulation and debug

+ Integer Number Representation  
  - 64-bit Unsigned Numbers
  - 64-bit Signed Numbers
  - Labwork For Signed and Unsigned Numbers
## From Apps to Hardware
1. **Apps:** Application software, often referred to simply as "applications" or "apps," is a type of computer software that is designed to perform specific tasks or functions for end-users.
2. **System software:** System software refers to a category of computer software that acts as an intermediary between the hardware components of a computer system and the user-facing application software. It provides essential services, manages hardware resources, and enables the execution of application programs. System software plays a critical role in maintaining the overall functionality, security, and performance of a computer system.'
3. **Operating System:** The operating system is a fundamental piece of software that manages hardware resources and provides various services for both users and application programs. It controls tasks such as memory management, process scheduling, file system management, and user interface interaction. Examples of operating systems include Microsoft Windows, macOS, Linux, and Android.

4. **Compiler:** A compiler is a type of software tool that translates high-level programming code written by developers into assembly-level language.

5. **Assembler:** An assembler is a software tool that translates assembly language code into machine code or binary code that can be directly executed by a computer's processor.

6. **RTL:** RTL serves as an abstraction level in the design process that represents the behavior of a digital circuit in terms of registers and the operations that transfer data between them.

 7. **Hardware:** Hardware refers to the physical components of a computer system or any electronic device. It encompasses all the tangible parts that make up a computing or electronic device and enable it to perform various tasks.

## Detail Description of Course Content
**Pseudo Instructions:** Pseudo-instructions are used to simplify programming, improve code readability, and reduce the number of explicit instructions a programmer needs to write. They are especially useful for common programming patterns that involve multiple instructions.
`Ex: li, mv`.

**Base Integer Instructions:** The term "base integer instructions" refers to the fundamental set of instructions that form the foundation for performing basic arithmetic, logical, and data movement operations.
`Ex: add, sub, and, or, xor, sll`.

**Multiply Extension Intructions:** The RISC-V architecture includes a set of multiply and multiply-accumulate (MAC) extension instructions that enhance the instruction set to perform efficient multiplication and multiplication-accumulate operations.
`Ex: mul, mulh, mulhu, mulhsu`.

**Single and Double Precision Floating Point Extension:** The RISC-V architecture includes floating-point extensions that provide support for both single-precision (32-bit) and double-precision (64-bit) floating-point arithmetic operations. These extensions are often referred to as the "F" and "D" extensions, respectively. Floating-point arithmetic is essential for handling real numbers with fractional parts and for performing accurate calculations involving decimal values.


# Lab-1
## C Program
We wrote a C program for calculating the sum from 1 to n using a text editor, leafpad.

`leafpad sumton.c`
``` c
#include<stdio.h>

int main(){
	int i, sum=0, n=5;
	for (i=1;i<=n; ++i) {
	sum +=i;
	}
	printf("Sum of numbers from 1 to %d is %d \n",n,sum);
	return 0;
}
```
![cprg1](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/62872910-fea4-48f6-8dbc-5d996004f70d)

## RISCV GCC Compiler and Dissemble
Run the below command for the RISCV gcc Compiler 
```
riscv64-unknown-elf-gcc -O1 -mabi=lp64 -march=rv64i -o sum1ton.o sum1ton.c
```
run the spike simulator using command 
```
spike pk sum1ton.o
```
Spike simulator opens which will be hardware simulator this will give you the same output as with gcc compiler 

![spike](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/2705045f-1624-46d9-9106-43d79f57e276)



To view the dissambled form of the object file use the following command in new terminal window
```
riscv64-unknown-elf-objdump -d sum1ton.o | less
```

This gives us the dissambled form of the object file created by the risc-v gcc complier

![disassembled](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/3b842497-e338-436d-aeb8-665f09877d2f)



For debugging the file object file in spike simulator the following command is used
``` bash
spike -d pk sum1ton.c
```
Register contents can be checked also


![debug](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/84706bfe-e537-4a9d-ad6c-ce8a2c9eebee)

## Lab 2
``` c
#include<stdio.h>
#include<math.h>

int main()
{
	unsigned long long int a;
	long long int b_max,b_min;
	a = (unsigned long long int)(pow(2,64)-1);
	b_max = (long long int)(pow(2,63)-1);
	b_min = (long long int)(pow(2,63)*(-1));
	printf("The max value of 64 bit unsigned number is %llu\n The max number of 64 bit signed number is %lld\n The min value of 64 bit signed number is %lld\n",a,b_max,b_min);
	return 0;

}
```
The following output after running the following program

![unsigned](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/291a28ac-505e-4470-a6e1-5a672eae10e8)


