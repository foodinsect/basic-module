module top (
    input wire [3:0] A, 
    input wire [3:0] B,
    input wire [3:0] S,        // Select lines
    input wire M,              // ��� ���� (0: ���, 1: ��)
    input wire Cn,             // ĳ�� �Է�

    output wire [3:0] F,  // 4��Ʈ ��� F (ALU_4bit_74181)
    output wire P,        // ĳ�� ���� (ALU_4bit_74181)
    output wire G,        // ĳ�� ���� (ALU_4bit_74181)
    output wire Cn_out,
    output wire A_eq_B,    // A�� B�� ������ ���� (ALU_4bit_74181)
    
    output wire [3:0] F_comb,  // 4��Ʈ ��� F (ALU_4bit_74181)
    output wire P_comb,        // ĳ�� ���� (ALU_4bit_74181)
    output wire G_comb,        // ĳ�� ���� (ALU_4bit_74181)
    output wire Cn_out_comb,
    output wire A_eq_B_comb    // A�� B�� ������ ���� (ALU_4bit_74181)
);

    // ALU_4bit_74181 �ν��Ͻ�
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
