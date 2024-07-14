module decoder_2_to_4_active_high (
    input [1:0] x,  // 2-bit input
    input enable,  // enable signal
    output reg [3:0] y  // 4-bit output
);

always @(*) begin
    if (!enable) 
        y = 4'b0000;  // All outputs are low when enable is not active
    else 
        case (x)
            2'b00: y = 4'b0001;
            2'b01: y = 4'b0010;
            2'b10: y = 4'b0100;
            2'b11: y = 4'b1000;
            default: y = 4'b0000;
        endcase
end

endmodule
