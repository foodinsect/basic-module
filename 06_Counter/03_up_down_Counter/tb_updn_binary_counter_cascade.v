`timescale 1ns / 1ps

module tb_updn_binary_counter_cascade;
    reg clk;
    reg reset;
    reg eup;
    reg edn;
    wire [7:0] qout;
    wire cout;
    wire bout;

    // Instantiate the updn_binary_counter_cascade module
    updn_binary_counter_cascade uut (
        .clk(clk),
        .reset(reset),
        .eup(eup),
        .edn(edn),
        .qout(qout),
        .cout(cout),
        .bout(bout)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns period clock
    end

    // Stimulus
    initial begin
        // Initialize inputs
        reset = 0;
        eup = 0;
        edn = 0;

        // Apply reset
        #10 reset = 1;
        #20 reset = 0;

        // Test up counting
        #30 eup = 1; // Enable up
        #50 eup = 0;

        // Test down counting
        #70 edn = 1; // Enable down
        #90 edn = 0;

        // Finish the simulation
        #150 $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t | reset=%b | eup=%b | edn=%b | qout=%b | cout=%b | bout=%b", 
                 $time, reset, eup, edn, qout, cout, bout);
    end

endmodule
