module adder_nbit_st #(
    parameter N = 4  // set default value 
)(
    input  wire     [N-1:0]     x, 
    input  wire     [N-1:0]     y,
    input  wire                 c_in,
    
    output wire     [N-1:0]     sum,
    output wire                 c_out
);
    wire  [N-2:0] c;      // internal carries declared as nets 

    genvar i;
    generate for (i = 0; i < N; i = i + 1) begin: adder
        if (i == 0)           // specify LSB
            full_adder fa (x[i], y[i], c_in, sum[i], c[i]); 
        else if (i == N-1) // specify MSB
            full_adder fa (x[i], y[i], c[i-1], sum[i], c_out); 
        else                // specify other bits
            full_adder fa (x[i], y[i], c[i-1], sum[i], c[i]); 
        end 
    endgenerate
endmodule
