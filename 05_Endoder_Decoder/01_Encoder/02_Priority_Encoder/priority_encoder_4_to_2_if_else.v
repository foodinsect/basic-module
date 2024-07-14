module priority_encoder_4_to_2_if_else (
    input [3:0] in,  // 4-bit input
    output reg [1:0] y,  // 2-bit output
    output valid_in  // valid signal
);

// valid_in signal indicates if any input is 1
assign valid_in = |in;

always @(*) begin
    if (in[3]) y = 2'b11;
    else if (in[2]) y = 2'b10;
    else if (in[1]) y = 2'b01;
    else if (in[0]) y = 2'b00;
    else y = 2'bxx;
end

endmodule
