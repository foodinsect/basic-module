// Full Adder Module using Dataflow Modeling
module full_adder_dataflow(
    input   wire    x,      // First input bit
    input   wire    y,      // Second input bit
    input   wire    c_in,   // Carry input bit
    output  wire    sum,    // Sum output bit
    output  wire    c_out   // Carry output bit
);
    
    // Use dataflow modeling to calculate sum and carry out
    assign {c_out, sum} = x + y + c_in;

endmodule