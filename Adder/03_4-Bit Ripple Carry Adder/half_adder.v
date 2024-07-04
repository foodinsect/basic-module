module half_adder(
    input wire x, y,
    output wire s, c
);
    xor xor1(s, x, y);
    and and1(c, x, y);
endmodule
