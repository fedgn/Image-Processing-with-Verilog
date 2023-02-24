`timescale 1ns / 1ps

module TOP
(
    input clk,
    input reset,
    input conv_run,
    input [71:0] kernel,
    output conv_done,
    output [1023:0] out
);
    wire conv_reset, enable_ram, enable_ram2;
    wire [7:0] address_ram;
    wire [7:0] address_ram2;
    wire [23:0] weight;
    wire [1039:0] ram1_out;
    wire [1023:0] result;
    wire [1023:0] data_out;
    
    control_input M1(clk, reset, conv_run, kernel, conv_reset, enable_ram, address_ram, weight);
    BRAM1 M2(clk, enable_ram, 1'd0, address_ram, 1040'd0, ram1_out);
    CONV128 M3(clk, conv_reset, ram1_out, weight, result);
    control_output M4(clk, reset, result, conv_done, address_ram2, data_out);
    BRAM2 M5(clk, 1, 1, address_ram2, data_out, out);   
	
endmodule
