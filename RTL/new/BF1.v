`timescale 1ns / 1ps

module BF1(clk,rst,a,b,y1,y2);

input clk,rst;
input [15:0] a,b;
output [15:0] y1,y2;
wire [15:0] s1,s2;

addsub ad1(1'b0,a, b, s1);
addsub ad2(1'b1,a, b, s2);

reg16 f1(y1,clk,rst,s1);
reg16 f2(y2,clk,rst,s2);
endmodule
