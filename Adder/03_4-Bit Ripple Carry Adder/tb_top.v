`timescale 1ns / 1ps

module tb_top();
reg [3:0] a, b;
reg c_in;
wire [3:0] sum;
wire c_out;

// 'top' ��� �ν��Ͻ� ����
ripple_carry_adder_4bit uut (
    .a(a), 
    .b(b), 
    .c_in(c_in), 
    .sum(sum), 
    .c_out(c_out)
);

initial begin
    // �ʱ� �Է°� ����
    a = 4'b0000;
    b = 4'b0000;
    c_in = 1'b0;    
    #10; // 10ns ���� ���
    
    // ���ο� ������ �Է� ����
    a = 4'b0101; // 5
    b = 4'b0011; // 3
    c_in = 1'b0;
    #10; // �ٽ� 10ns ���� ���

    // �� �ٸ� ������ �Է� ����
    a = 4'b1010; // 10
    b = 4'b0101; // 5
    c_in = 1'b1;
    #10;
    
    // �ùķ��̼� ����
    $finish;
end


endmodule
