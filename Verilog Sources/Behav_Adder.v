`timescale 1ns / 1ps

module Behav_Adder
#(
    parameter N = 16
)
(
    input signed [N-1:0] A,
    input signed [N-1:0] B,
    output signed [N-1:0] R
);

     assign R = A + B;

endmodule
