# Day 5
## Combinational Logic Optimization
- combinational logic refers to logic circuits where the outputs depend only on the current inputs and not on any previous states.
- Combinational optimization is a field of study in computer science and operations research that focuses on finding the best possible solution from a finite set of options for problems that involve discrete variables and have no inherent notion of time.
- Optimising the combinational logic circuit is squeezing the logic to get the most optimized digital design so that the circuit finally is area and power efficient.
##### Techniques for Optimizations:
  - **Constant propagation** is an optimization technique used in compiler design and digital circuit synthesis to improve the efficiency of code and circuit implementations by replacing variables or expressions with their constant values where applicable.
  - **Boolean logic optimization**, also known as logic minimization or Boolean function simplification, is a process in digital design that aims to simplify Boolean expressions or logic circuits by reducing the number of terms, literals, and gates required to implement a given logical function.
#### Commmands to run the Yosys 
``` bash=
gedit <file name > # this will give you the code for the file specified
yosys # this will open the yosys synthesis tool
read_liberty -lib <library file name > # this will read the library file name
read_verilog <file name > # this will read the verilog file name
synth -top <top module name > # this will synthesize the top module
opt_clean -purge
abc -liberty <library file name >
show
```
##### check 1:
![check1_ter](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/14d98817-03d7-4061-9a69-303a86d98639)
![check1](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/e1849bfb-e5db-4bf5-8ed9-67626f55009c)

##### Check 2:
![check2_ter](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/2908410a-451f-4693-ab61-470f8dfec53b)

 ![check2](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/e3a76e29-096b-44b0-981e-2ef585b36974)

 ##### Check 3:
 ![opt3_ter](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/246cba98-595b-4ded-8b27-8cd5a64ad4ec)
![check3](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/1525719d-d833-46a9-8512-da7093f50f63)
 ##### Check 4:
 ![check4_ter](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/e7147b40-a304-4eb9-b648-5706a6ead4c2)
![check4](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/3842ef4c-0cf1-4e3e-9ef0-0e0b822b4f38)

## Sequential Logic Optimization
- Sequential logic optimizations involve improving the efficiency, performance, and resource utilization of digital circuits that include memory elements like flip-flops and latches.
- Optimizing sequential logic is crucial in ensuring that digital circuits meet timing requirements, consume minimal power, and occupy the least possible area while maintaining correct functionality.
- ##### Techniques for Optimizations:
  - **Sequential constant propagation**, also known as constant propagation across sequential elements, is an optimization technique used in digital design to identify and propagate constant values through sequential logic elements like flip-flops and registers. This technique aims to replace variable values with their known constant values at various stages of the logic circuit, optimizing the design for better performance and resource utilization.
  - **State optimization**, also known as state minimization or state reduction, is an optimization technique used in digital design to reduce the number of states in finite state machines (FSMs) while preserving the original functionality.
  - **Sequential logic cloning**, also known as retiming-based cloning or register cloning, is a technique used in digital design to improve the performance of a circuit by duplicating or cloning existing registers (flip-flops) and introducing additional pipeline stages. This technique aims to balance the critical paths within a circuit and reduce its overall clock period, leading to improved timing performance and better overall efficiency.
  - **Retiming** is an optimization technique used in digital design to improve the performance of a circuit by repositioning registers (flip-flops) along its paths to balance the timing and reduce the critical path delay. The primary goal of retiming is to achieve a shorter clock period without changing the functionality of the circuit.
#### opt_const1:
**Simulation**
![const1_sim](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/37740632-1f90-4d32-a674-08db73992d34)

**Synthesis**
![const1_synth](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/c6367673-84ab-4c75-855a-f08f2578fbdb)

#### opt_const2:
**Simulation**
![const2](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/a8cfc596-5582-41ef-91a5-ba14498944bb)

**Synthesis**
![const2_synth](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/417c8dbd-8248-4e42-baaf-b57d88dab3b8)

#### opt_const3:
**Simulation**
![const3_sim](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/f78de3fb-2486-4bce-8ca8-2403f5fd1782)

**Synthesis**
![const3_synth](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/1c2a2859-96bb-42ac-9627-6e84a89973bb)

## Sequential Logic Optimization for Unused Outputs
**Synthesis**

Counter_opt1:
![counter1](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/980cedfd-912c-4edb-bf23-01ad0f6ad2e3)

Counter_opt2:
![counter2](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/088ac65c-9cd0-4dd2-b89a-7a93f87b98ff)

