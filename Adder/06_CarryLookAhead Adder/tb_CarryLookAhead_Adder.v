`timescale 1ns / 1ps

module tb_CarryLookAhead_Adder;

    // Parameters
    parameter N = 4;

    // Inputs
    reg [N-1:0] A;
    reg [N-1:0] B;
    reg Cin;

    // Outputs
    wire [N-1:0] S;
    wire Cout;

    // Instantiate the CarryLookAhead_Adder
    CarryLookAhead_Adder #(N) uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );

    // Test vectors
    initial begin
        // Monitor changes
        $monitor("Time: %0t | A = %b | B = %b | Cin = %b | S = %b | Cout = %b", $time, A, B, Cin, S, Cout);

        // Test case 1
        A = 4'b0000; B = 4'b0000; Cin = 1'b0; // Expected S = 0000, Cout = 0
        #10;

        // Test case 2
        A = 4'b0001; B = 4'b0010; Cin = 1'b0; // Expected S = 0011, Cout = 0
        #10;

        // Test case 3
        A = 4'b1111; B = 4'b0001; Cin = 1'b0; // Expected S = 0000, Cout = 1
        #10;

        // Test case 4
        A = 4'b1010; B = 4'b0101; Cin = 1'b0; // Expected S = 1111, Cout = 0
        #10;

        // Test case 5
        A = 4'b1100; B = 4'b1010; Cin = 1'b1; // Expected S = 0111, Cout = 1
        #10;

        // Test case 6
        A = 4'b1111; B = 4'b1111; Cin = 1'b1; // Expected S = 1111, Cout = 1
        #10;

        // End simulation
        $finish;
    end

endmodule
