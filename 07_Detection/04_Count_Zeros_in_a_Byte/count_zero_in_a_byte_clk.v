`timescale 1ns / 1ps

module count_zero_in_a_byte_clk(
    input wire          clk, rst_n,
    input wire  [7:0]   data, 
	output reg  [2:0]   out3
);
    integer i;
    always @(posedge clk or negedge rst_n) begin 
        if (!rst_n) begin
            out3 <= 0;
            i <= 0;
        end
        else begin
            if (i <=7) begin
                if (data[i] == 0) begin
                    out3 <= out3 + 1;
                end
                i <= i + 1;
            end
        end 
    end
endmodule

