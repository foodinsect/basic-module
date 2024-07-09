`timescale 1ns / 1ps

module N_Bit_1_to_4_demux_with_enable #(
    parameter N = 4 // Default width is 4 bits
)(
    input [1:0] select,     // 2-bit select signal
    input [N-1:0] in,       // N-bit input
    input enable,           // Enable signal
    output reg [N-1:0] y3,  // N-bit output 3
    output reg [N-1:0] y2,  // N-bit output 2
    output reg [N-1:0] y1,  // N-bit output 1
    output reg [N-1:0] y0   // N-bit output 0
);

    always @(*) begin 
        if (enable) begin
        if (select == 3) y3 = in; else y3 = {N{1'b0}}; 
        if (select == 2) y2 = in; else y2 = {N{1'b0}}; 
        if (select == 1) y1 = in; else y1 = {N{1'b0}}; 
        if (select == 0) y0 = in; else y0 = {N{1'b0}};
        end
        else begin
            y3 = {N{1'b0}}; y2 = {N{1'b0}}; y1 = {N{1'b0}}; y0 = {N{1'b0}}; 
        end 
    end

endmodule
