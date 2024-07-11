module tb_ALU;

    reg [3:0] A;
    reg [3:0] B;
    reg [3:0] S; // Select lines
    reg M;       // Mode select
    reg Cn;      // Carry in

    wire [3:0] F;  // 4-bit output from ALU_4bit_74181
    wire P;        // Carry propagate from ALU_4bit_74181
    wire G;        // Carry generate from ALU_4bit_74181
    wire Cn_out;
    wire A_eq_B;   // A equals B from ALU_4bit_74181
    
    wire [3:0] F_comb;  // 4-bit output from ALU_4bit_74181
    wire P_comb;        // Carry propagate from ALU_4bit_74181
    wire G_comb;        // Carry generate from ALU_4bit_74181
    wire Cn_out_comb;
    wire A_eq_B_comb;   // A equals B from ALU_4bit_74181

    // Instantiate the ALU_Top module
    top uut (
        .A(A),
        .B(B),
        .S(S),
        .M(M),
        .Cn(Cn),
        
        .F(F),
        .P(P),
        .G(G),
        .Cn_out(Cn_out),
        .A_eq_B(A_eq_B),
        
        .F_comb(F_comb),
        .P_comb(P_comb),
        .G_comb(G_comb),
        .Cn_out_comb(Cn_out_comb),
        .A_eq_B_comb(A_eq_B_comb)
    );

    initial begin
        // Initialize inputs
        A = 4'b0000;
        B = 4'b0000;
        S = 4'b0000;
        M = 1'b0;
        Cn = 1'b0;

        // Test case 1: Simple arithmetic operation (A + B)
        #10 A = 4'b0011; B = 4'b0101; S = 4'b0001; M = 1'b0; Cn = 1'b1; // A + B
        #10 A = 4'b0110; B = 4'b0011; S = 4'b1001; M = 1'b0; Cn = 1'b0; // A plus B
        
        // Test case 2: Logical operations
        #10 A = 4'b1010; B = 4'b1100; S = 4'b0000; M = 1'b1; Cn = 1'b0; // A'
        #10 A = 4'b1010; B = 4'b1100; S = 4'b1011; M = 1'b1; Cn = 1'b1; // AB

        // Test case 3: Comparison operation
        #10 A = 4'b1010; B = 4'b1010; S = 4'b1111; M = 1'b1; Cn = 1'b0; // A 
        #10 A = 4'b1111; B = 4'b1111; S = 4'b1100; M = 1'b0; Cn = 1'b1; // A plus A*

        // Test case 4:  Comb Debug
        #10 A = 4'b0001; B = 4'b0011; S = 4'b0000; M = 1'b0; Cn = 1'b0; // A minus 1
        #10 A = 4'b0001; B = 4'b0011; S = 4'b1111; M = 1'b0; Cn = 1'b0; // A

        // Add more test cases as needed
        #10 $finish;
    end

endmodule
