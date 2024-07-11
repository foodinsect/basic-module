

# 🍳Concept of ALU

An Arithmetic Logic Unit (ALU) is a critical component of a CPU in any computer system.  
It performs both arithmetic and logical operations on the binary data inputs.  
The operations performed by an ALU can be broadly categorized into:

1. **Arithmetic Operations**: Addition, subtraction, multiplication, and division.
2. **Logical Operations**: AND, OR, NOT, XOR, etc.

The ALU receives input data and control signals that dictate which operation it should perform.  
The output is the result of the operation, which can be fed back into other parts of the computer system or used for further processing.  

---

# 🚩Folder Descriptions

## 01_Simple 4-bit ALU

This directory contains the design and implementation of a simple 4-bit ALU.  
This ALU is capable of performing basic arithmetic and logical operations on 4-bit binary numbers.  
The focus here is on understanding the fundamental operations of an ALU without delving into more complex functionalities or optimizations.

---

## 02_ALU_74181

This directory contains the design of the 74181 ALU based on the **instructions** and mode-specific operations as detailed in the datasheet.  
The 74181 is a historic and widely studied 4-bit ALU chip that was used in many early computers.  
The design replicates these functionalities, ensuring that it behaves identically to the original 74181 chip.

---

## 03_ALU_74181_comb

This directory contains the design of the 74181 ALU using combinational logic circuits.   
The structural modeling approach is employed here, where the ALU is constructed using basic logic gates to replicate the exact behavior of the 74181 ALU.  
This model closely follows the physical construction and logic design of the original chip, providing a deep understanding of how the ALU operates at the hardware level.  

---
