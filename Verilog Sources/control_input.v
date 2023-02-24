`timescale 1ns / 1ps

module control_input
(
    input clk,
    input reset,
    input conv_run,
    input [71:0] kernel,
    output reg conv_reset,
    output reg enable_ram,
    output reg [7:0] address_ram,
    output reg [23:0] weight
);

    reg [1:0] counter;
    
    always @ (posedge clk or posedge reset) begin
        if(reset)
            counter <= 0;
        else begin
            if(counter < 3)
                counter <= counter + 1;
            else
                counter <= 0;
        end
    end

    always @ (posedge clk or posedge reset) begin
        if(reset) begin
            address_ram <= 0;
            enable_ram <= 0;
            conv_reset <= 1;
        end
        else begin
            if(conv_run) begin
                case(counter)
                    0: begin
                        weight <= kernel [23:0];
                        conv_reset <= 0;
                        address_ram <= address_ram + 1;
                        enable_ram <= 1;
                    end
                    1: begin
                        weight <= kernel [47:24];
                        conv_reset <= 0;
                        address_ram <= address_ram + 1;
                        enable_ram <= 1;
                    end
                    2: begin
                        weight <= kernel [71:48];
                        conv_reset <= 0;
                        address_ram <= address_ram + 1;
                        enable_ram <= 1;
                    end
                    3: begin
                        conv_reset <= 1;
                        enable_ram <= 1;
                        address_ram <= address_ram - 2;
                    end
                endcase
            end
        end
    end
endmodule
