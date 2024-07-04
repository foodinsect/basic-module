`timescale 1ns / 1ps

module tb_top();
    // Define the signals to be tested
    reg [3:0] x, y;
    reg       c_in;
    wire [3:0] sum_st, sum_bh, sum_df, sum_param;
    wire       c_out_st, c_out_bh, c_out_df, c_out_param;

    // Instantiate the top module
    top uut (
        .x(x),
        .y(y),
        .c_in(c_in),
        .sum_st(sum_st),
        .c_out_st(c_out_st),
        .sum_bh(sum_bh),
        .c_out_bh(c_out_bh),
        .sum_df(sum_df),
        .c_out_df(c_out_df),
        .sum_param(sum_param),
        .c_out_param(c_out_param)
    );

    // Initial block to apply test vectors
    initial begin
        // Set initial values
        x = 4'b0000; y = 4'b0000; c_in = 1'b0;

        // Apply test vectors
        #10; x = 4'b0001; y = 4'b0010; c_in = 1'b0;
        #10; x = 4'b0101; y = 4'b0011; c_in = 1'b1;
        #10; x = 4'b1111; y = 4'b0001; c_in = 1'b0;
        #10; x = 4'b0110; y = 4'b0101; c_in = 1'b1;
        #10; x = 4'b1010; y = 4'b1010; c_in = 1'b0;
        #10; x = 4'b1111; y = 4'b1111; c_in = 1'b1;

        // Finish the simulation
        #10 $finish;
    end

    // Monitor block to print signals
    initial begin
        $monitor("Time: %0t | x: %b | y: %b | c_in: %b || sum_st: %b | c_out_st: %b || sum_bh: %b | c_out_bh: %b || sum_df: %b | c_out_df: %b || sum_param: %b | c_out_param: %b",
                 $time, x, y, c_in, sum_st, c_out_st, sum_bh, c_out_bh, sum_df, c_out_df, sum_param, c_out_param);
    end

endmodule
