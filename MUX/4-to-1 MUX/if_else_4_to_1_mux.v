module if_else_4_to_1_mux(
    input wire i0,    // Input signal 0
    input wire i1,    // Input signal 1
    input wire i2,    // Input signal 2
    input wire i3,    // Input signal 3
    input wire s0,    // Select signal 0
    input wire s1,    // Select signal 1
    output reg out    // Output signal
    );

    // 4-to-1 multiplexer using if...else statements
    always @(*) begin
        if (s1) begin
            if (s0)  out = i3;  // When s1 = 1 and s0 = 1, out = i3
            else    out = i2;   // When s1 = 1 and s0 = 0, out = i2
        end else begin
            if (s0)  out = i1;  // When s1 = 0 and s0 = 1, out = i1
            else    out = i0;   // When s1 = 0 and s0 = 0, out = i0
        end
    end

endmodule
