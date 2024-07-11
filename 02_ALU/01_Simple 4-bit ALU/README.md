
# ALU (Arithmetic Logic Unit)
An ALU is a core component of a computer that performs arithmetic and logical operations such as addition, subtraction, multiplication, and logical AND, OR, and XOR operations.

### Example: 4-bit ALU
**Operations**
1. Addition
2. Subtraction
3. AND
4. OR
5. XOR
6. NOT
7. Left Shift
8. Right Shift

#### Explanation
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

![ALU waveform](https://velog.velcdn.com/images/foodinsect/post/65a9439c-a91c-4576-ae6d-08b813cd70aa/image.png)

---
