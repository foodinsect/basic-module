// a synchronous RAM module example
module synchronous_Ram #(
    parameter N = 16,   // number of words
    parameter A = 4,    // number of address bits
    parameter W = 4     // number of wordsize in bits
)(
    input wire [A-1:0]  addr,
    input wire [W-1:0]  din,
    input wire          cs,
    input wire          wr,
    input wire          clk,

    output reg [W-1:0]  dout
);

    // Declare an N * W memory array
    reg [W-1:0] ram [N-1:0];

    // Synchronous read and write operations
    always @(posedge clk) begin
        if (cs) begin
            if (wr) 
                ram[addr] <= din; 
            else    
                dout <= ram[addr]; 
        end
    end
endmodule
