module top (
    input wire [3:0] A, 
    input wire [3:0] B,
    input wire [3:0] S,        // Select lines
    input wire M,              // 모드 선택 (0: 산술, 1: 논리)
    input wire Cn,             // 캐리 입력

    output wire [3:0] F,  // 4비트 출력 F (ALU_4bit_74181)
    output wire P,        // 캐리 전파 (ALU_4bit_74181)
    output wire G,        // 캐리 생성 (ALU_4bit_74181)
    output wire Cn_out,
    output wire A_eq_B,    // A와 B가 같은지 여부 (ALU_4bit_74181)
    
    output wire [3:0] F_comb,  // 4비트 출력 F (ALU_4bit_74181)
    output wire P_comb,        // 캐리 전파 (ALU_4bit_74181)
    output wire G_comb,        // 캐리 생성 (ALU_4bit_74181)
    output wire Cn_out_comb,
    output wire A_eq_B_comb    // A와 B가 같은지 여부 (ALU_4bit_74181)
);

    // ALU_4bit_74181 인스턴스
    ALU_4bit_74181 my_ALU (
        .A(A), 
        .B(B), 
        .S(S), 
        .M(M), 
        .Cn(Cn), 
        .F(F), 
        .P(P), 
        .G(G), 
        .Cn_out(Cn_out),
        .A_eq_B(A_eq_B)
    );
    
    ALU_74181 comb (
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

endmodule
