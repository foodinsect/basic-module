module N_bit_ripple_counter #(
    parameter N = 4 // define the size of the counter
)(
    input wire clk,
    input wire reset_n,
    output reg [N-1:0] qout
);
    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin: ripple_counter_gen
            if (i == 0) begin
                // specify LSB
                always @(negedge clk or negedge reset_n) begin
                    if (!reset_n)
                        qout[0] <= 1'b0;
                    else
                        qout[0] <= ~qout[0];
                end
            end 
            else begin
                // specify the rest bits
                always @(negedge qout[i-1] or negedge reset_n) begin
                    if (!reset_n)
                        qout[i] <= 1'b0;
                    else
                        qout[i] <= ~qout[i];
                end
            end
        end
    endgenerate
endmodule
