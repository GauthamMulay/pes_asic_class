# Day 3
## Introduction to Open Source Simulator Iverilog
**Simulator**: RTL design is checked for adherence to the spec by simulating the design. Simulator is the tool used for simulating the design

![simulator](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/2d15a858-d9b7-4096-8395-e08cdb4e5842)

**Design**: Design is the actual verilog codeor set of verilog codes which has the intended functionality to meet with the required specification

**Testbench**: Testbench is the setup to apply stimulus to the design to check its functionality
### How do simulator works ?
Simulator flows are mentioned below with screen shots as it take the inputs from the testbench and connects it to the source file and gives you a file in format .vcd this file is used to run the wave forms in the GTK wave software 

![simulator2](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/0b302ecf-9859-4cd8-b17c-4f8d12979ab9)


### Simulation of Mux:
Run the following commands to simulate mux
``` bash
iverilog mux.v mux_tb.v
./a.out
gtkwave mux21_tb.vcd
```
after the command ```./a.out``` .vcd file will be created and used for the simulation 

![mux](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/70fd910d-7673-495a-96e2-9f7b12ed1d96)


#### Output:
![waveform](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/7a1466fa-ee61-43f7-92aa-47547b7b61fe)


### Introduction to Yosys
Yosys is an synthesizer which is used to convert RTL to netlist
![yosys](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/7805a523-81ce-44c2-8324-56d109c68486)



**`netlist` is the representation of `DESIGN` in the form of standard cells present in `.lib`**

- To verify synthesis Netlist need to be fed to iverilog along with testbench
- vcd file generated from iverilog need to be fed to gtkwave simulator
- The output we get should be same as the output we got during RTL simulator
### Introduction to Logical Synthesis
Logic synthesis is a vital step in digital circuit design where high-level descriptions of circuits are transformed into specific implementations using logic gates. It optimizes circuits for factors like performance, area, power, and cost. The process includes library mapping, optimization, technology mapping, timing analysis, and verification. It's an iterative process often done with specialized software tools, enabling efficient hardware design.

**.lib:**
- Logic synthesis tools use a library of standard cells.
-  These cells are predefined logic gates with different functionalities and characteristics
-  It will also contain fast and slow version of same gate
#### why fast and slow version of same gate?
- **Fast Gates**: These gates are like speedy messengers. When you need to get something done quickly, you send these messengers because they're fast. In circuits, fast gates are used in critical parts where timing is super important. They help make sure things happen at the right times and prevent mistakes caused by timing issues.
- **Slow Gates**: Think of slow gates as patient helpers. Sometimes, you want things to slow down a bit, maybe to fix a timing problem. Slow gates take their time to do their job. They can be used in places where you deliberately want things to happen more slowly.
- **Tclk Formula**: This formula helps figure out how fast the overall circuit can run without causing problems. It considers the mix of fast and slow gates and calculates the maximum speed at which everything can work together without causing timing troubles. It's like finding the fastest speed a team can work without anyone getting out of sync.


![timeq](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/19c95326-37bb-4a55-b71c-f53ed7453f6a)

- **t_setup:** The setup time is the minimum time before the clock edge when the input data must be stable.
- **t_hold:** The hold time is the minimum time after the clock edge during which the input data must remain stable.
- **t_propagation:** This term represents the propagation delay of the logic gates in the critical path.
- **Tcq:** This term represents the clock-to-q delay of the flip-flops or registers used in the design. It's often a fixed value based on the chosen flip-flop technology.
## Lab
Steps to realize good_mux(design) in terms of standard cells avilable in library sky130_fd_sc_hd__tt_025C_1v80.lib
- **Step-1:** Go to the location of the where the verilog files and type command ```yosys``` in the terminal

- **Step-2:** Read Library ```read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib```
      ![read_lib](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/0b2045ce-5fd4-4f86-ba63-1a8fa11052c3)

- **Step-3:** Read the design File ```read_verilog mux.v```

  ![read_file](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/cf79bffb-ade0-4bec-bf3f-21dce523becf)

- **Step-4:** Do the synthesis using command ``` synth -top mux21```
  ![synth](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/2a1e237c-e672-4afd-90c0-ffffc7eefa55)

- **Step-5:** Generate netlist using command ``` abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib```
 ![ABC1](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/02577d73-268f-49ab-828b-73e3f66a6528)
![ABC2](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/657acfc7-c28f-418e-ad25-a4ce6112ff2e)

- **Step-6:** To get the schematic run command ```show```
  ![show](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/7caad6a4-fd0b-46a3-85a7-68b2151ef9c0)

- **Step-7:** Write the netlist using command ```write_verilog -noattr mux21_netlist.v```
