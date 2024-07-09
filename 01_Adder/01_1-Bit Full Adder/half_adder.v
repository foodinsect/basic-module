// Half Adder Module
module half_adder(
    input wire x, y,    // Input bits
    output wire s, c    // Sum and carry outputs
);
    // XOR gate for sum calculation
    xor xor1(s, x, y);
    // AND gate for carry calculation
    and and1(c, x, y);
endmodule