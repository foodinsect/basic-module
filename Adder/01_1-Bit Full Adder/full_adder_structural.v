// Full Adder Module using Structural Modeling
module full_adder_structural(
    input   wire    x,          // First input bit
    input   wire    y,          // Second input bit
    input   wire    c_in,       // Carry input bit
    output  wire    sum,        // Sum output bit
    output  wire    c_out       // Carry output bit
);

    // Internal wires to connect the half adders
    wire s1, c1, c2;

    // First Half Adder Instance
    // Adds x and y, producing a sum (s1) and a carry (c1)
    half_adder HA2( .x(c_in), .y(s1), .s(sum), .c(c2) );

    // Second Half Adder Instance
    // Adds carry input (c_in) and the sum from the first half adder (s1)
    // Produces the final sum and an intermediate carry (c2)
    half_adder HA2( .x(c_in), .y(s1), .s(sum), .c(c2) );

    // OR Gate to produce the final carry out (c_out)
    // Combines the carry outputs from both half adders (c1 and c2)
    or or1( .c_out(c_out), .c1(c1), .c2(c2) );

endmodule
