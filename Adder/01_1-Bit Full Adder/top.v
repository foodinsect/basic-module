module top(
    input wire x, y, c_in,
    output wire sum_st, 
    output wire sum_df, 
    output wire sum_bh, 
    output wire c_out_st,
    output wire c_out_df,
    output wire c_out_bh,
    );

full_adder_structural FA_st(
    .x(x),
    .y(y),
    .c_in(c_in),
    .sum(sum_st),
    .c_out(c_out_st)
);

full_adder_dataflow FA_df(
    .x(x),
    .y(y),
    .c_in(c_in),
    .sum(sum_df),
    .c_out(c_out_df)
);

full_adder_behavioral FA_bh(
    .x(x),
    .y(y),
    .c_in(c_in),
    .sum(sum_bh),
    .c_out(c_out_bh)
);

endmodule
