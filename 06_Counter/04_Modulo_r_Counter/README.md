
# Modulo $R$ Counter Design and Simulation

This project involves the design and simulation of modulo $R$ counters in Verilog. A modulo counter resets its count upon reaching a specified value $R$. This document provides an overview of the modulo counter design, simulation, and its application as a Binary-Coded Decimal (BCD) counter when $R = 10$.

## Overview

Modulo counters are digital counters that reset to zero after reaching a pre-defined count value $R$. They are useful in applications requiring a fixed range of counting, such as timekeeping, digital clocks, and frequency division.

## Basic Principles of Modulo Counters

### What is a Modulo Counter?

A modulo counter is a type of digital counter that counts up to a specific number $R$ and then resets to zero. This allows for repetitive counting cycles within a fixed range.

### How Modulo Counters Work

- **Counting Range**: The counter increments its value with each clock pulse. When the count reaches $R$, it resets to zero and starts counting again.
- **Reset Mechanism**: The reset occurs automatically when the counter value equals the preset value $R$.

### Modulo Counter Simulation

![Modulo R Counter Simulation Waveform](https://velog.velcdn.com/images/foodinsect/post/ff86c0ea-8197-4647-a7f3-3fa22786086a/image.png)

This waveform illustrates the operation of a modulo $R$ counter. The counter increments its value with each clock cycle and resets to zero upon reaching $R$.

### Modulo $R$ Counter RTL Schematic

![Modulo R Counter RTL Schematic](https://velog.velcdn.com/images/foodinsect/post/fb282cab-52fd-47e3-995d-58823a88ac97/image.png)

The schematic shows the design of a modulo $R$ counter. The counter comprises flip-flops and combinational logic to implement the counting and reset functionality.

## BCD Counter Application

### What is a BCD Counter?

A Binary-Coded Decimal (BCD) counter is a special type of modulo counter that counts from 0 to 9 (i.e., $R = 10$). It represents each decimal digit with its binary equivalent.

### How to Use Modulo $R$ Counter as a BCD Counter

When the modulo counter is set with $R = 10$, it functions as a BCD counter. This means it counts from 0 to 9 and then resets to zero. BCD counters are commonly used in digital clocks and calculators where numerical digits are represented in decimal format.

## Project Structure

- **modulo_r_counter.v**: Implementation of a modulo $R$ counter.
- **tb_modulo_r_counter.v**: Testbench for simulating and verifying the functionality of the modulo $R$ counter.

## BCD Counting

Setting $R = 10$ allows the modulo counter to function as a BCD counter. This enables the counter to count in decimal digits, which is useful for displaying numerical values in human-readable form.

## Conclusion

This project showcases the fundamental principles of modulo $R$ counters, providing a solid foundation for understanding and designing counters with fixed counting ranges. The included RTL schematics and simulation waveforms offer a visual representation of the counter's operation, enhancing comprehension of their internal workings. Additionally, the ability to configure the counter as a BCD counter by setting $R = 10$ demonstrates its versatility in digital system design.

For further details on the implementation and operation of the counters, please refer to the provided Verilog files.

---