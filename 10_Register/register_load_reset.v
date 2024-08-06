// An N-bit data register with synchronous load and asynchronous reset
module register_load_reset #(
    parameter N = 4   // number of bits
)(
    input wire          clk,
    input wire          load,
    input wire          reset_n,
    input wire  [N-1:0] din,
    output reg  [N-1:0] qout
); 

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)    
            qout <= {N{1'b0}}; 
        else if (load)  
            qout <= din;
    end
endmodule 
