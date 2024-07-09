`timescale 1ns / 1ps

module CarryLookAhead_Adder #(
    parameter N = 4
)(
    input   wire    [N-1:0]     A, B,           // N-bit inputs A and B
    input   wire                Cin,            // Carry input
    output  wire    [N-1:0]     S,              // N-bit sum output
    output  wire                Cout            // Carry output
    );
    
    wire    [N-1:0]    G, P;     // Generate and propagate signals
    wire    [N:0]      C;          // Internal carry signals (N+1 bits)

    // Generate and propagate signals
    assign G = A & B;      // Generate: AND of A and B
    assign P = A ^ B;      // Propagate: XOR of A and B
    
    // Internal carry signals calculation
    assign C[0] = Cin;
    
    genvar i;
    generate
        for (i = 1; i <= N; i = i + 1) begin : carry_calc
            assign C[i] = G[i-1] | (P[i-1] & C[i-1]);
        end
    endgenerate

    // Sum calculation
    generate
        for (i = 0; i < N; i = i + 1) begin : sum_calc
            assign S[i] = P[i] ^ C[i];
        end
    endgenerate
    
    // Final carry out
    assign Cout = C[N];
    
endmodule
