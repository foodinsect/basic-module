`timescale 1ns / 1ps

module top_tb;

    // Inputs
    reg [1:0] select;
    reg enable;
    reg [3:0] in;
    reg in_1;

    // Outputs
    wire [3:0] out_enable3, out_enable2, out_enable1, out_enable0;
    wire [3:0] out_if_else3, out_if_else2, out_if_else1, out_if_else0;
    wire out_demux3, out_demux2, out_demux1, out_demux0;

    // Instantiate the top module
    top uut (
        .select(select),
        .enable(enable),
        .in(in),
        .in_1(in_1),
        .out_enable3(out_enable3),
        .out_enable2(out_enable2),
        .out_enable1(out_enable1),
        .out_enable0(out_enable0),
        .out_if_else3(out_if_else3),
        .out_if_else2(out_if_else2),
        .out_if_else1(out_if_else1),
        .out_if_else0(out_if_else0),
        .out_demux3(out_demux3),
        .out_demux2(out_demux2),
        .out_demux1(out_demux1),
        .out_demux0(out_demux0)
    );

    // Initialize and run the test
    initial begin
        // Initialize inputs
        select = 2'b00;
        enable = 1;
        in = 4'b1010; // Input value for demux
        in_1 = 1'b1;

        // Test each select value
        #10 select = 2'b00; // Expected: out_enable0 = in, others = 0
        #10 select = 2'b01; // Expected: out_enable1 = in, others = 0
        #10 select = 2'b10; // Expected: out_enable2 = in, others = 0
        #10 select = 2'b11; // Expected: out_enable3 = in, others = 0

        // Test enable signal
        #10 enable = 0;     // Expected: all outputs = 0
        #10 enable = 1;     // Expected: output based on select

        // Test each select value with enable
        #10 select = 2'b00; in = 4'b1100; // Expected: out_enable0 = in, others = 0
        #10 select = 2'b01; in = 4'b0011; // Expected: out_enable1 = in, others = 0
        #10 select = 2'b10; in = 4'b1111; // Expected: out_enable2 = in, others = 0
        #10 select = 2'b11; in = 4'b0001; // Expected: out_enable3 = in, others = 0

        // End of test
        #10 $finish;
    end

    // Monitor the signals
    initial begin
        $monitor("Time=%0d enable=%b select=%b in=%b | out_enable={%b, %b, %b, %b} out_if_else={%b, %b, %b, %b} out_demux={%b, %b, %b, %b}",
                 $time, enable, select, in,
                 out_enable3, out_enable2, out_enable1, out_enable0,
                 out_if_else3, out_if_else2, out_if_else1, out_if_else0,
                 out_demux3, out_demux2, out_demux1, out_demux0);
    end

endmodule
