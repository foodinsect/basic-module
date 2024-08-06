// a 3-bit ripple counter with enable control
module ripple_counter_enable(
    input wire clk, 
    input wire enable, 
    input wire reset_n, 
    output reg [2:0] qout
); 

    wire   c0, c1;

    assign c0 = qout[0], c1 = qout[1];

    always @(negedge clk or negedge reset_n) begin
        if (!reset_n) begin 
            qout[0] <= 1'b0; 
        end
        else if (enable) begin
            qout[0] <= ~qout[0]; 
        end
    end
    always @(negedge c0 or negedge reset_n) begin
        if (!reset_n) begin
            qout[1] <= 1'b0; 
        end
        else if (enable) begin
            qout[1] <= ~qout[1]; 
        end
    end
    always @(negedge c1 or negedge reset_n) begin
        if (!reset_n) begin
            qout[2] <= 1'b0; 
        end
        else if (enable) begin
            qout[2] <= ~qout[2];
        end
    end
endmodule
