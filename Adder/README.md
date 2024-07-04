# 1비트 가산기와 n비트 가산기
> velog Link : [Click](https://velog.io/@foodinsect/adder)
## 목차
1. [1비트 가산기](#1비트-가산기)
   - [반가산기 (Half Adder)](#반가산기-half-adder)
     - [반가산기 진리표](#반가산기-진리표)
   - [전가산기 (Full Adder)](#전가산기-full-adder)
     - [전가산기 진리표](#전가산기-진리표)
2. [n비트 가산기](#n비트-가산기)
   - [리플 캐리 가산기 (Ripple Carry Adder)](#리플-캐리-가산기-ripple-carry-adder)
   - [n비트 전가산기 (n bit Full Adder)](#n비트-전가산기-n-bit-full-adder)
   - [ALU (Arithmetic Logic Unit)](#alu-arithmetic-logic-unit)
   
---

## 1비트 가산기

### 반가산기 (Half Adder)
![half adder](https://velog.velcdn.com/images/foodinsect/post/2695900b-42cb-4704-87e4-12f9843b4309/image.jpg)

![half adder RTL Analysis](https://velog.velcdn.com/images/foodinsect/post/865bca7e-d8d5-4aae-a5d4-cae24febd1e3/image.png)

반가산기는 두 개의 1비트 이진수를 더함. 합(Sum)과 자리올림(Carry)을 생성함.
- 합(Sum): 입력 A와 B의 XOR 결과
- 자리올림(Carry): 입력 A와 B의 AND 결과

#### 반가산기 진리표

| 입력 A | 입력 B | 합 (Sum) | 자리올림 (Carry) |
| ------ | ------ | -------- | ---------------- |
|   0    |   0    |    0     |        0         |
|   0    |   1    |    1     |        0         |
|   1    |   0    |    1     |        0         |
|   1    |   1    |    0     |        1         |

![half adder waveform](https://velog.velcdn.com/images/foodinsect/post/965dcf62-8a70-4fa8-a106-06cffa1219f4/image.png)

---

### 전가산기 (Full Adder)
![full adder](https://velog.velcdn.com/images/foodinsect/post/46be0f9b-b25f-4dca-93c1-4f9e0cace8ad/image.jpg)

![full adder_structure](https://velog.velcdn.com/images/foodinsect/post/61071685-16af-4092-9333-64cf7555a62f/image.jpg)

![full adder RTL Analysis](https://velog.velcdn.com/images/foodinsect/post/8aa19bda-e60a-4cca-b2bb-26f08de36ea3/image.png)

전가산기는 세 개의 1비트 이진수를 더함. 반가산기 두 개와 OR 게이트로 구성됨.
- 첫 번째 반가산기: 입력 A와 B를 더하여 중간 합과 중간 자리올림을 생성
- 두 번째 반가산기: 첫 번째 반가산기의 합과 자리올림 입력을 더하여 최종 합과 최종 자리올림을 생성
- 최종 자리올림: 두 반가산기의 자리올림을 OR 게이트로 결합하여 생성

#### 전가산기 진리표

| 입력 A | 입력 B | 자리올림 입력 (Carry-in) | 합 (Sum) | 자리올림 (Carry-out) |
| ------ | ------ | ------------------------ | -------- | -------------------- |
|   0    |   0    |            0             |    0     |          0           |
|   0    |   0    |            1             |    1     |          0           |
|   0    |   1    |            0             |    1     |          0           |
|   0    |   1    |            1             |    0     |          1           |
|   1    |   0    |            0             |    1     |          0           |
|   1    |   0    |            1             |    0     |          1           |
|   1    |   1    |            0             |    0     |          1           |
|   1    |   1    |            1             |    1     |          1           |

![1-bit full adder waveform](https://velog.velcdn.com/images/foodinsect/post/8496b596-13c0-4fae-9c3d-aaf592209629/image.png)

---

## n비트 가산기

### 리플 캐리 가산기 (Ripple Carry Adder)
![4bit ripple carry adder](https://velog.velcdn.com/images/foodinsect/post/87b4a655-9b27-4eab-9832-de45f441fdcb/image.jpg)

![4bit ripple carry adder RTL analysis](https://velog.velcdn.com/images/foodinsect/post/10ef205a-458f-4bf4-a1f0-6c1e3f2fce98/image.png)

리플 캐리 가산기는 여러 개의 전가산기를 직렬로 연결하여 n비트 덧셈을 수행함.
각 전가산기의 자리올림 출력이 다음 전가산기의 자리올림 입력으로 전달되어 최종 덧셈 결과를 얻음.
속도는 느리지만 구현이 간단함.

![4bit ripple carry adder waveform](https://velog.velcdn.com/images/foodinsect/post/adb3a204-2316-4312-8f46-ff6af16cf1d9/image.png)

---

### n비트 전가산기 (n bit Full Adder)
n비트 가산기를 generate문과 parameter를 이용하여 구현함. parameter를 4로 설정했을 때 4bit adder가 구현되는 모습.

![nbit adder RTL Analysis](https://velog.velcdn.com/images/foodinsect/post/11d4f76e-4467-4bfe-ad44-aee736c176be/image.png)

![nbit adder waveform](https://velog.velcdn.com/images/foodinsect/post/7bf38700-5f2a-47e0-b464-b577047ce13c/image.png)

---

### ALU (Arithmetic Logic Unit)
ALU는 산술 및 논리 연산을 수행하는 컴퓨터의 핵심 장치임. 덧셈, 뺄셈, 곱셈 등의 산술 연산과 AND, OR, XOR 등의 논리 연산을 수행함.
