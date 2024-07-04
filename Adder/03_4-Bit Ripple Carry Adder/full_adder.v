module full_adder(
    input wire x, y, c_in,
    output wire sum, c_out
);
    wire s1, c1, c2;

    half_adder HA1(
    .x(x),
    .y(y),
    .s(s1),
    .c(c1)
    );

    half_adder HA2(
    .x(c_in),
    .y(s1),
    .s(sum),
    .c(c2)
    );

    or or1(c_out,c1,c2);
endmodule