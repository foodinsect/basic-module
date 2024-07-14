`timescale 1ns / 1ps
 
module all_bit_zero_or_one_detector(
    input wire  [7:0]   x,
    output wire         zero, one
    );
    
    // all bit zero
    assign zero = ~(x[0] | x[1] | x[2] | x[3] | x[4] | x[5] | x[6] | x[7]);
    
    // all-bit one
    assign one = x[0] & x[1] & x[2] & x[3] & x[4] & x[5] & x[6] & x[7];
    
endmodule
