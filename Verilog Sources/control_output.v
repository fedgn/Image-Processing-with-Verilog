`timescale 1ns / 1ps

module control_output
(
    input clk,
    input reset,
    input [1023:0] data,
    output reg conv_done,
    output reg [7:0] ram_address,
    output reg [1023:0] data_out
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
    
    always @ (posedge clk or posedge reset)
    begin
        if(reset) begin
            data_out <= 0;
            ram_address <= 0;
            conv_done <= 0;
        end
        else begin
            case(counter)
                0: begin
                
                end
                1: begin
                
                end
                3: begin
                    data_out <= data;
                    ram_address <= ram_address + 1;
                    if(ram_address == 128)
                        conv_done <= 1;
                end
                2: begin
                
                end
            endcase
        end
    end
endmodule
