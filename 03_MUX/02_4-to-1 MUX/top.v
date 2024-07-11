`timescale 1ns / 1ps

module top(
    input [3:0] i, // 4-bit input for the muxes
    input [1:0] sel, // 2-bit selection input for the muxes
    output out_dataflow, // Output from the dataflow mux
    output out_behavioral, // Output from the behavioral mux
    output out_operators,
    output out_structural, // Output from the structural mux
    output out_if_else,    // Output from the if-else mux
    output out_modeling,   // Output from the modeling mux
    output out_nesting,    // Output from the nesting mux
    output out_tristate_2,  // Output from the 2-to-1 tristate mux
    output out_tristate_4 // Output from the 4-to-1 tristate mux
);

    // Instantiate the dataflow mux
    mux_4_to_1_dataflow mux_dataflow_instance(
        .in(i),
        .sel(sel),
        .out(out_dataflow)
    );

    // Instantiate the behavioral mux
    mux_4_to_1_behavioral mux_behavioral_instance(
        .in(i),
        .sel(sel),
        .out(out_behavioral)
    );

    // Instantiate the structural mux
    mux_4_to_1_structural mux_structural_instance(
        .i0(i[0]),
        .i1(i[1]),
        .i2(i[2]),
        .i3(i[3]),
        .s1(sel[1]),
        .s0(sel[0]),
        .out(out_structural)
    );
    
    mux_4_to_1_using_operators mux_using_operators(
        .i0(i[0]),
        .i1(i[1]),
        .i2(i[2]),
        .i3(i[3]),
        .s1(sel[1]),
        .s0(sel[0]),
        .out(out_operators)
    );
    
    // Instantiate the if_else_4_to_1_mux
    if_else_4_to_1_mux if_else_4_to_1_mux_instance(
        .i0(i[0]),
        .i1(i[1]),
        .i2(i[2]),
        .i3(i[3]),
        .s0(sel[0]),
        .s1(sel[1]),
        .out(out_if_else)
    );

    // Instantiate the modeling_2_to_1_mux
    modeling_2_to_1_mux modeling_2_to_1_mux_instance(
        .in0(i[0]),
        .in1(i[1]),
        .control(sel[0]),
        .out(out_modeling)
    );

    // Instantiate the nesting_4_to_1_mux
    nesting_4_to_1_mux nesting_4_to_1_mux_instance(
        .i0(i[0]),
        .i1(i[1]),
        .i2(i[2]),
        .i3(i[3]),
        .s0(sel[0]),
        .s1(sel[1]),
        .out(out_nesting)
    );
    
    // Instantiate the tristate_2_to_1_mux
    tristate_2_to_1_mux tristate_2_to_1_mux_instance(
        .x(i[0]),
        .y(i[1]),
        .s(sel[0]),
        .f(out_tristate_2)
    );
    
    // Instantiate the tristate_4_to_1_mux
    tristate_4_to_1_mux tristate_4_to_1_mux_instance(
        .in(i),
        .sel(sel),
        .f(out_tristate_4)
    );

endmodule
