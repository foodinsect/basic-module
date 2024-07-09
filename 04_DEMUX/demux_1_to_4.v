`timescale 1ns / 1ps

module demux_1_to_4(
    input in, s1, s0,
    output reg out0, out1, out2, out3
    );
    
    always @(*) begin
        case ({s1, s0})
            2'b00 : begin out0 = in; out1 = 1'bz; out2 = 1'bz; out3 = 1'bz; end
            2'b01 : begin out0 = 1'bz; out1 = in; out2 = 1'bz; out3 = 1'bz; end
            2'b10 : begin out0 = 1'bz; out1 = 1'bz; out2 = in; out3 = 1'bz; end
            2'b11 : begin out0 = 1'bz; out1 = 1'bz; out2 = 1'bz; out3 = in; end
            'bx00, 'bx01, 'bxz, 'bx0x, 'bx1x, 'bxzx : 
                   begin out0 = 1'bx; out1 = 1'bx; out2 = 1'bx; out3 = 1'bx; end
            'bz00, 'bz01, 'bzz, 'bz0z, 'bz1z : 
                   begin out0 = 1'bz; out1 = 1'bz; out2 = 1'bz; out3 = 1'bz; end
            default : $display("Unspecified control signals");
        endcase
    end
endmodule
