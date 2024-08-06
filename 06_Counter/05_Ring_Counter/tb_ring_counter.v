`timescale 1ns / 1ps

module tb_ring_counter;
    reg clk;
    reg start;
    wire [3:0] qout;

    // Instantiate the ring_counter module
    ring_counter uut (
        .clk(clk),
        .start(start),
        .qout(qout)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period clock
    end

    // Stimulus
    initial begin
        // Initialize inputs
        start = 0;

        // Apply start signal
        #10 start = 1;
        #20 start = 0;

        // Let the counter run
        #100 $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t | start=%b | qout=%b", 
                 $time, start, qout);
    end

endmodule
