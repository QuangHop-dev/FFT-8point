`timescale 1ns / 1ps

module S2P(clk,en,a,a1,a2,a3,a4,a5,a6,a7,a8);

input [15:0] a;
output [15:0] a1,a2,a3,a4,a5,a6,a7,a8;
input clk,en;

fdce16 f1(a,clk,en,a1);
fdce16 f2(a1,clk,en,a2);
fdce16 f3(a2,clk,en,a3);
fdce16 f4(a3,clk,en,a4);
fdce16 f5(a4,clk,en,a5);
fdce16 f6(a5,clk,en,a6);
fdce16 f7(a6,clk,en,a7);
fdce16 f8(a7,clk,en,a8);

endmodule
