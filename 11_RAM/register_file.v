// an N-word register file with one-write and two-read ports
module register_file #(
    parameter M = 4,    // number of address bits
    parameter N = 16,   // number of words, N = 2^M
    parameter W = 8     // number of bits in a word 
)(
    input wire              clk,
    input wire              wr_enable,
    input wire  [W-1:0]     din,
    input wire  [M-1:0]     rd_addra,
    input wire  [M-1:0]     rd_addrb,
    input wire  [M-1:0]     wr_addr,
    
    output wire [W-1:0]     douta,
    output wire [W-1:0]     doutb
);

    // Register file memory
    reg [W-1:0] reg_file [N-1:0];

    // Read ports
    assign douta = reg_file[rd_addra];
    assign doutb = reg_file[rd_addrb];

    // Write port
    always @(posedge clk) begin
        if (wr_enable) begin
            reg_file[wr_addr] <= din;
        end
    end
endmodule
