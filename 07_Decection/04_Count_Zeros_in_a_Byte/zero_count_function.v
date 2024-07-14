`timescale 1ns / 1ps

module zero_count_function(
    input wire  [7:0]   data,
    output reg  [3:0]   out
);
    
    always @(*)
        out = count_zeros_in_byte(data);
     
    function [3:0] count_zeros_in_byte;
        input [7:0] data;
        integer i;
        begin 
            count_zeros_in_byte = 0;
            for (i = 0; i <= 7; i = i + 1)
                if (data[i] == 0) 
                    count_zeros_in_byte = count_zeros_in_byte + 1;
        end
    endfunction
    
endmodule
