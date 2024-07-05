module ALU_74181_comb (
    input wire [3:0] A, 
    input wire [3:0] B,
    input wire [3:0] S,        // Select lines
    input wire M,              // 모드 선택 (0: 산술, 1: 논리)
    input wire Cn,             // 캐리 입력

    output wire [3:0] F,   // 4비트 출력 F
    output wire P,         // 캐리 전파
    output wire G,         // 캐리 생성
    output wire Cn_out,    // Cn + 4
    output wire A_eq_B     // A와 B가 같은지 여부
);

// logical AND Part Wire Declation
wire LW1, LW2, LW3, LW4, LW5, LW6, LW7, LW8, LW9, LW10, LW11, LW12, LW13, LW14, LW15, LW16, LW17, LW18, LW19, LW20;

// logical NOT Part Wire Declation
wire NB1, NB2, NB3, NB4;

// logical NOR Part Wire Declation
wire LXW1, LXW2, LXW3, LXW4, LXW5, LXW6, LXW7, LXW8;


// Arithmetic Part Wire Declation
wire NM, NAND1, NAND3;
wire ANW1, ANW2, ANW3, ANW4;
wire AW1, AW2, AW3, AW4, AW5, AW6, AW7, AW8, AW9, AW10, AW11, AW12, AW13;
wire NOW1, NOW2, NOW3;
wire NW1, NW2, NW3, NW4;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////
/////////////////////////////   Logical Part
// 1st bit
    not (NB1,   B[0]);
    and (LW1,   A[0]);
    and (LW2,   B[0],       S[0]);
    and (LW3,   NB1,        S[1]);
    and (LW4,   NB1, A[0],  S[2]);
    and (LW5,   A[0], B[0], S[3]);
    nor (LXW1,  LW1, LW2, LW3);
    nor (LXW2,  LW4, LW5);

    // 2nd bit
    not (NB2,   B[1]);
    and (LW6,   A[1]);
    and (LW7,   B[1],       S[0]);
    and (LW8,   NB2,        S[1]);
    and (LW9,   NB2, A[1],  S[2]);
    and (LW10,  A[1], B[1], S[3]);
    nor (LXW3,  LW6, LW7, LW8);
    nor (LXW4,  LW9, LW10);

    // 3rd bit
    not (NB3,   B[2]);
    and (LW11,  A[2]);
    and (LW12,  B[2],       S[0]);
    and (LW13,  NB3,        S[1]);
    and (LW14,  NB3, A[2],  S[2]);
    and (LW15,  A[2], B[2], S[3]);
    nor (LXW5,  LW11, LW12, LW13);
    nor (LXW6,  LW14, LW15);

    // 4th bit
    not (NB4,   B[3]);
    and (LW16,  A[3]);
    and (LW17,  B[3],       S[0]);
    and (LW18,  NB4,        S[1]);
    and (LW19,  NB4,  A[3], S[2]);
    and (LW20,  A[3], B[3], S[3]);
    nor (LXW7,  LW16, LW17, LW18);
    nor (LXW8,  LW19, LW20);

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////
/////////////////////////////   Arithmetic Part
    not (NM, M);

    not (NW1, LXW1);
    not (NW2, LXW3);
    not (NW3, LXW5);
    not (NW4, LXW7);

    // xor? and?
    xor (ANW1, NW1, LXW2);
    xor (ANW2, NW2, LXW4);
    xor (ANW3, NW3, LXW6);
    xor (ANW4, NW4, LXW8);

    and (AW1, NM, LXW1);
    and (AW2, NM, Cn, LXW2);
    nor (NOW1, AW1, AW2);

    and (AW3, NM, LXW3);
    and (AW4, NM, LXW1, LXW4);
    and (AW5, NM, Cn, LXW2, LXW4);
    nor (NOW2, AW3, AW4, AW5);

    and (AW6, NM, LXW5);
    and (AW7, NM, LXW3, LXW6);
    and (AW8, NM, LXW1, LXW4, LXW6);
    and (AW9, NM, Cn, LXW2, LXW4, LXW6);
    nor (NOW3, AW6, AW7, AW8, AW9);

    and (AW10, LXW1, LXW4, LXW6, LXW8);
    and (AW11, LXW3, LXW6, LXW8);
    and (AW12, LXW5, LXW8);
    and (AW13, LXW7);

    nand (NAND1, Cn, NM);
    and (NAND3, Cn, LXW2, LXW4, LXW6, LXW8);
    nor (P, AW10, AW11, AW12, AW13);
    nand (G, LXW2, LXW4, LXW6, LXW8);
    nor (Cn_out, NAND3, P);

    xnor (F[0], NAND1, ANW1);
    xnor (F[1], NOW1, ANW2);
    xnor (F[2], NOW2, ANW3);
    xnor (F[3], NOW3, ANW4);

    and (A_eq_B, F[0], F[1], F[2], F[3]);

endmodule
