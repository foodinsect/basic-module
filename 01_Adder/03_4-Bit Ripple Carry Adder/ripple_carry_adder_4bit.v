module ripple_carry_adder_4bit(
    input   wire    [3:0]   a, b,
    input   wire            c_in,
    output  wire    [3:0]   sum,
    output  wire            c_out
);
    wire c1, c2, c3;
    
    // 4_bit ripple carry adder body
    // instantiate full_adder_Structure
    full_adder fa_1 (a[0], b[0], c_in, sum[0], c1);
    full_adder fa_2 (a[1], b[1], c1,   sum[1], c2);
    full_adder fa_3 (a[2], b[2], c2,   sum[2], c3);
    full_adder fa_4 (a[3], b[3], c3,   sum[3], c_out); 

endmodule