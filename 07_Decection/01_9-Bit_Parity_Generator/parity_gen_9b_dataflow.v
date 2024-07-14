`timescale 1ns / 1ps

module parity_gen_9b_dataflow(
    input   wire [8:0]  x,
    output  wire        ep, 
    output  wire        op
    );
    
    //assign ep = x[0] ^ x[1] ^ x[2] ^ x[3] ^ x[4] ^ x[5] ^ x[6] ^ x[7] ^ x[8];
    //assign op = ~(x[0] ^ x[1] ^ x[2] ^ x[3] ^ x[4] ^ x[5] ^ x[6] ^ x[7] ^ x[8]);
    
    assign ep = ^x;
    assign op = ~ep;

endmodule
