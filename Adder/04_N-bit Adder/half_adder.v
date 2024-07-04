module half_adder(    
    input   wire    x, y,
    output  wire    s, c
);
    // half adder body
    // instantiate primitive gates 
    xor(s,x,y);
    and(c,x,y);
endmodule
