module adder_nbit_case #(
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
        case (i)
            0: assign {c[i], sum[i]} = x[i] + y[i] + c_in; 
            N-1: assign {c_out, sum[i]} = x[i] + y[i] + c[i-1];
            default: assign {c[i], sum[i]} = x[i] + y[i] + c[i-1]; 
        endcase
    end 
    endgenerate

endmodule
