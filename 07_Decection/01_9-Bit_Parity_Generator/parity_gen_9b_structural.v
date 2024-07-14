`timescale 1ns / 1ps

module parity_gen_9b_structural(
    input   wire [8:0]  x,
    output  wire        ep, 
    output  wire        op
    );
    wire c, d, e, f, g, h, i;
    
    xor xor1(c, x[0], x[1]);
    xor xor2(d, x[2], x[3]);
    xor xor3(e, x[4], x[5]);
    xor xor4(f, x[6], x[7]);
    xor xor5(g, c, d);
    xor xor6(h, e, f);
    xor xor7(i, g, h);
    xor xor8(ep, x[8], i);
    xnor xnor1(op, x[8], i);
    
endmodule
