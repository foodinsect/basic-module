`timescale 1ns / 1ps
 
module all_bit_zero_or_one_detector_reduction(
    input wire  [7:0]   x,
    output wire         zero, one
    );
   
    assign zero = ~(|x);    // all bit zero
    assign one = &x;        // all-bit one

endmodule
