module N_Bit_4_to_1_MUX_with_enable_control #(
    parameter N = 4 // Default width is 4 bits
)(
    input [1:0] select,       // 2-bit select signal
    input enable,             // Enable signal
    input [N-1:0] in3,        // N-bit input 3
    input [N-1:0] in2,        // N-bit input 2
    input [N-1:0] in1,        // N-bit input 1
    input [N-1:0] in0,        // N-bit input 0
    output reg [N-1:0] y      // N-bit output
);

    // N-bit 4-to-1 multiplexer with enable control
    always @(*) begin
        if (!enable)
            y = {N{1'b0}}; // Output zero when enable is low
        else
            y = select[1] ? 
                (select[0] ? in3 : in2) : 
                (select[0] ? in1 : in0);
    end

endmodule
