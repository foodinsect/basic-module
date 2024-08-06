module data_buffer #(
    parameter cycle = 8
)(
    input wire          data_start,
    input wire [15:0]   data,
    input wire          clock
);
    reg [15:0] buffer [0:cycle-1];
    integer i;

    always @(posedge clock) begin
        if (data_start) begin
            i = 0;
            repeat (cycle) begin
                @(posedge clock) buffer[i] <= data;
                i = i + 1; 
            end
        end
    end
endmodule
