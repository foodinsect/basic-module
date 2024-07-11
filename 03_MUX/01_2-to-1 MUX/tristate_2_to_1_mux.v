module tristate_2_to_1_mux (
    input wire x,    // Input signal x
    input wire y,    // Input signal y
    input wire s,    // Select signal
    output tri f     // Output signal with tri-state
    );

    // tristate 2-to-1 mux
    bufif0 b1 (f, x, s);
    bufif1 b2 (f, y, s);

endmodule
