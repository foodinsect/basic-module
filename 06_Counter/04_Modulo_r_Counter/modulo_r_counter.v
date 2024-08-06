// N-bit Modulo-R Counter
module modulo_r_counter #(
    parameter N = 4,            // Define the size of the counter
    parameter R = 10            // Modulo value (e.g., BCD counter for R=10)
)(
    input wire clk,             // Clock signal
    input wire enable,          // Enable signal
    input wire reset,           // Synchronous reset signal
    output reg [N-1:0] qout,    // Counter output
    output wire cout            // Carry out signal
);
    // Carry out: high when counter reaches R-1
    assign cout = (qout == R - 1); 

    // Counter logic
    always @(posedge clk) begin
        if (reset) 
            qout <= {N{1'b0}}; // Reset counter to 0
        else if (enable) begin
            if (cout)
                qout <= 0; // Reset counter when reaching R-1
            else
                qout <= qout + 1; // Increment counter
        end
    end
endmodule
