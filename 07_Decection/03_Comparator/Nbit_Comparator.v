module Nbit_Comparator #(
    parameter N = 4
) (
    input wire [N-1:0]   a,
    input wire [N-1:0]   b,
    output wire          cgt,
    output wire          clt,
    output wire          ceq
);

    // Assign the comparison results to outputs
    assign cgt = (a > b);
    assign clt = (a < b);
    assign ceq = (a == b);

endmodule
