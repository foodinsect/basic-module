module priority_encoder_4_to_2_casex (
    input [3:0] in,  // 4-bit input
    output reg [1:0] y,  // 2-bit output
    output valid_in  // valid signal
);

// valid_in signal indicates if any input is 1
assign valid_in = |in;

always @(*) begin
    casex (in)
        4'b1xxx: y = 2'b11; 
        4'b01xx: y = 2'b10; 
        4'b001x: y = 2'b01; 
        4'b0001: y = 2'b00; 
        default: y = 2'bxx;
    endcase
end

endmodule
