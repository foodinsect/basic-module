module decoder_2_to_4_active_low (
    input [1:0] x,  // 2-bit input
    input enable_n,  // active low enable signal
    output reg [3:0] y  // 4-bit output
);

always @(*) begin
    if (enable_n)
        y = 4'b1111;  // All outputs are high when enable is active low
    else 
        case (x)
            2'b00: y = 4'b1110;
            2'b01: y = 4'b1101;
            2'b10: y = 4'b1011;
            2'b11: y = 4'b0111;
            default: y = 4'b1111;
        endcase
end

endmodule
