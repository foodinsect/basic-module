module top(
    input wire clk,
    input wire enable,
    input wire reset,
    input wire clear,
    output wire cout,
    output wire [3:0] qout1,
    output wire [3:0] qout2,
    output wire [3:0] qout3
);

    // �ν��Ͻ�ȭ�� counter_4bit ���
    counter_4bit cnt_4bit (
        .clk(clk),
        .clear(clear),
        .qout(qout1)
    );
    
    // �ν��Ͻ�ȭ�� �� ��° binary_counter ���
    counter_nbit #(.N(4)) cnt_nbit (
        .clock(clk),
        .clear(clear),
        .qout(qout2)
    );
    
        // �ν��Ͻ�ȭ�� ù ��° binary_counter ���
    binary_counter #(.N(4)) binary_cnt (
        .clk(clk),
        .enable(enable),
        .reset(reset),
        .cout(cout),
        .qout(qout3)
    );


endmodule
