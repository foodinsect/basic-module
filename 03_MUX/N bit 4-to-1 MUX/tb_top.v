`timescale 1ns / 1ps

module top_tb;

    // Inputs
    reg [1:0] select;
    reg enable;
    reg [7:0] in3;
    reg [7:0] in2;
    reg [7:0] in1;
    reg [7:0] in0;

    // Outputs
    wire [7:0] out_enable;
    wire [7:0] out_conditional;
    wire [7:0] out_case;

    // Instantiate the top module
    top uut (
        .select(select),
        .enable(enable),
        .in3(in3),
        .in2(in2),
        .in1(in1),
        .in0(in0),
        .out_enable(out_enable),
        .out_conditional(out_conditional),
        .out_case(out_case)
    );

    // Initialize and run the test
    initial begin
        // Initialize inputs
        select = 2'b00;
        enable = 1;
        in3 = 8'hF0; // 11110000
        in2 = 8'hCC; // 11001100
        in1 = 8'hAA; // 10101010
        in0 = 8'h55; // 01010101

        // Test each select value
        #10 select = 2'b00; // Expect out_conditional = in0, out_case = in0, out_enable = in0
        #10 select = 2'b01; // Expect out_conditional = in1, out_case = in1, out_enable = in1
        #10 select = 2'b10; // Expect out_conditional = in2, out_case = in2, out_enable = in2
        #10 select = 2'b11; // Expect out_conditional = in3, out_case = in3, out_enable = in3

        // Test enable signal
        #10 enable = 0;     // Expect out_enable = 0
        #10 enable = 1;     // Expect out_enable = selected input

        // End of test
        #10 $finish;
    end

    // Monitor the signals
    initial begin
        $monitor("Time=%0d enable=%b select=%b in0=%h in1=%h in2=%h in3=%h | out_enable=%h out_conditional=%h out_case=%h",
                 $time, enable, select, in0, in1, in2, in3, out_enable, out_conditional, out_case);
    end

endmodule
