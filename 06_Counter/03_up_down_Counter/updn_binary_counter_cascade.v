// The cascade of two 4-bit up/down binary counters
module updn_binary_counter_cascade #(
    parameter N = 4             // Define the size of the counter
)(
    input wire clk,             // Clock signal
    input wire reset,           // Synchronous reset signal
    input wire eup,             // Enable up (increment) signal
    input wire edn,             // Enable down (decrement) signal
    output wire [2*N-1:0] qout,  // 8-bit Counter output (concatenated from two 4-bit counters)
    output wire cout,           // Carry out signal
    output wire bout            // Borrow out signal
);
    wire cout1, bout1;          // Intermediate carry and borrow signals

    // First 4-bit up/down counter instance
    updn_binary_counter #(N) udcnt1 (
        .clk(clk),
        .reset(reset),
        .eup(eup),
        .edn(edn),
        .qout(qout[3:0]),
        .cout(cout1),
        .bout(bout1)
    );

    // Second 4-bit up/down counter instance
    updn_binary_counter #(N) udcnt2 (
        .clk(clk),
        .reset(reset),
        .eup(cout1),
        .edn(bout1),
        .qout(qout[7:4]),
        .cout(cout),
        .bout(bout)
    );

endmodule
