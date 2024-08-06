// An n-bit data register with asynchronous reset
module register_reset #(
    parameter N = 4   // number of bits
)(
    input wire          clk,
    input wire          reset_n,
    input wire  [N-1:0] din,
    output reg  [N-1:0] qout
); 

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) 
            qout <= {N{1'b0}}; 
        else          
            qout <= din; 
    end
endmodule
