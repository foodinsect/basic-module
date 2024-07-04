`timescale 1ns / 1ps

module top(
    input wire x, y, c_in,
    output wire sum, c_out
    );

full_adder_structural FA_st(
.x(x),
.y(y),
.c_in(c_in),
.sum(sum),
.c_out(c_out)
);

full_adder_dataflow FA_df(
.x(x),
.y(y),
.c_in(c_in),
.sum(sum),
.c_out(c_out)
);

full_adder_behavioral FA_bh(
.x(x),
.y(y),
.c_in(c_in),
.sum(sum),
.c_out(c_out)
);

endmodule
