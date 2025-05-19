`timescale 1ns / 1ps

module Constant_mul(clk,rst,a,op);
	 
input [15:0] a;
output [15:0] op;
input clk,rst;

wire [15:0] t1,t2,t3,t4,t5,s1,s2,s3,s4,s5,s6,s7,s8;

rsh1 m1(a,t1);
rsh3 m2(a,t2);
rsh4 m3(a,t3);
rsh6 m4(a,t4);
rsh8 m5(a,t5);

addsub ad1(1'b0,t1, t2, s1);
addsub ad2(1'b0,t3, t4, s2);

reg16 f1(s3,clk,rst,s1);
reg16 f2(s4,clk,rst,s2);
reg16 f3(s5,clk,rst,t5);

addsub ad3(1'b0,s3, s4, s6);

reg16 f4(s7,clk,rst,s6);
reg16 f5(s8,clk,rst,s5);

addsub ad4(1'b0,s7, s8, op);



endmodule