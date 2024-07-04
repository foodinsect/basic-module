module full_adder_behavioral(
    input   wire    x, y, c_in, 
    output  wire    sum, c_out
);
    reg sum, c_out;

    // specify the function of a full adder
    // always @(*) or always@(x or y or c_in) 
    always @(x, y, c_in) begin      
        {c_out, sum} = x + y + c_in;
    end

endmodule
