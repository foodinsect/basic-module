// Full Adder Module using Behavioral Modeling
module full_adder_behavioral(
    input   wire    x,      // First input bit
    input   wire    y,      // Second input bit
    input   wire    c_in,   // Carry input bit
    output  reg     sum,    // Sum output bit
    output  reg     c_out   // Carry output bit
);

// Always block to describe combinational logic
always @(*) begin
    // Combine the inputs x, y, and c_in to calculate sum and carry out
    {c_out, sum} = x + y + c_in;
end

endmodule
