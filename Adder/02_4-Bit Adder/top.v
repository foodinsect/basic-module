`timescale 1ns / 1ps

module top(
    input wire [3:0] x, y,
    input wire c_in,
    output wire [3:0] sum,
    output wire c_out
);

    
    four_bit_adder adder_st(
        .x(x),
        .y(y),
        .c_in(c_in),
        .sum(sum),
        .c_out(c_out)
    );
    
    four_bit_adder_df adder_df(
        .x(x),
        .y(y),
        .c_in(c_in),
        .sum(sum),
        .c_out(c_out)
    );
    
    // four_bit_adder_bh 인스턴스 생성
    four_bit_adder_bh adder_bh(
        .x(x),
        .y(y),
        .c_in(c_in),
        .sum(sum),
        .c_out(c_out)
    );
    
        
endmodule
