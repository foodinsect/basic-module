// D-type latch
module D_latch (
    input wire  gate, 
    input wire  clear, 
    input wire  d, 
    output reg  q
); 

    always @(clear or gate) begin
        if (clear) begin
            q <= 0;
        end 
        else if (gate) begin
            q <= d;
        end
        else begin
            q <= q;         //can be omitted 
        end
    end
endmodule
