`timescale 1ns / 1ps

module ALU_logical_comb(
    input wire A, B,
    input wire [3:0] S, 
    output wire out1, out2
    );
    wire nb;
    wire aw1, aw2, aw3, aw4, aw5;
    
    not (nb, B);
    
    and (aw1, A);
    and (aw2, B, S[0]);
    and (aw3, nb, S[1]);
    and (aw4, nb, A, S[2]);
    and (aw5, A, B, S[3]);
    
    nor (out1, aw1, aw2, aw3);
    nor (out2, aw4, aw5);
endmodule
