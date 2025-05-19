`timescale 1ns / 1ps

module Delayblock(clk,rst,a,b);

input [15:0] a;
output [15:0] b;
input clk,rst;
wire [15:0] a1,a2,a3,a4;

reg16 f1(a1,clk,rst,a);
reg16 f2(a2,clk,rst,a1);
reg16 f3(a3,clk,rst,a2);
reg16 f4(b,clk,rst,a3);

endmodule
