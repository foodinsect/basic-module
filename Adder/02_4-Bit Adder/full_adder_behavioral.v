`timescale 1ns / 1ps

module full_adder_behavioral(
    input wire x, y, c_in, 
    output wire sum, c_out
    );
    reg sum, c_out;
// specify the function of a full adder
always @(x, y, c_in) // always @(*) or always@(x or y or c_in) 
    {c_out, sum} = x + y + c_in;

endmodule
