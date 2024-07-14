module top #(parameter N = 4) (
    // Declare inputs and outputs for the top module
    input wire  [N-1:0] a, b,
    input wire          Iagtb, Iaeqb, Ialtb,
    output wire         cgt, clt, ceq,
    output wire         Oagtb, Oaeqb, Oaltb
);

    

    // Instantiate the N-bit Comparator
    Nbit_Comparator #(N) comparator (
        .a(a),
        .b(b),
        .cgt(cgt),
        .clt(clt),
        .ceq(ceq)
    );

    // Instantiate the Cascadable N-bit Comparator
    Cascadable_Nbit_Comparator #(N) casc_comparator (
        .Iagtb(Iagtb),
        .Iaeqb(Iaeqb),
        .Ialtb(Ialtb),
        .a(a),
        .b(b),
        .Oagtb(Oagtb),
        .Oaeqb(Oaeqb),
        .Oaltb(Oaltb)
    );

endmodule
