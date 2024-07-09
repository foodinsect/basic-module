`timescale 1ns / 1ps

module top(
    input [1:0] select,        // 2-bit select signal
    input enable,              // Enable signal
    input [7:0] in3,           // 8-bit input 3
    input [7:0] in2,           // 8-bit input 2
    input [7:0] in1,           // 8-bit input 1
    input [7:0] in0,           // 8-bit input 0
    output [7:0] out_enable,   // Output from the mux with enable
    output [7:0] out_conditional, // Output from the mux using conditional operator
    output [7:0] out_case      // Output from the mux using case structure
);

    // Instantiate the N_Bit_4_to_1_MUX_with_enable
    N_Bit_4_to_1_MUX_with_enable_control #(.N(8)) mux_with_enable_instance (
        .select(select),
        .enable(enable),
        .in3(in3),
        .in2(in2),
        .in1(in1),
        .in0(in0),
        .y(out_enable)
    );

    // Instantiate the N_Bit_4_to_1_MUX_using_conditional_operator
    N_Bit_4_to_1_MUX_using_conditional_operator #(.N(8)) mux_conditional_instance (
        .select(select),
        .in3(in3),
        .in2(in2),
        .in1(in1),
        .in0(in0),
        .y(out_conditional)
    );

    // Instantiate the N_Bit_4_to_1_MUX_using_case
    N_Bit_4_to_1_MUX_using_case #(.N(8)) mux_case_instance (
        .select(select),
        .in3(in3),
        .in2(in2),
        .in1(in1),
        .in0(in0),
        .y(out_case)
    );

endmodule
