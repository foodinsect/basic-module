module ALU_4bit_74181 (
    input [3:0] A, 
    input [3:0] B,
    input [3:0] S,        // Select lines
    input M,              // Mode select (0: Arithmetic, 1: Logical)
    input Cn,             // Carry in

    output reg [3:0] F,   // 4-bit output F
    output reg P,         // Carry propagate
    output reg G,         // Carry generate
    output reg Cn_out,    // Carry out (Cn + 4)
    output reg A_eq_B     // A equals B
);

    reg [4:0] result;

    // Multiplexer for selecting the output based on S
    always @(*) begin
        // Active High
        if (Cn == 1'b1) begin
            // Logical
            if (M == 1'b1) begin
                case (S)
                    4'b0000: result = ~A;            // A'
                    4'b0001: result = ~(A | B);      // (A + B)'
                    4'b0010: result = ~A & B;        // A'B
                    4'b0011: result = 4'b0000;       // Logical 0
                    4'b0100: result = ~A & ~B;       // A'B'
                    4'b0101: result = ~B;            // B'
                    4'b0110: result = A ^ B;         // A xor B
                    4'b0111: result = A & ~B;        // AB'
                    4'b1000: result = ~A | B;        // A' + B
                    4'b1001: result = ~(A ^ B);      // (A xor B)'
                    4'b1010: result = B;             // B
                    4'b1011: result = A & B;         // AB
                    4'b1100: result = 4'b1111;       // Logical 1
                    4'b1101: result = A | ~B;        // A + B'
                    4'b1110: result = A | B;         // A + B
                    4'b1111: result = A;             // A
                default: result = 4'b0000;
                endcase
            end
            // Arithmetic
            else begin
                case (S)
                    4'b0000: result = A;                         // A
                    4'b0001: result = A | B;                     // A + B
                    4'b0010: result = A | ~B;                    // A + B'
                    4'b0011: result = -1;                        // minus 1
                    4'b0100: result = A + (A & ~B);              // A plus AB'
                    4'b0101: result = (A | B) + (A & ~B);        // (A + B) plus AB'
                    4'b0110: result = A - B - 1;                 // A minus B minus 1
                    4'b0111: result = (A & B) - 1;               // AB minus 1
                    4'b1000: result = A + (A & B);               // A plus AB
                    4'b1001: result = A + B;                     // A plus B
                    4'b1010: result = (A | ~B) + (A & B);        // (A + B') plus AB
                    4'b1011: result = (A & B) - 1;               // AB minus 1
                    4'b1100: result = A + ~A;                    // A plus A*
                    4'b1101: result = (A | B) + A;               // (A + B) plus A
                    4'b1110: result = (A | ~B) + A;              // (A + B') plus A
                    4'b1111: result = A - 1;                     // A minus 1
                default: result = 4'b0000;
                endcase
            end
        end
        // Active Low
        else begin
            // Logical
            if (M == 1'b1) begin
                case (S)
                    4'b0000: result = ~A;            // A'
                    4'b0001: result = ~(A & B);      // A'B'
                    4'b0010: result = ~A | B;        // A'+ B
                    4'b0011: result = 4'b1111;       // Logical 1
                    4'b0100: result = ~(A | B);      // (A + B)'
                    4'b0101: result = ~B;            // B'
                    4'b0110: result = ~(A ^ B);      // (A xor B)'
                    4'b0111: result = A | ~B;        // A + B'
                    4'b1000: result = ~A & B;        // A'B
                    4'b1001: result = ~(A ^ B);      // (A xor B)'
                    4'b1010: result = B;             // B
                    4'b1011: result = A | B;         // A + B
                    4'b1100: result = 4'b0000;       // Logical 0
                    4'b1101: result = A & ~B;        // AB'
                    4'b1110: result = A & B;         // AB
                    4'b1111: result = A;             // A
                default: result = 4'b0000;
                endcase
            end
            // Arithmetic
            else begin
                case (S)
                    4'b0000: result = A - 1;                 // A minus 1
                    4'b0001: result = (A & B) - 1;           // AB minus 1
                    4'b0010: result = (A & ~B) - 1;          // AB' minus 1
                    4'b0011: result = -1;                    // minus 1
                    4'b0100: result = A + (A | ~B);          // A plus (A + B')
                    4'b0101: result = (A & B) + (A | ~B);    // AB plus (A + B')
                    4'b0110: result = A - B - 1;             // A minus B minus 1
                    4'b0111: result = A | ~B;                // A + B'
                    4'b1000: result = A + (A | B);           // A plus (A+B)
                    4'b1001: result = A + B;                 // A plus B
                    4'b1010: result = (A & ~B) & (A + B);    // AB' (A+B)
                    4'b1011: result = A | B;                 // A + B
                    4'b1100: result = A + ~A;                // A plus A*
                    4'b1101: result = (A & B) + A;           // AB plus A
                    4'b1110: result = (A & ~B) + A;          // AB' plus A
                    4'b1111: result = A;                     // A
                default: result = 4'b0000;
                endcase
            end
        end

        // Assign the final results
        F = result[3:0];     // Assign lower 4 bits of the result to F
        Cn_out = result[4];  // Assign the 5th bit of the result to carry out (Cn + 4)

        // Calculate carry propagate and carry generate
        P = (A | B); // Carry propagate
        G = (A & B); // Carry generate

        // A equals B logic
        A_eq_B = (A == B); // A equals B
    end

endmodule
