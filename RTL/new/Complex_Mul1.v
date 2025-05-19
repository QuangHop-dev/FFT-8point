`timescale 1ns / 1ps

module complex_mul1(clk,rst,a,b,R,I);

input [15:0] a,b;
output [15:0] R,I;
input clk,rst;
wire [15:0] s1,s2,s3,s4,s5,s6;

addsub ad1(1'b1,a, b, s1);
addsub ad2(1'b0,a, b, s2);

reg16 f1(s3,clk,rst,s1);
reg16 f2(s4,clk,rst,s2);

Constant_mul cm1(clk,rst,s3,s5);
Constant_mul cm2(clk,rst,s4,s6);

reg16 f3(R,clk,rst,s5);
reg16 f4(I,clk,rst,s6);
endmodule
