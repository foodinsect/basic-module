module ALU_4bit_74181 (
    input [3:0] A, 
    input [3:0] B,
    input [3:0] S,        // Select lines
    input M,              // 모드 선택 (0: 산술, 1: 논리)
    input Cn,             // 캐리 입력

    output reg [3:0] F,   // 4비트 출력 F
    output reg P,         // 캐리 전파
    output reg G,         // 캐리 생성
    output reg A_eq_B     // A와 B가 같은지 여부
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
                    4'b0100: result = A + (~A & ~B);             // A plus A'B'
                    4'b0101: result = (A | B) + (~A & ~B);       // (A + B) plus A'B'
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

        F = result[3:0];
        G = result[4];
    end

    // 캐리 전파는 산술 연산의 결과를 기준으로 설정합니다.
    always @(*) begin
        P = (F == 4'b1111); // 모든 비트가 1이면 캐리 전파
        A_eq_B = (A == B); // A와 B가 같은지 여부
    end

endmodule