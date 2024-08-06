// asynchronous reset D-type flip-flop
module DFF_async_reset (
    input wire  clk, 
    input wire  reset_n,
    input wire  d,
    output reg  q
); 

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) 
            q <= 0; 
        else          
            q <= d; 
    end
endmodule
