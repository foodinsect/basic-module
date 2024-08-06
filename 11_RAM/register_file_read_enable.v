// an N-word register file with one-write and two-read ports with read_en
module register_file_read_en #(
    parameter M = 4,    // number of address bits
    parameter N = 16,   // number of words, N = 2^M
    parameter W = 8     // number of bits in a word 
)(
    input wire              clk,
    input wire              wr_enable,
    input wire              read_en_a,
    input wire              read_en_b,
    input wire  [W-1:0]     din,
    input wire  [M-1:0]     rd_addra,
    input wire  [M-1:0]     rd_addrb,
    input wire  [M-1:0]     wr_addr,
    
    output wire [W-1:0]     douta,
    output wire [W-1:0]     doutb
);
    
    // Register file memory
    reg [W-1:0] reg_file [N-1:0];

    // Read ports with enable
    assign douta = read_en_a ? reg_file[rd_addra] : {W{1'b0}};
    assign doutb = read_en_b ? reg_file[rd_addrb] : {W{1'b0}};

    // Write port
    always @(posedge clk) begin
        if (wr_enable) begin
            reg_file[wr_addr] <= din;
        end
    end
endmodule
