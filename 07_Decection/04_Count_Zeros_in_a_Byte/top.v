`timescale 1ns / 1ps

module top(
    input clk, rst_n,
    input [7:0] data,
    output [2:0] out1, out3, 
    output [3:0] out4, out5
);

// Instantiate count_zero_in_a_byte
count_zero_in_a_byte counter(
    .clk(clk), 
    .rst_n(rst_n), 
    .data(data), 
    .out1(out1)
);

// Instantiate count_zero_in_a_byte_ver3
count_zero_in_a_byte_clk counter_clk(
    .clk(clk), 
    .rst_n(rst_n), 
    .data(data), 
    .out3(out3)
);

// Instantiate count_zero_in_a_byte_ver2
zero_count_task counter_task(
    .data(data), 
    .out(out4)
);

// Instantiate count_zero_in_a_byte_ver3
zero_count_function counter_function(
    .data(data), 
    .out(out5)
);

endmodule
