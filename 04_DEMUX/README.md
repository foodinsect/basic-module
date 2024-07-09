# N-Bit 1-to-4 Demultiplexer (DEMUX) Implementations

This repository contains implementations of N-bit 1-to-4 demultiplexers (DEMUX) using different design methodologies in Verilog. A DEMUX is a combinational circuit that takes a single input and channels it to one of several outputs based on control signals.

## Files Overview

1. **N-Bit 1-to-4 DEMUX Using If-Else** (`N_Bit_1_to_4_demux_using_if_else.v`)
2. **N-Bit 1-to-4 DEMUX with Enable** (`N_Bit_1_to_4_demux_with_enable.v`)
3. **1-to-4 DEMUX** (`demux_1_to_4.v`)

### Waveform
![demux waveform](https://velog.velcdn.com/images/foodinsect/post/ea2f5cb7-b1d1-4bfd-9336-66636a515286/image.png)


## Implementation Details

### 1. 1-to-4 DEMUX
- A basic 1-to-4 DEMUX implementation.
- Directs a single input to one of four outputs based on two control signals.
- This design demonstrates the fundamental operation of a 1-to-4 DEMUX without additional features like enable control or N-bit width.
![demux_1_to_4](https://velog.velcdn.com/images/foodinsect/post/bd07b35f-ada7-43ec-b0af-84cd840e6602/image.png)

### 2. N-Bit 1-to-4 DEMUX Using If-Else
- Implements an N-bit wide 1-to-4 DEMUX using procedural statements within an always block.
- Utilizes if-else constructs to direct the input to the appropriate output based on the control signals.
- This design is straightforward and easy to understand, making use of basic conditional logic to perform demultiplexing.
![N bit 1_to_4 demux using if else](https://velog.velcdn.com/images/foodinsect/post/39eef030-9125-4c6f-a548-7d7d4750684b/image.png)

### 3. N-Bit 1-to-4 DEMUX with Enable
- Adds an enable signal to the N-bit 1-to-4 DEMUX.
- When the enable signal is active, the DEMUX operates normally, directing the input to the appropriate output.
- When the enable signal is inactive, all outputs are forced to a default state (e.g., high impedance or zero).
- This design is useful for scenarios where the DEMUX needs to be dynamically enabled or disabled, adding flexibility to the circuit.
![N bit 1_to_4 demux with enable](https://velog.velcdn.com/images/foodinsect/post/38c3590e-40de-4457-b6b5-631616ab23ae/image.png)


