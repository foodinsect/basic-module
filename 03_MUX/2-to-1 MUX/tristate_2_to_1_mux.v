module tristate_2_to_1_mux(
    input wire x,    // Input signal x
    input wire y,    // Input signal y
    input wire s,    // Select signal
    output wire f    // Output signal
    );

    // tristate 2-to-1 mux
    bufif0 b1 (f, x, ~s); // When s = 0, f = x
    bufif1 b2 (f, y, s);  // When s = 1, f = y

endmodule
