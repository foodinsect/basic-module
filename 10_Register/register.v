// An n-bit data register
module register #(
    parameter N = 4   // number of bits
)(
    input wire          clk,
    input wire [N-1:0]  din,
    output reg [N-1:0]  qout
); 

    always @(posedge clk) begin
        qout <= din;
    end
endmodule
