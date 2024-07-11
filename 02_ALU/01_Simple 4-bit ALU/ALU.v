
module ALU(
    input wire [3:0] a,          // First operand
    input wire [3:0] b,          // Second operand
    input wire [2:0] op_code,    // Operation code
    output reg [3:0] result,     // Result of the ALU operation
    output reg carry_out         // Carry out for addition and subtraction
);

    always @(*) begin
        case (op_code)
            3'b000: {carry_out, result} = a + b;                // Addition
            3'b001: {carry_out, result} = a - b;                // Subtraction
            3'b010: result  = a & b;                            // AND
            3'b011: result  = a | b;                            // OR
            3'b100: result  = a ^ b;                            // XOR
            3'b101: result  = ~a;                               // NOT (negate a)
            3'b110: result  = a << 1;                           // Left Shift
            3'b111: result  = a >> 1;                           // Right Shift
            default: result = 4'b0000;                          // Default case
        endcase
    end

endmodule
