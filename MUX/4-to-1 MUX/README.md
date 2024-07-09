# 4-to-1 Multiplexer (MUX) 

This repository contains various implementations of 4-to-1 multiplexers (MUX) using different design methodologies in Verilog. A MUX is a combinational circuit that selects one of several input signals and forwards the selected input to a single output line.

## Files Overview

1. **Dataflow Modeling** (`mux_4_to_1_dataflow.v`)
2. **Structural Modeling** (`mux_4_to_1_structural.v`)
3. **Using Operators** (`mux_4_to_1_using_operators.v`)
4. **Nesting MUXes** (`nesting_4_to_1_mux.v`)
5. **Testbench** (`tb_top.v`)
6. **Top-level Module** (`top.v`)
7. **Tristate 4-to-1 MUX** (`tristate_4_to_1_mux.v`)
8. **If-Else Implementation** (`if_else_4_to_1_mux.v`)
9. **Behavioral Modeling** (`mux_4_to_1_behavioral.v`)

### Waveform
![4-to-1 MUX waveform](https://velog.velcdn.com/images/foodinsect/post/1d82f9d1-6447-40a1-852b-7ef549a0312f/image.png)

## Implementation Details

### 1. Structural Modeling
- Describes the MUX by instantiating lower-level components (gates).
- Shows the interconnections between these components to form the MUX.
![4-to-1 MUX Structural](https://velog.velcdn.com/images/foodinsect/post/aeeab05c-c16b-4303-86c3-45b8afaad98d/image.png)

### 2. Dataflow Modeling
- Uses continuous assignment statements to describe the MUX.
- Implements logic expressions directly using Verilog operators.
![4-to-1 MUX Dataflow](https://velog.velcdn.com/images/foodinsect/post/94fd5dc8-c6bf-4282-85ae-d04af5c493b7/image.png)

### 3. Behavioral Modeling
- Uses behavioral Verilog to describe the MUX.
- Focuses on high-level design without detailing gate-level structure.
![4-to-1 MUX Behavioral](https://velog.velcdn.com/images/foodinsect/post/6eb0be4b-198a-4f5c-a507-6d1e0685b29a/image.png)

### 4. Using Operators
- Uses conditional and arithmetic operators to implement the MUX.
- Demonstrates a concise way to write MUX logic.
![4-to-1 MUX Using Operators](https://velog.velcdn.com/images/foodinsect/post/8be15701-2364-4d5d-9f38-1ce3547714ec/image.png)


### 5. Nesting MUXes
- Implements a 4-to-1 MUX using multiple 2-to-1 MUXes.
- Demonstrates hierarchical design by nesting smaller MUXes.
![nesting_4-to-1_mux](https://velog.velcdn.com/images/foodinsect/post/942b20a9-f867-40b7-83ec-7f40215f98a1/image.png)

### 6. Tristate 4-to-1 MUX
- Uses tristate buffers to implement the MUX.
- Demonstrates the use of `bufif0` and `bufif1` for selecting inputs.
![tristate_4-to-1 mux](https://velog.velcdn.com/images/foodinsect/post/7729103a-937a-4de4-935c-9195ad5dd15d/image.png)

### 7. If-Else Implementation
- Uses procedural statements within an always block.
- Implements MUX functionality using if-else constructs.
![if else 4-to-1 mux](https://velog.velcdn.com/images/foodinsect/post/ce9d6b7d-ba21-4358-b056-552448ad4535/image.png)


### 8. Testbench
- Provides a test environment to verify the functionality of the MUX designs.
- Includes various test cases to ensure correct operation.

### 9. Top-level Module
- Integrates various sub-modules and provides the top-level design.
- Serves as the entry point for simulation and synthesis.

