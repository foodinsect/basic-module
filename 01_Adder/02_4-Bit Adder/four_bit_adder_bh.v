module four_bit_adder_bh (
    input   wire    [3:0]   x, y,
    input   wire            c_in,
    output  wire    [3:0]   sum,
    output  wire            c_out
); 
    wire c1, c2, c3; // intermediate carries 
    
    // four_bit adder body
    // full_adder_behavioral
    full_adder_behavioral fa_bh_1 (x[0], y[0], c_in, sum[0], c1);
    full_adder_behavioral fa_bh_2 (x[1], y[1], c1,   sum[1], c2);
    full_adder_behavioral fa_bh_3 (x[2], y[2], c2,   sum[2], c3);
    full_adder_behavioral fa_bh_4 (x[3], y[3], c3,   sum[3], c_out); 
   
endmodule