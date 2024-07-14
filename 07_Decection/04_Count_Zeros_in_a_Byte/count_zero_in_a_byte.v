`timescale 1ns / 1ps

module count_zero_in_a_byte(
    input wire          clk, rst_n,
    input wire  [7:0]   data, 
	output reg  [2:0]   out1, out2, out3
);
    integer i;
    always @(data) begin 
            out1 = 0;
            for (i = 0; i <= 7; i = i + 1) // simple condition 
                    if (data[i] == 0) out1 = out1 + 1; 
    end 
endmodule
