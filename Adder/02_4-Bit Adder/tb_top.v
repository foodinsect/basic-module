`timescale 1ns / 1ps

module tb_top;
    reg [3:0] x,y; 
    reg c_in; 
    wire [3:0] sum_st; 
    wire [3:0] sum_df; 
    wire [3:0] sum_bh; 
    wire c_out_st;
    wire c_out_df;
    wire c_out_bh;
    
    // Unit Under Test port map
    top UUT (
    .x(x), 
    .y(y), 
    .c_in(c_in), 
    .sum_st(sum_st), 
    .sum_df(sum_df), 
    .sum_bh(sum_bh), 
    .c_out_st(c_out_st),
    .c_out_df(c_out_df),
    .c_out_bh(c_out_bh)
    ); 
    
    reg [7:0] i;
    initial 
        for (i = 0; i <= 255; i = i + 1) begin
            x[3:0] = i[7:4]; y[3:0] = i[3:0]; c_in =1'b0; 
            #20 ;   end
    initial #6000 $finish; 
    initial
        $monitor($realtime,"ns %h %h %h %h", x, y, c_in, {c_out, sum});
endmodule
