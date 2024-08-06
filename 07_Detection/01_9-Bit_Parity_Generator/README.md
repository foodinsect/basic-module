# 9 Bit Parity Generator

## Introduction

A parity bit is an error-detecting code used in serial communication to check whether data has been transmitted correctly. By appending a parity bit to the end of a byte, it ensures that the number of bits set to 1 is always even or odd, depending on the parity scheme used.

## Simulation Waveform

![9-Bit_Parity_Generator Waveform](https://velog.velcdn.com/images/foodinsect/post/88f5a8f9-b166-411e-8d86-3384f130308b/image.png)
*Figure: Example of a parity bit simulation waveform*

## What is a Parity Bit?

A parity bit is a bit added to a set of binary data to make the number of 1's in the set either even or odd. This bit helps detect errors in data transmission by ensuring that the data adheres to a specific parity rule (even or odd).

### Types of Parity Bits

1. **Even Parity Bit**: Adds a parity bit to make the total number of 1's in the data even.
   - Example: For 9-bit data `010101011` (three 1's, odd), the even parity bit is `1`, making the total data `0101010111`.

2. **Odd Parity Bit**: Adds a parity bit to make the total number of 1's in the data odd.
   - Example: For 9-bit data `010100001` (three 1's, odd), the odd parity bit is `0`, making the total data `0101000010`.

### Examples

#### Even Parity Example

| 9-bit Data   | Parity Bit | 10-bit Data   |
|--------------|------------|---------------|
| 010101011    | 1          | 0101000111    |

#### Odd Parity Example

| 9-bit Data   | Parity Bit | 10-bit Data   |
|--------------|------------|---------------|
| 010100001    | 0          | 0101000010    |

## Parity Bit Error Detection

Parity bits allow for the detection of errors during data transmission. If the number of 1's in the received data does not match the expected parity (even or odd), it indicates that an error has occurred. However, parity bits can only detect an error but cannot pinpoint the exact location of the error or detect errors if an even number of bits are incorrect.

## 9-Bit Parity Generator Design

A 9-bit parity generator adds a parity bit to 9-bit data.  
This generator can be designed and implemented to provide error detection capability in digital systems.


### Structure of a Parity Generator

![9-Bit Parity Generator Structure](https://velog.velcdn.com/images/foodinsect/post/d6a7c8ee-9633-46c3-905e-41fb25a542f3/image.png)  
*Figure: Parity generator block diagram*

### RTL Schematic of 9-Bit Parity Generator

![9-Bit_Parity_Generator Structural RTL Schematic](https://velog.velcdn.com/images/foodinsect/post/4bd31ac8-94a1-43e2-b456-88d877353912/image.png)  
*Figure: RTL schematic of a 9-bit parity generator Structural model*  
  
![9-Bit_Parity_Generator Dataflow RTL Schematic](https://velog.velcdn.com/images/foodinsect/post/3d3a30a0-1ba7-409a-aaed-a2c5fa0d5aba/image.png)  
*Figure: RTL schematic of a 9-bit parity generator Dataflow model*  

![9-Bit_Parity_Generator Behavioral RTL Schematic](https://velog.velcdn.com/images/foodinsect/post/52b06c80-918f-4fab-8760-a9c043418585/image.png)  
*Figure: RTL schematic of a 9-bit parity generator Behavioral model*  

## Conclusion

Parity bits are a simple yet effective method for error detection in digital communication systems. Understanding their types, roles, and limitations is crucial for designing robust communication protocols and systems.


---
