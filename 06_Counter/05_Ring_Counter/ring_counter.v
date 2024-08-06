// Ring Counter with Initial Value
// 2^N-N invalid states and N valid states
module ring_counter #(
    parameter N = 4             // Define the default size of the counter
)(
    input wire clk,             // Clock signal
    input wire start,           // Start signal to initialize the counter
    output reg [0:N-1] qout     // Counter output
);

    // Counter logic
    always @(posedge clk or posedge start) begin
        if (start)
            qout <= {1'b1, {N-1{1'b0}}};        // Initialize counter with "1000...0"
        else
            qout <= {qout[N-1], qout[0:N-2]};   // Shift left with wrap-around
    end
endmodule
