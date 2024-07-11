module mux_4_to_1_behavioral(
    input wire [3:0] in,   // 4-bit input
    input wire [1:0] sel,  // 2-bit selection input
    output reg out         // 1-bit output (reg because it's in an always block)
);

// always block triggered on changes to in or sel
always @(*) begin
    case(sel)
        2'b00: out = in[0];
        2'b01: out = in[1];
        2'b10: out = in[2];
        2'b11: out = in[3];
        default: $display("Invalid control signals"); // default case to avoid latches
    endcase
end

endmodule