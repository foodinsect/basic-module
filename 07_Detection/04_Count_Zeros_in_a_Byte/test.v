`timescale 1ns / 1ps


module tb_count_zero_in_a_byte();
    reg clk_tb, rst_n_tb;
    reg [7:0] data_tb;
    wire [2:0] out1_tb, out2_tb, out3_tb;

    // Instantiate the top module
    top dut(
        .clk(clk_tb), 
        .rst_n(rst_n_tb), 
        .data(data_tb), 
        .out1(out1_tb), 
        .out3(out3_tb)
    );

    // Clock generation
    initial begin
        clk_tb = 0;
        forever #5 clk_tb = ~clk_tb; // Clock period of 10ns
    end

    // Test sequence
    initial begin
        // Initialize the data
        rst_n_tb = 0; // Apply reset
        data_tb = 8'b00001010; // Data to be tested
        #20; // Wait for two clock cycles
        rst_n_tb = 1; // Release reset
        #100; // Wait for some time to see the counting
        $finish; // End simulation
    end

endmodule
