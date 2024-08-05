`timescale 1ns / 1ps

module tb_top;

    // �׽�Ʈ ��ġ�� ��ȣ ����
    reg clk;
    reg enable;
    reg reset;
    reg clear;
    wire cout;
    wire [3:0] qout1;
    wire [3:0] qout2;
    wire [3:0] qout3;

    // top ��� �ν��Ͻ�ȭ
    top uut (
        .clk(clk),
        .enable(enable),
        .reset(reset),
        .clear(clear),
        .cout(cout),
        .qout1(qout1),
        .qout2(qout2),
        .qout3(qout3)
    );

    // �ð� ��ȣ ����
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns �ֱ�
    end

    // �׽�Ʈ ����
    initial begin
        // �ʱⰪ ����
        enable = 0;
        reset = 1;
        clear = 1;
        
        // �ʱ�ȭ �� 20ns ���
        #20;
        
        // ���� ����
        reset = 0;
        clear = 0;
        
        // enable Ȱ��ȭ �� 100ns ���
        enable = 1;
        #100;
        
        // enable ��Ȱ��ȭ �� 50ns ���
        enable = 0;
        #50;
        
        // ���� Ȱ��ȭ �� 20ns ���
        reset = 1;
        #20;
        
        // ���� ���� �� enable Ȱ��ȭ
        reset = 0;
        enable = 1;
        #100;

        // �׽�Ʈ ����
        $finish;
    end

endmodule

