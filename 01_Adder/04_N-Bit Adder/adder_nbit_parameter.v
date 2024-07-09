module adder_nbit_parameter #(
    parameter N = 4  // set default value 
)(
    input  wire     [N-1:0]     x, 
    input  wire     [N-1:0]     y,
    input  wire                 c_in,
    
    output wire     [N-1:0]     sum,
    output wire                 c_out
);
   assign {c_out, sum} = x + y + c_in; 
endmodule
