module parity_gen_9b_behavioral(
    input   wire [8:0]  x,
    output  reg         ep,
    output  reg         op
    );
    
    always @(*) begin
        ep = x[0] ^ x[1] ^ x[2] ^ x[3] ^ x[4] ^ x[5] ^ x[6] ^ x[7] ^ x[8];
        // ep = ^x;
        
        op = ~ep;
    end
    
endmodule
