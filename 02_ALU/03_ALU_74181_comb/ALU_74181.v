`timescale 1ns / 1ps

module ALU_74181(
    input [3:0] A, 
    input [3:0] B,
    input [3:0] S,        // Select lines
    input M,              // Mode select (0: Arithmetic, 1: Logical)
    input Cn,             // Carry in

    output wire [3:0] F,   // 4-bit output F
    output wire P,         // Carry propagate
    output wire G,         // Carry generate
    output wire Cn_out,    // Carry out (Cn + 4)
    output wire A_eq_B     // A equals B
    );
    
    wire [3:0] nF, nA, nB;
    wire nP, nG;
    
    wire nM, nw1, nw2, nw3, nw4; 
    wire w1, w2, w3, w4, w5, w6, w7, w8;
    wire a1, a2, a3, a4;
    wire nanw, nanw2;
    
    wire aw1, aw2, aw3, aw4, aw5, aw6, aw7, aw8, aw9;
    wire now1, now2, now3, now4;
    wire b1, b2, b3, b4;
    
    
    assign nA = ~A;
    assign nB = ~B;
    assign F = ~nF;
    assign P = ~nP;
    assign G = ~nG;
    
    ALU_logical_comb BIT0(
        .A(nA[0]),
        .B(nB[0]),
        .S(S),
        .out1(w1),
        .out2(w2)
    );
    
    ALU_logical_comb BIT1(
        .A(nA[1]),
        .B(nB[1]),
        .S(S),
        .out1(w3),
        .out2(w4)
    );
    
    ALU_logical_comb BIT2(
        .A(nA[2]),
        .B(nB[2]),
        .S(S),
        .out1(w5),
        .out2(w6)
    );
    
    ALU_logical_comb BIT3(
        .A(nA[3]),
        .B(nB[3]),
        .S(S),
        .out1(w7),
        .out2(w8)
    );
    
    not (nM, M);
    nand (nanw, nM, Cn);
    
    ////////////////////////////////////////////////////
    
    not (nw1, w1);
    and (a1, nw1, w2);
    
    and (aw1, nM, w1);
    and (aw2, nM, w2, Cn);
    nor (now1, aw1, aw2);
    
    ////////////////////////////////////////////////////
    
    not (nw2, w3);
    and (a2, nw2, w4);
    
    and (aw3, nM, w3);
    and (aw4, nM, w1, w4);
    and (aw5, nM, Cn, w2, w4);
    nor (now2, aw3, aw4, aw5);
    
    ////////////////////////////////////////////////////
    
    not (nw3, w5);
    and (a3, nw3, w6);
    
    and (aw6, nM, w5);
    and (aw7, nM, w3, w6);
    and (aw8, nM, w1, w4, w6);
    and (aw9, nM, Cn, w2, w4, w6);
    nor (now3, aw6, aw7, aw8, aw9);
    
    ////////////////////////////////////////////////////
    
    not (nw4, w7);
    and (a4, nw4, w8);
    
    nand (nP, w2, w4, w6, w8);
    and (nanw2, Cn, w2, w4, w6, w8);
    
    and (b1, w1, w4, w6, w8);
    and (b2, w3, w6, w8);
    and (b3, w5, w8);
    and (b4, w7);
    
    or (nG, b1, b2, b3, b4);
    nor (Cn_out, nanw2, nG);
    
    ///////////////////////////////////////////////////
    
    xor (nF[0], nanw, a1);
    xor (nF[1], now1, a2);
    xor (nF[2], now2, a3);
    xor (nF[3], now3, a4);
    
    and (A_eq_B, nF[0], nF[1], nF[2], nF[3]);
    
endmodule
