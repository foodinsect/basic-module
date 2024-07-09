
# N-Bit 4-to-1 MUX 

This repository contains implementations of N-bit 4-to-1 multiplexers (MUX) using different design methodologies in Verilog. A MUX is a combinational circuit that selects one of several input signals and forwards the selected input to a single output line.

## Files Overview

1. **N-Bit 4-to-1 MUX Using Conditional Operator** (`N_Bit_4_to_1_MUX_using_conditional_operator.v`)
2. **N-Bit 4-to-1 MUX with Enable Control** (`N_Bit_4_to_1_MUX_with_enable_control.v`)
3. **N-Bit 4-to-1 MUX Using Case Statement** (`N_Bit_4_to_1_MUX_using_case.v`)
4. **Testbench** (`tb_top.v`)
5. **Top-level Module** (`top.v`)

### Waveform
![N bit 4-to-1 MUX waveform](https://velog.velcdn.com/images/foodinsect/post/4953f24f-5e54-4c39-b21d-4582b9fd62c2/image.png)

## Implementation Details

### 1. N-Bit 4-to-1 MUX Using Conditional Operator
- Implements an N-bit wide 4-to-1 MUX using conditional (ternary) operators.
- Supports selection of one of four N-bit input signals based on a 2-bit select signal.
- This design is concise and leverages the simplicity of conditional operators for easy understanding and implementation.
![N bit 4-to-1 MUX using conditional operator](https://velog.velcdn.com/images/foodinsect/post/77416464-3781-4c11-a79a-0d549c59a6d7/image.png)


### 2. N-Bit 4-to-1 MUX with Enable Control
- Adds an enable signal to the N-bit 4-to-1 MUX.
- When the enable signal is active, the MUX operates normally, selecting one of the four inputs.
- When the enable signal is inactive, the output is forced to a default state (e.g., high impedance or zero).
- This design is useful for cases where the MUX needs to be dynamically enabled or disabled.
![N bit 4-to-1 MUX with enable control](https://velog.velcdn.com/images/foodinsect/post/d8c33dfe-7bf4-4521-90c1-a323659cacad/image.png)


### 3. N-Bit 4-to-1 MUX Using Case Statement
- Utilizes a case statement within an always block to implement the MUX.
- Provides a clear and organized structure for implementing multiple conditions.
- This approach is beneficial for readability and is easily extendable for more complex selection logic.
![N bit 4-to-1 MUX using case](https://velog.velcdn.com/images/foodinsect/post/12645140-80c3-4a5c-a6aa-55b00bfc05d0/image.png)


### 4. Testbench
- Provides a comprehensive test environment to verify the functionality of the N-bit 4-to-1 MUX designs.
- Includes various test cases to ensure correct operation of the MUX under different input and control scenarios.
- The testbench drives the inputs and captures the outputs for verification against expected results.

### 5. Top-level Module
- Integrates various sub-modules and provides the top-level design for the MUX.
- Acts as the main entry point for simulation and synthesis.
- Ensures that all individual components work together correctly and meet the design specifications.
