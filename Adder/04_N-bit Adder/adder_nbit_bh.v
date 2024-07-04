module adder_nbit_bh #(
    parameter N = 4  // set default value 
)(
    input  wire     [N-1:0]     x, 
    input  wire     [N-1:0]     y,
    input  wire                 c_in,
    
    output reg      [N-1:0]     sum,
    output reg                  c_out
);
    reg  [N-2:0] c;      // internal carries declared as nets 

    genvar i;
    generate for (i = 0; i < N; i = i + 1) begin: adder
        if  (i == 0)            // specify LSB
            always @(*) {c[i], sum[i]} =  x[i] + y[i] + c_in; 
        else if (i == N-1)  // specify MSB
            always @(*) {c_out, sum[i]} =  x[i] + y[i] + c[i-1]; 
        else                     // specify other bits
            always @(*) {c[i], sum[i]} =  x[i] + y[i] + c[i-1]; 
    end 
    endgenerate
endmodule
