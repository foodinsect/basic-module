// negative edge triggered D flip flop with asynchronous reset
module DFF_edge (
    input wire clk, 
    input wire reset,
    input wire d, 
    output reg q, 
    output reg qbar
); 

    always @(negedge clk) begin
        q <= d; 
        qbar <= ~d; 
    end
    always @(reset) begin           // override the regular assignments 
        if (reset) begin 
            assign q = 1'b0;        //only blocking assignment 
            assign qbar = 1'b1;
        end else begin              // release q and qbar 
            deassign q; 
            deassign qbar; 
        end 
    end
endmodule
