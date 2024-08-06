`timescale 1ns / 1ps

module tb_top;
    reg clk;
    reg enable;
    reg reset_n;
    wire [3:0] qout_nbit;
    wire [2:0] qout_ripple;
    wire [2:0] qout_ripple_enable;

    // Instantiate the top module
    top uut (
        .clk(clk),
        .enable(enable),
        .reset_n(reset_n),
        .qout_nbit(qout_nbit),
        .qout_ripple(qout_ripple),
        .qout_ripple_enable(qout_ripple_enable)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period clock
    end

    // Stimulus
    initial begin
        // Initialize inputs
        reset_n = 0;
        enable = 0;

        // Apply reset
        #10 reset_n = 1;

        // Enable counters after some time
        #20 enable = 1;

        // Disable enable after some time
        #100 enable = 0;

        // Finish the simulation after some time
        #200 $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t, reset_n=%b, enable=%b, qout_nbit=%b, qout_ripple=%b, qout_ripple_enable=%b", 
                 $time, reset_n, enable, qout_nbit, qout_ripple, qout_ripple_enable);
    end

endmodule
