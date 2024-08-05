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

    // 인스턴스화한 counter_4bit 모듈
    counter_4bit cnt_4bit (
        .clk(clk),
        .clear(clear),
        .qout(qout1)
    );
    
    // 인스턴스화한 두 번째 binary_counter 모듈
    counter_nbit #(.N(4)) cnt_nbit (
        .clock(clk),
        .clear(clear),
        .qout(qout2)
    );
    
        // 인스턴스화한 첫 번째 binary_counter 모듈
    binary_counter #(.N(4)) binary_cnt (
        .clk(clk),
        .enable(enable),
        .reset(reset),
        .cout(cout),
        .qout(qout3)
    );


endmodule
