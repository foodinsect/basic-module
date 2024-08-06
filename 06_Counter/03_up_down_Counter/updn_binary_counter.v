module updn_binary_counter #(
    parameter N = 4             // Define the size of the counter
)(
    input wire clk,             // Clock signal
    input wire reset,           // Synchronous reset signal
    input wire eup,             // Enable up (increment) signal
    input wire edn,             // Enable down (decrement) signal
    output reg [N-1:0] qout,    // Counter output
    output wire cout,           // Carry out signal
    output wire bout            // Borrow out signal
);
    

    always @(posedge clk) begin
        if (reset) 
            qout <= {N{1'b0}}; // Synchronous reset: set counter to 0
        else if (eup) 
            qout <= qout + 1; // Increment counter
        else if (edn) 
            qout <= qout - 1; // Decrement counter
    end
        
    assign cout = (&qout) & eup;  // Generate carry out when counter is at max and eup is high
    assign bout = (~|qout) & edn; // Generate borrow out when counter is at 0 and edn is high
endmodule
