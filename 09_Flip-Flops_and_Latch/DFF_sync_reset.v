// synchronous reset D-type flip-flop
module DFF_sync_reset (
    input wire  clk, 
    input wire  reset_n,
    input wire  d,
    output reg  q
); 

    always @(posedge clk) begin
        if (!reset_n) 
            q <= 0; 
        else          
            q <= d; 
    end
endmodule
