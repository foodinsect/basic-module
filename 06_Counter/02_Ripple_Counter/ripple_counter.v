// a 3-bit ripple counter module example
module ripple_counter(
    input wire clk, 
    input wire reset_n,
    output reg [2:0] qout
);
    wire   c0, c1;

    // the body of the 3-bit ripple counter
    assign c0 = qout[0], c1 = qout[1]; 

    always @(negedge clk or negedge reset_n) begin
        if (!reset_n)
            qout[0] <= 1'b0;
        else
            qout[0] <= ~qout[0];
    end

    always @(negedge c0 or negedge reset_n) begin
        if (!reset_n)
            qout[1] <= 1'b0;
        else
            qout[1] <= ~qout[1];
    end

    always @(negedge c1 or negedge reset_n) begin
        if (!reset_n)
            qout[2] <= 1'b0;
        else
            qout[2] <= ~qout[2];
    end
        
endmodule
