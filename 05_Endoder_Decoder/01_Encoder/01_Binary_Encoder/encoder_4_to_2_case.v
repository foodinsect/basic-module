module encoder_4_to_2_case (
    input [3:0] in,  // 4-bit input
    output reg [1:0] y  // 2-bit output
);

always @(*) begin
    case (in)
        4'b0001: y = 2'b00;
        4'b0010: y = 2'b01;
        4'b0100: y = 2'b10;
        4'b1000: y = 2'b11;
        default: y = 2'bzz;  // Undefined output for invalid input
    endcase
end

endmodule
