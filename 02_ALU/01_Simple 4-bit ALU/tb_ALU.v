`timescale 1ns / 1ps

module tb_ALU();
    // Inputs
    reg [3:0] a;
    reg [3:0] b;
    reg [2:0] op_code;

    // Outputs
    wire [3:0] result;
    wire carry_out;

    // Instantiate the ALU
    ALU uut (
        .a(a),
        .b(b),
        .op_code(op_code),
        .result(result),
        .carry_out(carry_out)
    );

    // Initial block to apply test vectors
    initial begin
        // Monitor outputs
        $monitor("Time: %0d, a: %b, b: %b, op_code: %b, result: %b, carry_out: %b", $time, a, b, op_code, result, carry_out);

        // Test Addition
        a = 4'b0011; b = 4'b0101; op_code = 3'b000; // 3 + 5
        #10;
        
        // Test Subtraction
        a = 4'b1001; b = 4'b0011; op_code = 3'b001; // 9 - 3
        #10;

        // Test AND
        a = 4'b1100; b = 4'b1010; op_code = 3'b010; // 12 AND 10
        #10;

        // Test OR
        a = 4'b1100; b = 4'b1010; op_code = 3'b011; // 12 OR 10
        #10;

        // Test XOR
        a = 4'b1100; b = 4'b1010; op_code = 3'b100; // 12 XOR 10
        #10;

        // Test NOT
        a = 4'b1100; op_code = 3'b101; // NOT 12
        #10;

        // Test Left Shift
        a = 4'b0011; op_code = 3'b110; // 3 << 1
        #10;

        // Test Right Shift
        a = 4'b1100; op_code = 3'b111; // 12 >> 1
        #10;

        // End simulation
        $finish;
    end

endmodule
