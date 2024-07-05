module top (
    input wire [3:0] A, 
    input wire [3:0] B,
    input wire [3:0] S,        // Select lines
    input wire M,              // 모드 선택 (0: 산술, 1: 논리)
    input wire Cn,             // 캐리 입력

    output wire [3:0] F_comb,  // 4비트 출력 F (ALU_74181_comb)
    output wire P_comb,        // 캐리 전파 (ALU_74181_comb)
    output wire G_comb,        // 캐리 생성 (ALU_74181_comb)
    output wire Cn_out_comb,   // Cn + 4 (ALU_74181_comb)
    output wire A_eq_B_comb,   // A와 B가 같은지 여부 (ALU_74181_comb)

    output wire [3:0] F_4bit,  // 4비트 출력 F (ALU_4bit_74181)
    output wire P_4bit,        // 캐리 전파 (ALU_4bit_74181)
    output wire G_4bit,        // 캐리 생성 (ALU_4bit_74181)
    output wire A_eq_B_4bit    // A와 B가 같은지 여부 (ALU_4bit_74181)
);

    // ALU_74181_comb 인스턴스
    ALU_74181_comb u1 (
        .A(A), 
        .B(B), 
        .S(S), 
        .M(M), 
        .Cn(Cn), 
        .F(F_comb), 
        .P(P_comb), 
        .G(G_comb), 
        .Cn_out(Cn_out_comb), 
        .A_eq_B(A_eq_B_comb)
    );

    // ALU_4bit_74181 인스턴스
    ALU_4bit_74181 u2 (
        .A(A), 
        .B(B), 
        .S(S), 
        .M(M), 
        .Cn(Cn), 
        .F(F_4bit), 
        .P(P_4bit), 
        .G(G_4bit), 
        .A_eq_B(A_eq_B_4bit)
    );

endmodule
