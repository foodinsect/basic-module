module decoder_3_to_8_active_high (
    input [2:0] x,  // 3-bit input
    input enable,  // enable signal
    output reg [7:0] y  // 8-bit output
);

always @(*) begin
    if (!enable)
        y = 8'b00000000;  // All outputs are low when enable is not active
    else
        case (x)
            3'b000: y = 8'b00000001;
            3'b001: y = 8'b00000010;
            3'b010: y = 8'b00000100;
            3'b011: y = 8'b00001000;
            3'b100: y = 8'b00010000;
            3'b101: y = 8'b00100000;
            3'b110: y = 8'b01000000;
            3'b111: y = 8'b10000000;
            default: y = 8'b00000000;
        endcase
end

endmodule
