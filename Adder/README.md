# 1-bit Adder and n-bit Adder
> 한글 설명  --> velog Link: [Click](https://velog.io/@foodinsect/adder)

## Table of Contents
1. [1-bit Adder](#1-bit-adder)
   - [Half Adder](#half-adder)
     - [Half Adder Truth Table](#half-adder-truth-table)
   - [Full Adder](#full-adder)
     - [Full Adder Truth Table](#full-adder-truth-table)
2. [n-bit Adder](#n-bit-adder)
   - [Ripple Carry Adder](#ripple-carry-adder)
   - [n-bit Full Adder](#n-bit-full-adder)
   - [ALU (Arithmetic Logic Unit)](#alu-arithmetic-logic-unit)

---

## 1-bit Adder

### Half Adder
![half adder](https://velog.velcdn.com/images/foodinsect/post/2695900b-42cb-4704-87e4-12f9843b4309/image.jpg)

![half adder RTL Analysis](https://velog.velcdn.com/images/foodinsect/post/865bca7e-d8d5-4aae-a5d4-cae24febd1e3/image.png)

A half adder adds two 1-bit binary numbers, generating a sum and a carry.
- **Sum**: XOR result of inputs A and B
- **Carry**: AND result of inputs A and B

#### Half Adder Truth Table

| Input A | Input B | Sum | Carry |
| ------- | ------- | --- | ----- |
|    0    |    0    |  0  |   0   |
|    0    |    1    |  1  |   0   |
|    1    |    0    |  1  |   0   |
|    1    |    1    |  0  |   1   |

![half adder waveform](https://velog.velcdn.com/images/foodinsect/post/965dcf62-8a70-4fa8-a106-06cffa1219f4/image.png)

---

### Full Adder
![full adder](https://velog.velcdn.com/images/foodinsect/post/46be0f9b-b25f-4dca-93c1-4f9e0cace8ad/image.jpg)

![full adder_structure](https://velog.velcdn.com/images/foodinsect/post/61071685-16af-4092-9333-64cf7555a62f/image.jpg)

![full adder RTL Analysis](https://velog.velcdn.com/images/foodinsect/post/8aa19bda-e60a-4cca-b2bb-26f08de36ea3/image.png)

A full adder adds three 1-bit binary numbers. It is constructed using two half adders and an OR gate.
- **First Half Adder**: Adds inputs A and B, generating intermediate sum and carry.
- **Second Half Adder**: Adds intermediate sum and carry-in input, generating the final sum and carry.
- **Final Carry**: OR gate combines the carries from both half adders.

#### Full Adder Truth Table

| Input A | Input B | Carry-in | Sum | Carry-out |
| ------- | ------- | -------- | --- | --------- |
|    0    |    0    |    0     |  0  |     0     |
|    0    |    0    |    1     |  1  |     0     |
|    0    |    1    |    0     |  1  |     0     |
|    0    |    1    |    1     |  0  |     1     |
|    1    |    0    |    0     |  1  |     0     |
|    1    |    0    |    1     |  0  |     1     |
|    1    |    1    |    0     |  0  |     1     |
|    1    |    1    |    1     |  1  |     1     |

![1-bit full adder waveform](https://velog.velcdn.com/images/foodinsect/post/8496b596-13c0-4fae-9c3d-aaf592209629/image.png)

---

## n-bit Adder

### Ripple Carry Adder
![4bit ripple carry adder](https://velog.velcdn.com/images/foodinsect/post/87b4a655-9b27-4eab-9832-de45f441fdcb/image.jpg)

![4bit ripple carry adder RTL analysis](https://velog.velcdn.com/images/foodinsect/post/10ef205a-458f-4bf4-a1f0-6c1e3f2fce98/image.png)

A ripple carry adder performs n-bit addition by connecting multiple full adders in series. The carry-out from each full adder is passed to the next full adder's carry-in. This structure is simple but slow due to the ripple effect.

![4bit ripple carry adder waveform](https://velog.velcdn.com/images/foodinsect/post/adb3a204-2316-4312-8f46-ff6af16cf1d9/image.png)

---

### n-bit Full Adder
An n-bit adder can be implemented using the `generate` statement and parameters. When the parameter is set to 4, it creates a 4-bit adder.

![nbit adder RTL Analysis](https://velog.velcdn.com/images/foodinsect/post/11d4f76e-4467-4bfe-ad44-aee736c176be/image.png)

![nbit adder waveform](https://velog.velcdn.com/images/foodinsect/post/7bf38700-5f2a-47e0-b464-b577047ce13c/image.png)

---

## ALU (Arithmetic Logic Unit)
An ALU is a core component of a computer that performs arithmetic and logical operations such as addition, subtraction, multiplication, and logical AND, OR, and XOR operations.

![ALU waveform](https://velog.velcdn.com/images/foodinsect/post/65a9439c-a91c-4576-ae6d-08b813cd70aa/image.png)

### Example: 4-bit ALU
1. Addition
2. Subtraction
3. AND
4. OR
5. XOR
6. NOT
7. Left Shift
8. Right Shift

### Explanation
- **Inputs and Outputs**:
    - `a` and `b` are the 4-bit input operands.
    - `op_code` is a 3-bit input used to select the operation.
    - `result` is the 4-bit output of the ALU.
    - `carry_out` is an output for the carry bit in addition and subtraction operations.

- **Operations**:
    - `3'b000`: Addition
    - `3'b001`: Subtraction
    - `3'b010`: AND
    - `3'b011`: OR
    - `3'b100`: XOR
    - `3'b101`: NOT (only `a` is negated)
    - `3'b110`: Left Shift
    - `3'b111`: Right Shift
