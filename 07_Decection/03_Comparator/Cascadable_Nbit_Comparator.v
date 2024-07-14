`timescale 1ns / 1ps

module Cascadable_Nbit_Comparator #(
    parameter N = 4
) (
    input wire              Iagtb,
    input wire              Iaeqb,
    input wire              Ialtb,
    input wire  [N-1:0]     a,
    input wire  [N-1:0]     b,
    output wire             Oagtb,
    output wire             Oaeqb,
    output wire             Oaltb
);
    // Assign equality comparison result to output
    assign Oaeqb = (a == b) && (Iaeqb == 1);                // When a == b and Iaeqb is 1

    // Assign greater than comparison result to output
    assign Oagtb = (a > b) || ((a == b) && (Iagtb == 1));   // When a > b or a == b and Iagtb is 1

    // Assign less than comparison result to output
    assign Oaltb = (a < b) || ((a == b) && (Ialtb == 1));   // When a < b or a == b and Ialtb is 1
    
endmodule
