`timescale 1ns / 1ps

module MAC_Normalize
(
    input signed [15:0] data,
    output reg [7:0] result
);

    always @ *
    begin
        if(data > 255)
            result = 255;
        else if(data < 0)
            result = 0;
        else
            result = data;
    end 
endmodule
