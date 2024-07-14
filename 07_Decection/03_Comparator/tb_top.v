`timescale 1ns / 1ps
module tb_top;

    parameter N = 4;

    reg [N-1:0] a, b;
    reg Iagtb, Iaeqb, Ialtb;
    wire cgt, clt, ceq;
    wire Oagtb, Oaeqb, Oaltb;

    // Instantiate the top module
    top #(N) uut (
        .a(a),
        .b(b),
        .Iagtb(Iagtb),
        .Iaeqb(Iaeqb),
        .Ialtb(Ialtb),
        .cgt(cgt),
        .clt(clt),
        .ceq(ceq),
        .Oagtb(Oagtb),
        .Oaeqb(Oaeqb),
        .Oaltb(Oaltb)
    );

    // Testbench logic
    initial begin
        // Initialize inputs
        a = 0;
        b = 0;
        Iagtb = 0;
        Iaeqb = 0;
        Ialtb = 0;

        // Apply test vectors
        #10 a = 4'b0010; b = 4'b0001; Iagtb = 0; Iaeqb = 0; Ialtb = 0; // a > b
        #10 a = 4'b0001; b = 4'b0010; Iagtb = 0; Iaeqb = 0; Ialtb = 0; // a < b
        #10 a = 4'b0011; b = 4'b0011; Iagtb = 0; Iaeqb = 0; Ialtb = 0; // a == b
        #10 Iagtb = 1; Iaeqb = 1; Ialtb = 1;
        #10 a = 4'b0100; b = 4'b0100; // a == b with inputs set
        #10 a = 4'b0110; b = 4'b0101; // a > b with inputs set
        #10 a = 4'b0100; b = 4'b0110; // a < b with inputs set

        // Add more test cases as needed
        #10 $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0d a=%b b=%b cgt=%b clt=%b ceq=%b Oagtb=%b Oaeqb=%b Oaltb=%b",
                 $time, a, b, cgt, clt, ceq, Oagtb, Oaeqb, Oaltb);
    end

endmodule

