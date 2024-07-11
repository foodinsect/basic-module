`timescale 1ns / 1ps

module tb_2_to_1_mux;
    // Inputs
    reg in0, in1, control;
    reg x, y, s;

    // Outputs
    wire out_modeling, out_tristate;

    // Instantiate the modeling 2-to-1 multiplexer
    modeling_2_to_1_mux uut_modeling (
        .in0(in0),
        .in1(in1),
        .control(control),
        .out(out_modeling)
    );

    // Instantiate the tristate 2-to-1 multiplexer
    tristate_2_to_1_mux uut_tristate (
        .x(x),
        .y(y),
        .s(s),
        .f(out_tristate)
    );

    initial begin
        // Initialize Inputs
        in0 = 0; in1 = 0; control = 0;
        x = 0; y = 0; s = 0;

        // Wait 100 ns for global reset to finish
        #100;

        // Add stimulus here
        // Test case 1
        in0 = 0; in1 = 1; control = 0; x = 0; y = 1; s = 0; #10;
        $display("Test case 1: in0=%b, in1=%b, control=%b, x=%b, y=%b, s=%b, out_modeling=%b, out_tristate=%b", in0, in1, control, x, y, s, out_modeling, out_tristate);

        // Test case 2
        in0 = 0; in1 = 1; control = 1; x = 0; y = 1; s = 1; #10;
        $display("Test case 2: in0=%b, in1=%b, control=%b, x=%b, y=%b, s=%b, out_modeling=%b, out_tristate=%b", in0, in1, control, x, y, s, out_modeling, out_tristate);

        // Test case 3
        in0 = 1; in1 = 0; control = 0; x = 1; y = 0; s = 0; #10;
        $display("Test case 3: in0=%b, in1=%b, control=%b, x=%b, y=%b, s=%b, out_modeling=%b, out_tristate=%b", in0, in1, control, x, y, s, out_modeling, out_tristate);

        // Test case 4
        in0 = 1; in1 = 0; control = 1; x = 1; y = 0; s = 1; #10;
        $display("Test case 4: in0=%b, in1=%b, control=%b, x=%b, y=%b, s=%b, out_modeling=%b, out_tristate=%b", in0, in1, control, x, y, s, out_modeling, out_tristate);

        // Test case 5
        in0 = 1; in1 = 1; control = 0; x = 1; y = 1; s = 0; #10;
        $display("Test case 5: in0=%b, in1=%b, control=%b, x=%b, y=%b, s=%b, out_modeling=%b, out_tristate=%b", in0, in1, control, x, y, s, out_modeling, out_tristate);

        // Test case 6
        in0 = 1; in1 = 1; control = 1; x = 1; y = 1; s = 1; #10;
        $display("Test case 6: in0=%b, in1=%b, control=%b, x=%b, y=%b, s=%b, out_modeling=%b, out_tristate=%b", in0, in1, control, x, y, s, out_modeling, out_tristate);

        // Finish simulation
        $finish;
    end
      
endmodule
