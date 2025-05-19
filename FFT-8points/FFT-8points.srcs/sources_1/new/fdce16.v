`timescale 1ns / 1ps

module fdce16(a,clk,en,y);
	 input [15:0] a;
	 input clk,en;
	 output [15:0] y;
fdce d1(y[0],clk,en,a[0]);
fdce d2(y[1],clk,en,a[1]);
fdce d3(y[2],clk,en,a[2]);
fdce d4(y[3],clk,en,a[3]);
fdce d5(y[4],clk,en,a[4]);
fdce d6(y[5],clk,en,a[5]);
fdce d7(y[6],clk,en,a[6]);
fdce d8(y[7],clk,en,a[7]);
fdce d9(y[8],clk,en,a[8]);
fdce d10(y[9],clk,en,a[9]);
fdce d11(y[10],clk,en,a[10]);
fdce d12(y[11],clk,en,a[11]);
fdce d13(y[12],clk,en,a[12]);
fdce d14(y[13],clk,en,a[13]);
fdce d15(y[14],clk,en,a[14]);
fdce d16(y[15],clk,en,a[15]);

endmodule
