module top (
    input wire clk,
    input wire enable,
    input wire reset_n,
    output wire [3:0] qout_nbit,
    output wire [2:0] qout_ripple,
    output wire [2:0] qout_ripple_enable
);

    // Instantiation of N-bit ripple counter
    N_bit_ripple_counter #(
        .N(4)
    ) u1 (
        .clk(clk),
        .reset_n(reset_n),
        .qout(qout_nbit)
    );

    // Instantiation of 3-bit ripple counter
    ripple_counter u2 (
        .clk(clk),
        .reset_n(reset_n),
        .qout(qout_ripple)
    );

    // Instantiation of 3-bit ripple counter with enable control
    ripple_counter_enable u3 (
        .clk(clk),
        .enable(enable),
        .reset_n(reset_n),
        .qout(qout_ripple_enable)
    );

endmodule
