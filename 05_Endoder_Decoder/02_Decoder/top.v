module top (
    input [1:0] in_2_to_4,
    input [2:0] in_3_to_8,
    output [3:0] out_2_to_4_active_high,
    output [3:0] out_2_to_4_active_low,
    output [7:0] out_3_to_8_active_high,
    output [7:0] out_3_to_8_active_low
);

// Instantiating the 2-to-4 Decoder (Active High)
decoder_2_to_4_active_high u_decoder_2_to_4_active_high (
    .x(in_2_to_4),
    .y(out_2_to_4_active_high)
);

// Instantiating the 2-to-4 Decoder (Active Low)
decoder_2_to_4_active_low u_decoder_2_to_4_active_low (
    .x(in_2_to_4),
    .y(out_2_to_4_active_low)
);

// Instantiating the 3-to-8 Decoder (Active High)
decoder_3_to_8_active_high u_decoder_3_to_8_active_high (
    .x(in_3_to_8),
    .y(out_3_to_8_active_high)
);

// Instantiating the 3-to-8 Decoder (Active Low)
decoder_3_to_8_active_low u_decoder_3_to_8_active_low (
    .x(in_3_to_8),
    .y(out_3_to_8_active_low)
);

endmodule
