`timescale 1ns / 1ps

module tb_top();
    // Declare inputs and outputs for the testbench
    reg [8:0] x;
    wire ep, op;

    // Instantiate the top module
    top uut(
        .x(x),
        .ep(ep),
        .op(op)
    );

    // Initialize signals and apply test vectors in the initial block
    initial begin
        // Monitor signals for debugging
        $monitor("Time = %d, x = %b, ep = %b, op = %b", $time, x, ep, op);

        // Test case 1: Apply a specific value to x
        x = 9'b101010101;
        #10; // Wait for 10 time units

        // Test case 2: Apply a different value to x
        x = 9'b010101010;
        #10; // Wait for 10 time units

        // Additional test cases can be added here

        // End simulation
        $finish;
    end

endmodule
