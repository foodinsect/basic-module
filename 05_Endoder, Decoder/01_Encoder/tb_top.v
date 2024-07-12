`timescale 1ns / 1ps

module tb_top;

// Inputs
reg [7:0] in_8_to_3;
reg [3:0] in_4_to_2;
reg [3:0] in_priority_4_to_2;
reg [7:0] in_priority_8_to_3;

// Outputs
wire [2:0] out_8_to_3;
wire [1:0] out_4_to_2_case;
wire [1:0] out_4_to_2_if_else;
wire [1:0] out_priority_4_to_2_case;
wire [1:0] out_priority_4_to_2_if_else;
wire [2:0] out_priority_8_to_3;

// Instantiate the Unit Under Test (UUT)
top uut (
    .in_8_to_3(in_8_to_3),
    .in_4_to_2(in_4_to_2),
    .in_priority_4_to_2(in_priority_4_to_2),
    .in_priority_8_to_3(in_priority_8_to_3),
    .out_8_to_3(out_8_to_3),
    .out_4_to_2_case(out_4_to_2_case),
    .out_4_to_2_if_else(out_4_to_2_if_else),
    .out_priority_4_to_2_case(out_priority_4_to_2_case),
    .out_priority_4_to_2_if_else(out_priority_4_to_2_if_else),
    .out_priority_8_to_3(out_priority_8_to_3)
);

initial begin
    // Initialize Inputs
    in_8_to_3 = 0;
    in_4_to_2 = 0;
    in_priority_4_to_2 = 0;
    in_priority_8_to_3 = 0;

    // Wait 100 ns for global reset to finish
    #10;
        
    // Add stimulus here

    // Test case 1
    in_8_to_3 = 8'b00000001;
    in_4_to_2 = 4'b0001;
    in_priority_4_to_2 = 4'b0001;
    in_priority_8_to_3 = 8'b00000001;
    #10;
    
    // Test case 2
    in_8_to_3 = 8'b00000010;
    in_4_to_2 = 4'b0010;
    in_priority_4_to_2 = 4'b0010;
    in_priority_8_to_3 = 8'b00000010;
    #10;

    // Test case 3
    in_8_to_3 = 8'b00000100;
    in_4_to_2 = 4'b0100;
    in_priority_4_to_2 = 4'b0100;
    in_priority_8_to_3 = 8'b00000100;
    #10;

    // Test case 4
    in_8_to_3 = 8'b00001000;
    in_4_to_2 = 4'b1000;
    in_priority_4_to_2 = 4'b1000;
    in_priority_8_to_3 = 8'b00001000;
    #10;

    // Test case 5
    in_8_to_3 = 8'b00010000;
    in_4_to_2 = 4'b0011;
    in_priority_4_to_2 = 4'b0011;
    in_priority_8_to_3 = 8'b00010000;
    #10;

    // Test case 6
    in_8_to_3 = 8'b00100000;
    in_4_to_2 = 4'b0110;
    in_priority_4_to_2 = 4'b0110;
    in_priority_8_to_3 = 8'b00100000;
    #10;

    // Test case 7
    in_8_to_3 = 8'b01000000;
    in_4_to_2 = 4'b1100;
    in_priority_4_to_2 = 4'b1100;
    in_priority_8_to_3 = 8'b01000000;
    #10;

    // Test case 8
    in_8_to_3 = 8'b10000000;
    in_4_to_2 = 4'b1111;
    in_priority_4_to_2 = 4'b1111;
    in_priority_8_to_3 = 8'b10000000;
    #10;


    $stop;
end

endmodule

