`timescale 1ns / 1ps

module TOP_tb();

    reg clk, reset, conv_run;
    reg [71:0] kernel;
    wire conv_done;
    wire [1023:0] out;
    
    integer fout_ptr;
    
    TOP UUT(clk, reset, conv_run, kernel, conv_done, out);

    initial begin
        kernel = 72'hFF_FF_FF_FF_08_FF_FF_FF_FF;
        reset = 1; clk = 0; #11;
        reset = 0;
        conv_run = 1;
        #119;
        fout_ptr = $fopen("./output_image.txt","w");
        if (fout_ptr == 0) begin
            $display("Could not open file '%s'  for writing","output.txt");
            $stop;     
        end

        while(!$feof(fout_ptr)) begin
            $fwrite(fout_ptr,"%h\n",out);
            #80;
        end
    end

    always begin
        #10;
        clk = ~clk;
    end
endmodule
