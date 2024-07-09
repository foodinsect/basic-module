`timescale 1ns / 1ps


module mux_4_to_1_dataflow(
    input wire [3:0] in,  // 4-bit input
    input wire [1:0] sel, // 2-bit selection input
    output wire out       // 1-bit output
);

// Using assign with a conditional operator to select the input based on sel
assign out = (sel == 2'b00) ? in[0] :
             (sel == 2'b01) ? in[1] :
             (sel == 2'b10) ? in[2] :
             in[3]; // default case for sel == 2'b11

endmodule

