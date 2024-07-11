module modeling_2_to_1_mux(
    input wire in0,    // Input signal 0
    input wire in1,    // Input signal 1
    input wire control, // Control (select) signal
    output wire out    // Output signal
    );

    // 2-to-1 multiplexer using conditional operator
    assign out = control ? in1 : in0; // If control is 1, out = in1; if control is 0, out = in0

endmodule
