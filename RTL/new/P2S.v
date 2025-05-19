`timescale 1ns / 1ps

module P2S(clk,ld,en,a1,a2,a3,a4,a5,a6,a7,a8,t8);
input clk,ld,en;

input [15:0] a1,a2,a3,a4,a5,a6,a7,a8;
output [15:0] t8;

wire [15:0] p1,p2,p3,p4,p5,p6,p7;
wire [15:0] t1,t2,t3,t4,t5,t6,t7;

fdce16 f1(a1,clk,en,t1);

mux16 mx1(t1,a2,ld,p1);
fdce16 f2(p1,clk,en,t2);

mux16 mx2(t2,a3,ld,p2);
fdce16 f3(p2,clk,en,t3);

mux16 mx3(t3,a4,ld,p3);
fdce16 f4(p3,clk,en,t4);

mux16 mx4(t4,a5,ld,p4);
fdce16 f5(p4,clk,en,t5);

mux16 mx5(t5,a6,ld,p5);
fdce16 f6(p5,clk,en,t6);

mux16 mx6(t6,a7,ld,p6);
fdce16 f7(p6,clk,en,t7);

mux16 mx7(t7,a8,ld,p7);
fdce16 f8(p7,clk,en,t8);
endmodule