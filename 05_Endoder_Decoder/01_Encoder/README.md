# Encoder

## Introduction

An encoder is a digital circuit that converts a given input into a specific output code. It is primarily used to convert input signals into binary codes of smaller bit size. Encoders play a crucial role in various digital systems, including data transmission, data compression, error detection, and correction.

## Simulation Waveform
![Encoder Simulation Waveform](https://github.com/user-attachments/assets/0aacd71e-d756-4068-b3fe-a27d98158ec4)
*Figure: Example of a encoder simulation waveform*

## Definition and Role

An encoder transforms an m-bit input code into an n-bit output code, where $n \leq m \leq 2^n$. Typically, an encoder has $2^n$ (or fewer) input lines and n output lines, generating binary codes corresponding to the input values. Encoders generally convert codes with only one bit set to 1 into a binary code representing the position of that bit.

## Types of Encoders

### Binary Encoder

A binary encoder generates output binary codes when only one of the n input signals is active. For example, a 4-to-2 encoder converts four inputs into a 2-bit binary code.

#### Example: 4-to-2 Encoder

| Input (D3, D2, D1, D0) | Output (A1, A0) |
|------------------------|-----------------|
| 0001                   | 00              |
| 0010                   | 01              |
| 0100                   | 10              |
| 1000                   | 11              |

- $A_0 = D_1 + D_3$
- $A_1 = D_2 + D_3$

#### Example: Octal (8) to Binary Encoder

| Input (D7, D6, D5, D4, D3, D2, D1, D0) | Output (A2, A1, A0) |
|----------------------------------------|---------------------|
| 00000001                               | 000                 |
| 00000010                               | 001                 |
| 00000100                               | 010                 |
| 00001000                               | 011                 |
| 00010000                               | 100                 |
| 00100000                               | 101                 |
| 01000000                               | 110                 |
| 10000000                               | 111                 |

- $A_0 = D_1 + D_3 + D_5 + D_7$
- $A_1 = D_2 + D_3 + D_6 + D_7$
- $A_2 = D_4 + D_5 + D_6 + D_7$

### Priority Encoder

A priority encoder is a digital circuit that selects the highest-priority input signal among multiple active inputs and outputs its corresponding binary code. This type of encoder solves the problem of standard encoders that cannot handle multiple active inputs simultaneously.

#### Working Principle

1. Among multiple active input signals, the highest-priority input is selected.
2. The binary code of the selected input position is output.
3. The V output indicates whether at least one input signal is active.

| Input (D3, D2, D1, D0) | Output (A1, A0, V) |
|------------------------|--------------------|
| 0000                   | xx, 0              |
| 0001                   | 00, 1              |
| 001x                   | 01, 1              |
| 01xx                   | 10, 1              |
| 1xxx                   | 11, 1              |

- $A_0 = D_3 + \overline{D_2}D_1$
- $A_1 = D_2 + D_3$
- $V = D_0 + D_1 + D_2 + D_3$

## Implementation and Simulation

Encoders can be implemented using OR gates. For instance, a $2^n$-to-n encoder can be realized using n OR gates.

### Example: 2-to-4 Encoder

- The 2-to-4 encoder has two inputs and four outputs.
- Each output represents a unique binary combination of the inputs.

### Example: 3-to-8 Encoder

- The 3-to-8 encoder has three inputs and eight outputs.
- Each output corresponds to a unique 3-bit binary input combination.

## RTL Schematic
![encoder 4 to 2 if else](https://github.com/user-attachments/assets/6841b0a2-ca3d-4ff0-840d-ee293d5d22fc)  
*Figure: RTL Schematic of encoder 4-to-2 using if else*  

![encoder 4 to 2 case](https://github.com/user-attachments/assets/69ec7414-0fa7-4713-b792-88cdfd552227)  
*Figure: RTL Schematic of encoder 4-to-2 using case*  

![encoder 8 to 3](https://github.com/user-attachments/assets/2aedbc12-e683-4387-8144-166012d4c2a9)  
*Figure: RTL Schematic of encoder 8-to-3*  

![priority encoder 4 to 2 casex](https://github.com/user-attachments/assets/d7f64e18-0e6d-469e-8853-c75c825fdf24)  
*Figure: RTL Schematic of Priority encoder 4-to-2 using casex*  

![priority encoder 4 to 2 if else](https://github.com/user-attachments/assets/493336ff-4344-40a5-8ffb-66341a573c9b)
*Figure: RTL Schematic of Priority encoder 4-to-2 using if else*  

![priority encoder 8 to 3](https://github.com/user-attachments/assets/cc88511b-78bb-46d0-9bf8-b0803d10b130)  
*Figure: RTL Schematic of Priority encoder 8-to-3*  


## Conclusion

Encoders are fundamental components in digital electronics, serving various functions in data transmission, compression, and error handling. Understanding their types, roles, and implementation methods is crucial for designing efficient digital systems.

---

