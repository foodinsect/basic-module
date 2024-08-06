
# Johnson Counter Design and Simulation

This project involves the design and simulation of Johnson counters in Verilog. A Johnson counter, also known as a twisted ring counter, is a type of shift register where the complemented output of the last flip-flop is fed back to the input of the first flip-flop. This document provides an overview of the Johnson counter design, simulation, and its fundamental principles.

## Overview

Johnson counters are a type of sequential logic circuit used in digital systems to generate a specific sequence of states. They are useful in applications requiring sequence generation, timing signals, and divide-by-N counters.

## Basic Principles of Johnson Counters

### What is a Johnson Counter?

A Johnson counter is a modified ring counter where the inverted output of the last flip-flop is fed back to the input of the first flip-flop. This configuration creates a sequence of states that is twice the number of flip-flops used.

### How Johnson Counters Work

- **Initialization**: The Johnson counter is typically initialized with a known state, usually all zeros.
- **Twisted Feedback**: With each clock pulse, the '0' and '1' bits shift through the flip-flops in a manner that creates a unique sequence of states, with the complemented output of the last flip-flop fed back to the input of the first flip-flop.

### Johnson Counter Simulation

![Johnson Counter Simulation Waveform](https://velog.velcdn.com/images/foodinsect/post/97b51332-c3e2-4e2b-a0b4-f6399d49a3e0/image.png)

This waveform illustrates the operation of a Johnson counter. The counter cycles through its states, with the sequence of bits shifting through the flip-flops in a characteristic pattern.

### Johnson Counter RTL Schematic

![Johnson Counter RTL Schematic](https://velog.velcdn.com/images/foodinsect/post/9d4fe055-e89e-4c04-a9f5-6e9861975ca9/image.png)

The schematic shows the design of a Johnson counter. It consists of a series of flip-flops connected in a circular configuration, with the complemented output of the last flip-flop fed back to the input of the first flip-flop.

## Project Structure

- **johnson_counter.v**: Implementation of a Johnson counter.
- **tb_johnson_counter.v**: Testbench for simulating and verifying the functionality of the Johnson counter.

### Twisted Feedback

The defining feature of Johnson counters is their twisted feedback mechanism. The inverted output of the last flip-flop is fed back to the input of the first flip-flop, creating a repeating pattern of states that is twice the number of flip-flops.


## Conclusion

This project showcases the fundamental principles of Johnson counters, providing a solid foundation for understanding and designing cyclic sequential circuits. The included RTL schematics and simulation waveforms offer a visual representation of the counter's operation, enhancing comprehension of their internal workings.

For further details on the implementation and operation of the counters, please refer to the provided Verilog files.

---
