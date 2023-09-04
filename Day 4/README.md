# Day 4
## Introduction to library(.lib) file
### sky130_fd_sc_hd__tt_025C_1v80.lib
- **sky130**: This indicates that the library is associated with the SkyWater 130nm process technology.
- **fd_sc_hd**:"fd" might refer to "Foundation," suggesting that this library contains fundamental building blocks for digital IC design.
               "sc" could stand for "Standard Cells," which are pre-designed logic gates used in IC design.
               "hd" could refer to "high-density" libraries, which typically contain smaller, more compact cell designs for achieving higher logic density in ICs.
- **tt_025C**: "tt" might stand for "typical temperature," and "025C" could refer to 25 degrees Celsius, a common temperature for IC specifications. These conditions are important for characterizing the library's performance.
- **1v80**: This likely represents the supply voltage for the library. In this case, "1v80" indicates a supply voltage of 1.8 volts, which is a common voltage level for digital ICs.

  **Image of library file**

  ![library](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/96a76ef4-6d9d-4cc6-86cc-c03b60c37b07)
  
### Libraries Contains
- **Standard Cells:** This library is likely to include a variety of standard cells, which are pre-designed building blocks for digital logic. Standard cells consist of logic gates (e.g., AND, OR, XOR), flip-flops, latches, multiplexers, and other fundamental digital components. These cells are characterized for the specific process technology (in this case, SkyWater 130nm) and operating conditions (temperature and voltage).
- **Timing Information:** The library will provide timing information for each standard cell. This information includes parameters like propagation delay, setup time, hold time, and other timing characteristics. Designers use this data to ensure that signals propagate correctly through the logic gates.
- **Power Characteristics:** Power consumption data is crucial for estimating the energy usage of a design. The library will typically include information on dynamic power (power consumed when the circuit is switching) and static power (power consumed when the circuit is idle).
- **Pin and I/O Information:** The library will specify the input and output pins for each standard cell, including pin names, directions (input or output), and electrical characteristics.
- **Library Files:** These library files often come in various formats, including Liberty (.lib) files, which contain detailed timing and power information, and Verilog models, which allow designers to use these standard cells in their digital designs.
- **Characterization Data:** The library may include data characterizing how the standard cells perform under different operating conditions, including variations in temperature and supply voltage. This helps designers account for variability in their designs.
- **Technology Files:** These files might also include information about the specific characteristics of the SkyWater 130nm process technology, such as transistor models, interconnect information, and other process-related data.
### Hierarchical vs Flat Synthesis
#### Hierarchical Synthesis
- Hierarchical synthesis involves dividing the design into logical modules or blocks and synthesizing each module separately.
- These modules can have their own hierarchies, and they communicate through well-defined interfaces
- It enhances reusability, as individual modules can be reused in other designs.
- Supports better scalability for large, complex designs.
#### Steps to Hierarchical Synthesis
Enter the following commands to run Hierarchial Synthesis
- **1.**```read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib  ```
- **2.**```read_verilog multiple_modules.v```
  Multiple_module consists of:
  ![mmcode](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/85079e8e-272e-45a3-8226-86b0e8a5288e)

- **3.**```synth -top multiple_modules```
  
  ![Synth1](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/ad9858a6-a652-4f0c-9b27-cee5513be059)
 ![synth](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/2f568bdf-7837-424d-b37e-0ef9d8fb7b80)

- **5.**```abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib```
- **6.**```show multiple_modules```
  ![hierdesgn](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/3aa8a72c-0144-4e89-8ebb-286c2e9f9c29)

- **7.**```write_verilog -noattr multiple_modules_hier.v```
#### Flat Synthesis
continue from hierarchical synthsis
- **1.**```flatten```
- **2.**```show multiple_modules```
  ![flat_design](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/64ab43c9-d80b-4d78-8375-f9634596d512)

- **3.**```write_verilog -noattr multiple_modules_flat.v```
- **4.**```!gvim multiple_modules_flat.v```
    ![flat_code](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/b2d23367-e17a-4d82-9572-47114924954f)
  ## Various Flop Coding Styles and Optimization
### Flop Coding Styles
#### Asynchronous Reset D Flip-Flop
- When an asynchronous reset input is activated (set to '1'), regardless of the clock signal, the stored value is forced to '0'.
- Otherwise, on the positive edge of the clock signal, the stored value is updated with the data input.
#### Asynchronous Set D Flip-Flop
- When an asynchronous set input is activated (set to '1'), regardless of the clock signal, the stored value is forced to '1'.
- Otherwise, on the positive edge of the clock signal, the stored value is updated with the data input.
#### Synchronous Reset D Flip-Flop
- When a synchronous reset input is activated (set to '1') at the positive edge of the clock signal, the stored value is forced to '0'.
- Otherwise, on the positive edge of the clock signal, the stored value is updated with the data input.
#### D Flip-Flop with Asynchronous Reset and Synchronous Reset

- This flip-flop combines both asynchronous and synchronous reset features.
- When the asynchronous reset input is activated (set to '1'), the stored value is immediately forced to '0'.
- When the synchronous reset input is activated (set to '1') at the positive edge of the clock signal, the stored value is forced to '0'.
- Otherwise, on the positive edge of the clock signal, the stored value is updated with the data input.
### Synthesis and Simulation of Flops
#### Asynchronous Reset D Flip-Flop:
##### Terminal 
![async_reset_ter](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/ee217010-b61f-4cc8-899e-61f96a67f2b4)
##### Simulation
![async_reset](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/fb758101-2aa4-47bc-8c4a-fc9abf437b24)
##### Schematic
![async_res_sche](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/95bf0842-ea24-4256-9e31-1d0db45bc0b4)
#### Asynchronous Set D Flip-Flop:
##### Terminal 
![async_set_ter](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/ec3c2291-964c-4598-b7b0-d13732fc11a3)
##### Simulation
![async_set_sim](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/c19c7460-9cad-4ff1-a1d7-6fc128620f15)
##### Schematic
![async_set_sche](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/c3dc21d4-3303-4d85-bf3d-182b601162e0)
#### Synchronous Reset D Flip-Flop:
##### Terminal 
![sync_res_ter](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/4a57e6f6-e6ea-4bb6-854a-8a711f777210)
##### Simulation
![sync_res_sche](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/4a042720-3d86-44ab-913e-a35eabbfce37)
##### Schematic
![sync_res_sim](https://github.com/GauthamMulay/pes_asics_class/assets/113660503/9e7f2348-f48a-4a96-9641-ed4997cc8fe5)

