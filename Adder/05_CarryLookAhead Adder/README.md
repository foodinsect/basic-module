
# Carry Lookahead Adder
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
