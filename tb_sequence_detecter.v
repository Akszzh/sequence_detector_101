`timescale 1ns / 1ps

module tb_sequence_detector;

    reg clk;
    reg x;
    reg reset;
    wire z;

    sequence_detector uut (
        .clk(clk),
        .x(x),
        .reset(reset),
        .z(z)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        x = 0;

        #10 reset = 0;

        #10 x = 1;
        #10 x = 0;
        #10 x = 1;

        #10 x = 1;
        #10 x = 0;
        #10 x = 1;

        #10 x = 0;
        #10 x = 0;
        #10 x = 1;
        #10 x = 0;

        #20 $finish;
    end

    initial begin
        $display("Time\tclk\tx\tz");
        $monitor("%0dns\t%b\t%b\t%b", $time, clk, x, z);
    end

endmodule
