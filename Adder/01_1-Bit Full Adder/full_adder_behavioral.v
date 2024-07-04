`timescale 1ns / 1ps

module full_adder_behavioral(
    input wire x, y, c_in,
    output reg sum, c_out
    );

    always @(*) begin
        {c_out, sum} = x + y + c_in;
    end
endmodule
