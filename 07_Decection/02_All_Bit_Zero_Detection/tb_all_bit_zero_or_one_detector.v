`timescale 1ns / 10ps

module tb_all_bit_zero_or_one_detector;

    reg [7:0] x; // 8-bit input
    wire zero;    // Output indicating all bits of x are zero
    wire one;     // Output indicating all bits of x are one
    
    wire zero_reduction;    // Output indicating all bits of x are  (reduction module)
    wire one_reduction;     // Output indicating all bits of x are one  (reduction module)

    // Instantiate the unit under test (UUT)
    all_bit_zero_or_one_detector uut (
        .x(x),
        .zero(zero),
        .one(one)
    );
    
     // Instantiate the unit under test (UUT)
    all_bit_zero_or_one_detector_reduction uut_2 (
        .x(x),
        .zero(zero_reduction),
        .one(one_reduction)
    );

    // Stimulus process
    initial begin
        // Initialize Inputs
        x = 0; #10; // All zeros
        if (zero !== 1 || one !== 0) begin
            $display("Test Failed for all 0s: Zero: %b, One: %b", zero, one);
        end
        
        x = 8'b11111111; #10; // All ones
        if (zero !== 0 || one !== 1) begin
            $display("Test Failed for all 1s: Zero: %b, One: %b", zero, one);
        end
        
        x = 8'b10101010; #10; // Mixed
        if (zero !== 0 || one !== 0) begin
            $display("Test Failed for mixed: Zero: %b, One: %b", zero, one);
        end
        
        x = 8'b01111111; #10; // One zero
        if (zero !== 0 || one !== 0) begin
            $display("Test Failed for one 0: Zero: %b, One: %b", zero, one);
        end

        x = 8'b11111110; #10; // One one
        if (zero !== 0 || one !== 0) begin
            $display("Test Failed for one 1: Zero: %b, One: %b", zero, one);
        end

        // Add more test cases if needed...

        // Complete the simulation
        $finish;
    end
      
endmodule