module tb_top;

    reg [3:0] A;
    reg [3:0] B;
    reg [3:0] S; // Select lines
    reg M;       // Mode select
    reg Cn;      // Carry in

    wire [3:0] F_comb;  // 4-bit output from ALU_74181_comb
    wire P_comb;        // Carry propagate from ALU_74181_comb
    wire G_comb;        // Carry generate from ALU_74181_comb
    wire Cn_out_comb;   // Carry out from ALU_74181_comb
    wire A_eq_B_comb;   // A equals B from ALU_74181_comb

    wire [3:0] F_4bit;  // 4-bit output from ALU_4bit_74181
    wire P_4bit;        // Carry propagate from ALU_4bit_74181
    wire G_4bit;        // Carry generate from ALU_4bit_74181
    wire A_eq_B_4bit;   // A equals B from ALU_4bit_74181

    // Instantiate the top module
    top uut (
        .A(A),
        .B(B),
        .S(S),
        .M(M),
        .Cn(Cn),
        .F_comb(F_comb),
        .P_comb(P_comb),
        .G_comb(G_comb),
        .Cn_out_comb(Cn_out_comb),
        .A_eq_B_comb(A_eq_B_comb),
        .F_4bit(F_4bit),
        .P_4bit(P_4bit),
        .G_4bit(G_4bit),
        .A_eq_B_4bit(A_eq_B_4bit)
    );

    initial begin
        // Initialize inputs
        A = 4'b0000;
        B = 4'b0000;
        S = 4'b0000;
        M = 1'b0;
        Cn = 1'b0;

        // Monitor signals
        $monitor("Time = %0t | A = %b | B = %b | S = %b | M = %b | Cn = %b | F_comb = %b | P_comb = %b | G_comb = %b | Cn_out_comb = %b | A_eq_B_comb = %b | F_4bit = %b | P_4bit = %b | G_4bit = %b | A_eq_B_4bit = %b", 
                  $time, A, B, S, M, Cn, F_comb, P_comb, G_comb, Cn_out_comb, A_eq_B_comb, F_4bit, P_4bit, G_4bit, A_eq_B_4bit);

        // Test case 1: Simple arithmetic operation (A + B)
        #10 A = 4'b0011; B = 4'b0101; S = 4'b0001; M = 1'b0; Cn = 1'b1; // A + B
        #10 A = 4'b0110; B = 4'b0011; S = 4'b0001; M = 1'b0; Cn = 1'b0; // A + B (Active Low)
        
        // Test case 2: Logical operations
        #10 A = 4'b1010; B = 4'b1100; S = 4'b0000; M = 1'b1; Cn = 1'b1; // A'
        #10 A = 4'b1010; B = 4'b1100; S = 4'b0110; M = 1'b1; Cn = 1'b1; // A xor B

        // Test case 3: Comparison operation
        #10 A = 4'b1010; B = 4'b1010; S = 4'b1111; M = 1'b0; Cn = 1'b1; // A - 1
        #10 A = 4'b1111; B = 4'b1111; S = 4'b1100; M = 1'b0; Cn = 1'b1; // A plus A*

        // Test case 4:  Comb Debug
        #10 A = 4'b0001; B = 4'b0011; S = 4'b1001; M = 1'b0; Cn = 1'b1; // A - 1

        // Add more test cases as needed
        #10 $finish;
    end

endmodule
