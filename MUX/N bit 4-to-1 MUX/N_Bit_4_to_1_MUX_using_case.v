module N_Bit_4_to_1_MUX_using_case #(
    parameter N = 8 // Default width is 8 bits
)(
    input [1:0] select,       // 2-bit select signal
    input [N-1:0] in3,        // N-bit input 3
    input [N-1:0] in2,        // N-bit input 2
    input [N-1:0] in1,        // N-bit input 1
    input [N-1:0] in0,        // N-bit input 0
    output reg [N-1:0] y      // N-bit output
);

    // N-bit 4-to-1 multiplexer using case structure
    always @(*) begin
        case (select)
            2'b11: y = in3;
            2'b10: y = in2;
            2'b01: y = in1;
            2'b00: y = in0;
            default: y = {N{1'b0}};
        endcase
    end

endmodule
