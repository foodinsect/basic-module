
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
