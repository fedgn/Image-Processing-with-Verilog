`timescale 1ns / 1ps

module CONV
(
    input clk,
    input reset,
    input [23:0] data,
    input [23:0] weight,
    output [7:0] result
);
    wire [15:0] macreslt;
    
    MAC MAC(clk, reset, data, weight, macreslt);
    MAC_Normalize MAC_Normalize(macreslt, result);
    
endmodule
