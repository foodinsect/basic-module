`timescale 1ns / 1ps

module tb_top;

    // 테스트 벤치의 신호 선언
    reg clk;
    reg enable;
    reg reset;
    reg clear;
    wire cout;
    wire [3:0] qout1;
    wire [3:0] qout2;
    wire [3:0] qout3;

    // top 모듈 인스턴스화
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

    // 시계 신호 생성
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns 주기
    end

    // 테스트 벡터
    initial begin
        // 초기값 설정
        enable = 0;
        reset = 1;
        clear = 1;
        
        // 초기화 후 20ns 대기
        #20;
        
        // 리셋 해제
        reset = 0;
        clear = 0;
        
        // enable 활성화 후 100ns 대기
        enable = 1;
        #100;
        
        // enable 비활성화 후 50ns 대기
        enable = 0;
        #50;
        
        // 리셋 활성화 후 20ns 대기
        reset = 1;
        #20;
        
        // 리셋 해제 및 enable 활성화
        reset = 0;
        enable = 1;
        #100;

        // 테스트 종료
        $finish;
    end

endmodule

