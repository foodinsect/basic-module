module nesting_4_to_1_mux(
    input wire i0,    // Input signal 0
    input wire i1,    // Input signal 1
    input wire i2,    // Input signal 2
    input wire i3,    // Input signal 3
    input wire s0,    // Select signal 0
    input wire s1,    // Select signal 1
    output wire out   // Output signal
    );

    // 4-to-1 multiplexer using nested conditional operators
    assign out = s1 ? (s0 ? i3 : i2) : (s0 ? i1 : i0); // Nested conditional operator for 4-to-1 mux

endmodule
