`timescale 1ns / 1ps

module tb_top();
    // Declare inputs as registers
    reg [3:0] a, b;
    reg c_in;

    // Declare outputs as wires
    wire [3:0] sum;
    wire c_out;

    // Instantiate the 4-bit ripple carry adder
    ripple_carry_adder_4bit uut (
        .a(a), 
        .b(b), 
        .c_in(c_in), 
        .sum(sum), 
        .c_out(c_out)
    );

    // Initial block to apply test vectors
    initial begin
        // Initial input values
        a = 4'b0000;
        b = 4'b0000;
        c_in = 1'b0;
        #10; // Wait for 10ns
        
        // Apply first set of test vectors
        a = 4'b0101; // 5
        b = 4'b0011; // 3
        c_in = 1'b0;
        #10; // Wait for 10ns
        
        // Apply second set of test vectors
        a = 4'b1010; // 10
        b = 4'b0101; // 5
        c_in = 1'b1;
        #10; // Wait for 10ns

        // End simulation
        $finish;
    end

endmodule
