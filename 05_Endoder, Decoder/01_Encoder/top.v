module top (
    input [7:0] in_8_to_3,
    input [3:0] in_4_to_2,
    input [3:0] in_priority_4_to_2,
    input [7:0] in_priority_8_to_3,
    output [2:0] out_8_to_3,
    output [1:0] out_4_to_2_case,
    output [1:0] out_4_to_2_if_else,
    output [1:0] out_priority_4_to_2_case,
    output [1:0] out_priority_4_to_2_if_else,
    output [2:0] out_priority_8_to_3
);

// Instantiating the 8-to-3 Encoder
encoder_8_to_3 u_encoder_8_to_3 (
    .in(in_8_to_3),
    .out(out_8_to_3)
);

// Instantiating the 4-to-2 Encoder using case statement
encoder_4_to_2_case u_encoder_4_to_2_case (
    .in(in_4_to_2),
    .y(out_4_to_2_case)
);

// Instantiating the 4-to-2 Encoder using if-else statement
encoder_4_to_2_if_else u_encoder_4_to_2_if_else (
    .in(in_4_to_2),
    .y(out_4_to_2_if_else)
);

// Instantiating the 4-to-2 Priority Encoder using case statement
priority_encoder_4_to_2_casex u_priority_encoder_4_to_2_case (
    .in(in_priority_4_to_2),
    .y(out_priority_4_to_2_case)
);

// Instantiating the 4-to-2 Priority Encoder using if-else statement
priority_encoder_4_to_2_if_else u_priority_encoder_4_to_2_if_else (
    .in(in_priority_4_to_2),
    .y(out_priority_4_to_2_if_else)
);

// Instantiating the 8-to-3 Priority Encoder
priority_encoder_8_to_3 u_priority_encoder_8_to_3 (
    .in(in_priority_8_to_3),
    .out(out_priority_8_to_3)
);

endmodule
