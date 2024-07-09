module top (
    input  wire [3:0] x, 
    input  wire [3:0] y,
    input  wire       c_in,
    
    output wire [3:0] sum_st,
    output wire       c_out_st,
    output wire [3:0] sum_bh,
    output wire       c_out_bh,
    output wire [3:0] sum_df,
    output wire       c_out_df,
    output wire [3:0] sum_param,
    output wire       c_out_param
);

    // Instantiating the different adder modules
    adder_nbit_st #(.N(4)) nbit_adder_st (
        .x(x),
        .y(y),
        .c_in(c_in),
        .sum(sum_st),
        .c_out(c_out_st)
    );

    adder_nbit_bh #(.N(4)) nbit_adder_bh (
        .x(x),
        .y(y),
        .c_in(c_in),
        .sum(sum_bh),
        .c_out(c_out_bh)
    );

    adder_nbit_df #(.N(4)) nbit_adder_df (
        .x(x),
        .y(y),
        .c_in(c_in),
        .sum(sum_df),
        .c_out(c_out_df)
    );

    adder_nbit_parameter #(.N(4)) nbit_adder_param (
        .x(x),
        .y(y),
        .c_in(c_in),
        .sum(sum_param),
        .c_out(c_out_param)
    );

endmodule
