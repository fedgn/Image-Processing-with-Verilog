`timescale 1ns / 1ps

module MULTB
(
    input [7:0] A,
    input [7:0] B,
    output reg [15:0] result
);
    
    reg [7:0] B_neg;
    
    always @ *
    begin
        if(B[7] == 1) begin
            B_neg = (~B + 1'b1);
            result = ~(A * B_neg) + 1'b1;
        end
        else
            result = A * B;   
    end

endmodule
