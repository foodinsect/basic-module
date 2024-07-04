module full_adder(
    input   wire x, y, cin,
    output  wire s, cout
);
    wire s1, c1, c2;

    // full adder body
    // instantiate the half adder
    half_adder ha_1 (x, y, s1, c1); 
    half_adder ha_2 (cin, s1, s, c2); 
    or (cout, c1, c2);
        
endmodule
