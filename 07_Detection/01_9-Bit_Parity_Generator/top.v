`timescale 1ns / 1ps

module top(
    input [8:0] x,
    output ep, op
    );
        
    parity_gen_9b_structural st(
        .x(x),
        .ep(ep),
        .op(op)
    );

    parity_gen_9b_dataflow df(
        .x(x),
        .ep(ep),
        .op(op)
    );

    parity_gen_9b_behavioral bh(
        .x(x),
        .ep(ep),
        .op(op)
    );

endmodule
