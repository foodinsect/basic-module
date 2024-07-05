module top (
    input wire [3:0] A, 
    input wire [3:0] B,
    input wire [3:0] S,        // Select lines
    input wire M,              // ��� ���� (0: ���, 1: ��)
    input wire Cn,             // ĳ�� �Է�

    output wire [3:0] F_comb,  // 4��Ʈ ��� F (ALU_74181_comb)
    output wire P_comb,        // ĳ�� ���� (ALU_74181_comb)
    output wire G_comb,        // ĳ�� ���� (ALU_74181_comb)
    output wire Cn_out_comb,   // Cn + 4 (ALU_74181_comb)
    output wire A_eq_B_comb,   // A�� B�� ������ ���� (ALU_74181_comb)

    output wire [3:0] F_4bit,  // 4��Ʈ ��� F (ALU_4bit_74181)
    output wire P_4bit,        // ĳ�� ���� (ALU_4bit_74181)
    output wire G_4bit,        // ĳ�� ���� (ALU_4bit_74181)
    output wire A_eq_B_4bit    // A�� B�� ������ ���� (ALU_4bit_74181)
);

    // ALU_74181_comb �ν��Ͻ�
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

    // ALU_4bit_74181 �ν��Ͻ�
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
