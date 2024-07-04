`timescale 1ns / 1ps

module full_adder_dataflow(
    input wire x, y, c_in,
    output wire sum, c_out
    );
    
    assign {c_out, sum} = x + y + c_in;
endmodule
