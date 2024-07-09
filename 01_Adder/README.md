### README

# Verilog Modules Collection

This repository contains the Verilog implementations of various adders. Each module is provided with a detailed description, truth tables, and waveforms. The modules include a 1-bit half adder, 1-bit full adder, n-bit ripple carry adder, carry lookahead adder.

## Table of Contents
1. [1-bit Adder](#1-bit-adder)
   - [Half Adder](#half-adder)
     - [Half Adder Truth Table](#half-adder-truth-table)
   - [Full Adder](#full-adder)
     - [Full Adder Truth Table](#full-adder-truth-table)
2. [n-bit Adder](#n-bit-adder)
   - [Ripple Carry Adder](#ripple-carry-adder)
   - [n-bit Full Adder](#n-bit-full-adder)
3. [Carry Lookahead Adder](#carry-lookahead-adder)

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

## Carry Lookahead Adder
### Carry Signal Calculation
![full adder st](https://velog.velcdn.com/images/foodinsect/post/3561e1fd-5f8a-47b6-a772-57a7a5e81abe/image.jpg)

- **Generate (`G`) and Propagate (`P`) Signals**:
  $$
  G_i = A_i \cdot B_i
  $$
  $$
  P_i = A_i \oplus B_i
  $$

- **Carry Signal Calculation**:
  $$
  C_1 = G_0 + P_0 \cdot C_0
  $$
  $$
  C_2 = G_1 + G_0 \cdot P_1 + P_1 \cdot P_0 \cdot C_0
  $$
  $$
  C_3 = G_2 + G_1 \cdot P_2 + G_0 \cdot P_1 \cdot P_2 + P_2 \cdot P_1 \cdot P_0 \cdot C_0
  $$
  $$
  C_4 = G_3 + G_2 \cdot P_3 + G_1 \cdot P_2 \cdot P_3 + G_0 \cdot P_1 \cdot P_2 \cdot P_3 + P_3 \cdot P_2 \cdot P_1 \cdot P_0 \cdot C_0
  $$

### Explanation of Formulas
**Carry Signal Calculation**:
   - $C_1 = G_0 + P_0 \cdot C_0$
   - $C_2 = G_1 + P_1 \cdot C_1 = G_1 + P_1 \cdot (G_0 + P_0 \cdot C_0) = G_1 + G_0 \cdot P_1 + P_1 \cdot P_0 \cdot C_0$
   - $C_3 = G_2 + P_2 \cdot C_2 = G_2 + P_2 \cdot (G_1 + G_0 \cdot P_1 + P_1 \cdot P_0 \cdot C_0) = G_2 + G_1 \cdot P_2 + G_0 \cdot P_1 \cdot P_2 + P_2 \cdot P_1 \cdot P_0 \cdot C_0$
   - $C_4 = G_3 + P_3 \cdot C_3 = G_3 + P_3 \cdot (G_2 + G_1 \cdot P_2 + G_0 \cdot P_1 \cdot P_2 + P_2 \cdot P_1 \cdot P_0 \cdot C_0) = G_3 + G_2 \cdot P_3 + G_1 \cdot P_2 \cdot P_3 + G_0 \cdot P_1 \cdot P_2 \cdot P_3 + P_3 \cdot P_2 \cdot P_1 \cdot P_0 \cdot C_0$

**Sum Calculation**:
   - $S_i = P_i \oplus C_{i-1}$

### Explanation of Carry Lookahead Adder
1. **Parameterized Inputs and Outputs**:
    - `N` represents the variable bit width.
    - `A` and `B` are N-bit inputs.
    - `Cin` is the carry input.
    - `S` is the N-bit sum output.
    - `Cout` is the final carry output.

2. **Generate and Propagate Signals**:
    - `G` calculates the generate signal for each bit:
      $$
      G[i] = A[i] \cdot B[i]
      $$
    - `P` calculates the propagate signal for each bit:
      $$
      P[i] = A[i] \oplus B[i]
      $$

3. **Internal Carry Signals Calculation**:
    - `C[0]` is the initial carry input `Cin`.
    - Each internal carry signal `C[i]` is pre-calculated using generate and propagate signals:
      $$
      C[i] = G[i-1] \lor (P[i-1] \cdot C[i-1])
      $$

4. **Sum Calculation**:
    - The sum `S[i]` for each bit is calculated by XORing the propagate signal with the internal carry signal:
      $$
      S[i] = P[i] \oplus C[i]
      $$

5. **Final Carry Output**:
    - The final carry output `Cout` is derived from the last internal carry signal:
      $$
      \text{Cout} = C[N]
      $$

![CarryLookAhead Waveform](https://velog.velcdn.com/images/foodinsect/post/64408577-7450-40f4-924f-ab137d1720af/image.png)

Based on this, a Carry Lookahead Adder calculates the sum and final carry for each bit, improving addition speed.

---
