`timescale 1ns/1ps
module led_blinker_tb();

    reg clk = 0;
    reg rst_n = 0;
    wire led;

    led_blinker uut(clk, rst_n, led);

    always #10 clk = ~clk;   // 50 MHz clock

    initial begin
        rst_n = 0;
        #100;
        rst_n = 1;
        #1_000_000 $finish;
    end
endmodule
