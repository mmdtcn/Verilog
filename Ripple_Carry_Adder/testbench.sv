// tb_ripple_adder.v
`timescale 1ns/1ps

module tb_ripple_adder;
  reg [3:0] A, B;
  wire [4:0] SUM;

  ripple_adder U1 (.A(A), .B(B), .SUM(SUM));

  initial begin
    $dumpfile("adder.vcd");
    $dumpvars(0, tb_ripple_adder);

    A = 4'b0001; B = 4'b0010;
    #10 A = 4'b0100; B = 4'b0101;
    #10 A = 4'b1111; B = 4'b0001;
    #10 $finish;
  end
endmodule
