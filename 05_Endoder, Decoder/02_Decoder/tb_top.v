`timescale 1ns / 1ps

`timescale 1ns / 1ps

module tb_top;

// Inputs
reg [1:0] in_2_to_4;
reg [2:0] in_3_to_8;

// Outputs
wire [3:0] out_2_to_4_active_high;
wire [3:0] out_2_to_4_active_low;
wire [7:0] out_3_to_8_active_high;
wire [7:0] out_3_to_8_active_low;

// Instantiate the Unit Under Test (UUT)
top uut (
    .in_2_to_4(in_2_to_4),
    .in_3_to_8(in_3_to_8),
    .out_2_to_4_active_high(out_2_to_4_active_high),
    .out_2_to_4_active_low(out_2_to_4_active_low),
    .out_3_to_8_active_high(out_3_to_8_active_high),
    .out_3_to_8_active_low(out_3_to_8_active_low)
);

initial begin
    // Initialize Inputs
    in_2_to_4 = 0;
    in_3_to_8 = 0;

    // Wait 100 ns for global reset to finish
    #10;
        
    // Add stimulus here

    // Test case 1: 2-to-4 Decoder
    in_2_to_4 = 2'b00; #10;
    in_2_to_4 = 2'b01; #10;
    in_2_to_4 = 2'b10; #10;
    in_2_to_4 = 2'b11; #10;

    // Test case 2: 3-to-8 Decoder
    in_3_to_8 = 3'b000; #10;
    in_3_to_8 = 3'b001; #10;
    in_3_to_8 = 3'b010; #10;
    in_3_to_8 = 3'b011; #10;
    in_3_to_8 = 3'b100; #10;
    in_3_to_8 = 3'b101; #10;
    in_3_to_8 = 3'b110; #10;
    in_3_to_8 = 3'b111; #10;

    $stop;
end

endmodule
