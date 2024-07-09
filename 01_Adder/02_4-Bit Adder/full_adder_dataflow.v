module full_adder_dataflow(
    input   wire x, y, c_in, 
    output  wire sum, c_out
);

// specify the function of a full adder 
assign {c_out, sum} = x + y + c_in;

endmodule