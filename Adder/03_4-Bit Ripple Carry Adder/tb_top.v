`timescale 1ns / 1ps

module tb_top();
reg [3:0] a, b;
reg c_in;
wire [3:0] sum;
wire c_out;

// 'top' 모듈 인스턴스 생성
ripple_carry_adder_4bit uut (
    .a(a), 
    .b(b), 
    .c_in(c_in), 
    .sum(sum), 
    .c_out(c_out)
);

initial begin
    // 초기 입력값 설정
    a = 4'b0000;
    b = 4'b0000;
    c_in = 1'b0;    
    #10; // 10ns 동안 대기
    
    // 새로운 값으로 입력 변경
    a = 4'b0101; // 5
    b = 4'b0011; // 3
    c_in = 1'b0;
    #10; // 다시 10ns 동안 대기

    // 또 다른 값으로 입력 변경
    a = 4'b1010; // 10
    b = 4'b0101; // 5
    c_in = 1'b1;
    #10;
    
    // 시뮬레이션 종료
    $finish;
end


endmodule
