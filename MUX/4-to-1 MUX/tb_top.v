`timescale 1ns / 1ps


module tb_top();
reg [3:0] i; // 4-bit input for the muxes
reg [1:0] sel; // 2-bit selection input for the muxes
wire out_dataflow; // Output from the dataflow mux
wire out_behavioral; // Output from the behavioral mux
wire out_operators;
wire out_structural; // Output from the structural mux
integer index;
integer sel_index;

// Instantiate the top_module
top uut(
    .i(i),
    .sel(sel),
    .out_dataflow(out_dataflow),
    .out_behavioral(out_behavioral),
    .out_operators(out_operators),
    .out_structural(out_structural)
);

initial begin
    // Initialize Inputs
    i = 0;
    sel = 0;

    // Wait for global reset
    #100;

    // Add stimulus here
    // Test all possible input combinations
    for (index = 0; index < 16; index = index + 1) begin
        i = index; // Binary count for input i
        for (sel_index = 0; sel_index < 4; sel_index = sel_index + 1) begin
            sel = sel_index; // Binary count for selector
            #10; // Wait for the MUX to settle
            // Check if all MUX outputs are equal
            if ((out_dataflow !== out_behavioral) || (out_dataflow !== out_operators) || (out_dataflow !== out_structural)) begin
                $display("Mismatch found: i=%b, sel=%b", i, sel);
                $display("Dataflow: %b, Behavioral: %b, Operators: %b, Structural: %b", out_dataflow, out_behavioral, out_operators, out_structural);
            end
            #10; // Wait before changing inputs again
        end
    end
    
    // Finish the simulation
    $finish;
end

endmodule
