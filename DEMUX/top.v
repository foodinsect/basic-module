`timescale 1ns / 1ps

module top(
    input [1:0] select,        // 2-bit select signal
    input enable,              // Enable signal
    input [3:0] in,            // 4-bit input for demuxes
    input in_1,
    output [3:0] out_enable3,  // Output from the demux with enable - y3
    output [3:0] out_enable2,  // Output from the demux with enable - y2
    output [3:0] out_enable1,  // Output from the demux with enable - y1
    output [3:0] out_enable0,  // Output from the demux with enable - y0
    output [3:0] out_if_else3, // Output from the demux using if else - y3
    output [3:0] out_if_else2, // Output from the demux using if else - y2
    output [3:0] out_if_else1, // Output from the demux using if else - y1
    output [3:0] out_if_else0, // Output from the demux using if else - y0
    output out_demux3,   // Output from the demux_1_to_4 - y3
    output out_demux2,   // Output from the demux_1_to_4 - y2
    output out_demux1,   // Output from the demux_1_to_4 - y1
    output out_demux0    // Output from the demux_1_to_4 - y0
);

    // Instantiate the N_Bit_1_to_4_DEMUX_with_enable
    N_Bit_1_to_4_demux_with_enable #(.N(4)) demux_with_enable_instance (
        .select(select),
        .enable(enable),
        .in(in),
        .y3(out_enable3),
        .y2(out_enable2),
        .y1(out_enable1),
        .y0(out_enable0)
    );

    // Instantiate the N_Bit_1_to_4_demux_using_if_else
    N_Bit_1_to_4_demux_using_if_else #(.N(4)) demux_if_else_instance (
        .select(select),
        .in(in),
        .y3(out_if_else3),
        .y2(out_if_else2),
        .y1(out_if_else1),
        .y0(out_if_else0)
    );

    // Instantiate the demux_1_to_4
    demux_1_to_4 demux_instance (
        .in(in_1),  // Only one bit input is used for this demux
        .s1(select[1]),
        .s0(select[0]),
        .out0(out_demux0),
        .out1(out_demux1),
        .out2(out_demux2),
        .out3(out_demux3)
    );

endmodule
