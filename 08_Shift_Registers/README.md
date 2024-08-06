# Shift Register Design and Simulation

This project involves the design and simulation of 4-bit shift registers in Verilog. The shift registers are implemented using both blocking and non-blocking assignments to demonstrate their behavior and differences. This document provides an overview of shift register concepts, simulation results, and RTL schematics.

## Overview

### What is a Shift Register?

A shift register is a sequential logic circuit used to store and shift data. It consists of a series of flip-flops connected in a chain, where the output of one flip-flop serves as the input to the next. Shift registers are widely used in digital systems for data manipulation, storage, and transfer.

### Types of Shift Registers

1. **Blocking Shift Register**: Uses blocking assignments (`=`) in Verilog. In blocking assignments, the assignment operation is completed before the next statement is executed within the same always block.
2. **Non-Blocking Shift Register**: Uses non-blocking assignments (`<=`) in Verilog. In non-blocking assignments, all assignments are evaluated concurrently at the end of the time step.

## Simulation and RTL Schematics

### Shift Register Simulation Waveform

![Shift Register Simulation Waveform](https://velog.velcdn.com/images/foodinsect/post/994e8d04-ddde-4049-a09c-584b7912f593/image.png)

This waveform illustrates the behavior of both blocking and non-blocking shift registers. The input `sin` is shifted through the register with each clock cycle, and the differences in output due to blocking and non-blocking assignments can be observed.

### Blocking Shift Register RTL Schematic

![Shift Register Blocking RTL Schematic](https://velog.velcdn.com/images/foodinsect/post/8faa5fbc-71c3-4a5d-b7f6-c341e2cfea0a/image.png)

The RTL schematic of the blocking shift register shows the internal structure and connections of the flip-flops. Each flip-flop's output directly feeds the input of the next flip-flop in the chain.

### Non-Blocking Shift Register RTL Schematic

![Shift Register non Blocking RTL Schematic](https://velog.velcdn.com/images/foodinsect/post/4b8d2b9c-5bc6-4259-a657-bc59e8a6008c/image.png)

The RTL schematic of the non-blocking shift register also shows a similar structure but demonstrates the concurrent evaluation of assignments, which is crucial for understanding timing and data propagation differences.

## Project Structure

- **shift_register_4_bit_blocking.v**: Implementation of a 4-bit shift register using blocking assignments.
- **shift_register_4_bit_non_blocking.v**: Implementation of a 4-bit shift register using non-blocking assignments.
- **top.v**: Top module that instantiates both blocking and non-blocking shift registers.
- **tb_top.v**: Testbench for simulating and verifying the functionality of both shift registers.

## Key Concepts

### Sequential Logic

Shift registers are sequential logic circuits where the output depends not only on the current inputs but also on the history of past inputs. This characteristic makes them suitable for applications requiring data storage and transfer over multiple clock cycles.

### Blocking vs Non-Blocking Assignments

- **Blocking Assignments (`=`)**: Execute sequentially within an always block. Each assignment is completed before the next one begins, leading to potential issues with timing and data dependencies.
- **Non-Blocking Assignments (`<=`)**: Execute concurrently at the end of the time step. They allow for more predictable and accurate modeling of sequential logic, particularly in clocked processes.

### Applications of Shift Registers

- **Data Storage**: Temporarily hold data bits in digital systems.
- **Data Transfer**: Shift data in or out of a digital system serially.
- **Data Manipulation**: Perform operations like data reversal, serialization, and deserialization.

## Conclusion

This project demonstrates the design and simulation of 4-bit shift registers using both blocking and non-blocking assignments in Verilog. By comparing the simulation results and RTL schematics, we gain insights into the differences in behavior and timing between blocking and non-blocking shift registers. This knowledge is essential for designing reliable and efficient digital systems.

For further details on the implementation and operation of the shift registers, please refer to the provided Verilog files.

---
