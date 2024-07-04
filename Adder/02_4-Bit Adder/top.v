`timescale 1ns / 1ps

module top(
    input wire [3:0] x, y,
    input wire c_in,
    output wire [3:0] sum_st,
    output wire [3:0] sum_df,
    output wire [3:0] sum_bh,
    output wire c_out_st,
    output wire c_out_df,
    output wire c_out_bh
);

    // Structure
    four_bit_adder adder_st(
        .x(x),
        .y(y),
        .c_in(c_in),
        .sum(sum_st),
        .c_out(c_out_st)
    );
    
    // Dataflow
    four_bit_adder_df adder_df(
        .x(x),
        .y(y),
        .c_in(c_in),
        .sum(sum_df),
        .c_out(c_out_df)
    );
    
    // Behavioral
    four_bit_adder_bh adder_bh(
        .x(x),
        .y(y),
        .c_in(c_in),
        .sum(sum_bh),
        .c_out(c_out_bh)
    );
    
        
endmodule
