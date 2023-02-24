`timescale 1ns / 1ps

module MAC
(
    input clk,
    input reset,
    input [23:0] data,
    input [23:0] weight,
    output reg [15:0] result
);

    wire [15:0] product [2:0];
    wire [15:0] sum [1:0];
    reg [1:0] count;

    MULTB MULT0(data[7:0], weight[7:0], product[0][15:0]);
    
    MULTB MULT1(data[15:8], weight[15:8], product[1][15:0]);
    
    MULTB MULT2(data[23:16], weight[23:16], product[2][15:0]);

    Behav_Adder ADD1(product[0][15:0], product[1][15:0], sum[0][15:0]);
    
    Behav_Adder ADD2(product[2][15:0], sum[0][15:0], sum[1][15:0]);
    
    always @ (negedge clk)
    begin
        if(reset)
        begin
            count <= 0;
            result <= 0;
        end
        else
        begin
            result <= result + sum[1][15:0];
            count <= count + 1;
        end
    end             
endmodule
