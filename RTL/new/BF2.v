`timescale 1ns / 1ps

module BF2(clk,rst,a,b,a1,a2,b1,b2);

input [15:0] a,b;
output [15:0] a1,a2,b1,b2;
input clk,rst;
wire [15:0] s;
parameter zro = 16'b0000000000000000;
reg16 f1(a1,clk,rst,a);
addsub ad1(1'b1,zro, b, s);
reg16 f2(b1,clk,rst,s);
reg16 f3(b2,clk,rst,b);
assign a2 = a1;

endmodule
