`timescale 1ns / 1ps

module tb_modulo_r_counter;
    reg clk;
    reg enable;
    reg reset;
    wire [3:0] qout;
    wire cout;

    // Instantiate the modulo_r_counter module
    modulo_r_counter uut (
        .clk(clk),
        .enable(enable),
        .reset(reset),
        .qout(qout),
        .cout(cout)
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
        enable = 0;

        // Apply reset
        #10 reset = 1;
        #20 reset = 0;

        // Enable the counter
        #30 enable = 1;

        // Finish the simulation
        #150 enable = 0;
        #170 $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t | reset=%b | enable=%b | qout=%b | cout=%b", 
                 $time, reset, enable, qout, cout);
    end

endmodule
