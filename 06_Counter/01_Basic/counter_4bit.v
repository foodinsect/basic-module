module counter_4bit(
    input wire clk, 
    input wire clear,
    output reg [3:0] qout
);
    
always @(posedge clk or negedge clear) begin
    if (clear) begin
        qout <= 4'd0;
    end
    else begin
        qout <= (qout + 1);
    end
end
    
endmodule
