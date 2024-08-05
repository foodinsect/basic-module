module counter_nbit #(
    parameter N = 4 // define counter size 
)(
    input wire clock, 
    input wire clear,
    output reg [N-1:0] qout
); 
    
    
always @(posedge clock or negedge clear) begin          // qout <= (qout + 1) % 2^n
    if (clear) begin
        qout <= {N{1'b0}}; 
    end
    else begin
        qout <= (qout + 1); 
    end
end

endmodule
