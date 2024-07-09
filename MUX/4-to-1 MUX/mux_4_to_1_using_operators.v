`timescale 1ns / 1ps

module mux_4_to_1_using_operators(
    input i0, i1, i2, i3, s1, s0,
    output out
);

// Using basic and, or, not logic operators
assign out = (~s1 & ~s0 & i0) |
             (~s1 & s0 & i1) |
             (s1 & ~s0 & i2) |
             (s1 & s0 & i3) ;

endmodule
