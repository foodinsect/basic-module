`timescale 1ns / 1ps

module tb_top();
// Define the signals to be tested. They need to be of type reg to assign values.
reg x, y, c_in;
wire sum_st, sum_df, sum_bh, c_out_st, c_out_df, c_out_bh;

// Create an instance of the 'top' module. Connect the inputs and outputs within the testbench.
top uut (
    .x(x), 
    .y(y), 
    .c_in(c_in), 
    .sum_st(sum_st), 
    .sum_df(sum_df), 
    .sum_bh(sum_bh), 
    .c_out_st(c_out_st),
    .c_out_df(c_out_df),
    .c_out_bh(c_out_bh)
);

// The initial block sets the initial values of the variables and defines the input sequence for simulation.
initial begin
    // Set initial values for input signals.
    x = 0; y = 0; c_in = 0;

    // Simulate based on combinations of input values.
    // Change the input values at intervals of 10ns.
    #10; x = 0; y = 0; c_in = 1;
    #10; x = 0; y = 1; c_in = 0;
    #10; x = 0; y = 1; c_in = 1;
    #10; x = 1; y = 0; c_in = 0;
    #10; x = 1; y = 0; c_in = 1;
    #10; x = 1; y = 1; c_in = 0;
    #10; x = 1; y = 1; c_in = 1;
    
    #10 $finish;
end

endmodule
