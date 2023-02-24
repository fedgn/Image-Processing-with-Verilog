`timescale 1ns / 1ps

module CONV128
(
    input clk,
    input reset,
    input [1039:0] data,
    input [23:0] weight,
    output [1023:0] result
);
    wire [7:0] result_vec [127:0];
    
    genvar i;
    generate
    begin
        for(i = 0; i < 128; i = i + 1)
        begin
            CONV CONV(clk, reset, data[23 + i*8 : 0 + i*8], weight, result_vec[i][7:0]);
            assign result[7 + i*8 : 0 + i*8] = result_vec[i];
        end
    end
    endgenerate

endmodule
