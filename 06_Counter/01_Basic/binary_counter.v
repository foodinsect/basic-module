module binary_counter #(
    parameter N = 4

)(
   input wire clk, 
   input wire enable, 
   input wire reset,
   output wire cout,    // carry output
   output reg [N-1:0] qout
); 
    
    always @(posedge clk) begin
        if (reset) begin
            qout <= {N{1'b0}}; 
        end
        else if (enable) begin
           qout <= qout + 1;
        end
    end
    
    // generate carry output
    assign cout = (&qout) & enable; //cout can be used for enable of higher module (cascade) 
    
endmodule
