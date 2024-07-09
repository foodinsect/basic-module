module tristate_4_to_1_mux(
    input wire [3:0] in,    // 4 input signals
    input wire [1:0] sel,   // 2-bit select signal
    output wire f           // output signal
    );
    // Define enable signals
    wire [3:0] enable;
    
    // Generate enable signals based on the select signal
    assign enable = 4'b0001 << sel;  // Activate one enable signal based on the select signal
    
    /*
    // Define individual enable signals
    wire enable0, enable1, enable2, enable3;
    
    // Generate enable signals based on the select signal
    assign enable0 = (sel == 2'b00);  // Activate enable0 if sel is 00
    assign enable1 = (sel == 2'b01);  // Activate enable1 if sel is 01
    assign enable2 = (sel == 2'b10);  // Activate enable2 if sel is 10
    assign enable3 = (sel == 2'b11);  // Activate enable3 if sel is 11
    */
    
    // Tristate 4-to-1 mux
    bufif1 b0 (f, in[0], enable[0]);  // Input 0 (s1s0 : 00)
    bufif1 b1 (f, in[1], enable[1]);  // Input 1 (s1s0 : 01)
    bufif1 b2 (f, in[2], enable[2]);  // Input 2 (s1s0 : 10)
    bufif1 b3 (f, in[3], enable[3]);  // Input 3 (s1s0 : 11)

endmodule
