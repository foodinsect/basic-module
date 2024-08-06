module shift_register_4_bit_blocking(
    input clk,
    input sin,
    output reg [3:0] qout
);
    
    always @(posedge clk) begin
        qout[0] = sin;
        qout[1] = qout[0];
        qout[2] = qout[1];
        qout[3] = qout[2];
    end
endmodule
