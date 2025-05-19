`timescale 1ns / 1ps

module FFT_stage1(clk,rst,a1,a2,a3,a4,a5,a6,a7,a8,
                          b1,b2,b3,b4,b5,b6,b7,b8);
								  
input [15:0] a1,a2,a3,a4,a5,a6,a7,a8;
output [15:0] b1,b2,b3,b4,b5,b6,b7,b8;
input clk,rst;
	 
BF1 m1(clk,rst,a1,a5,b1,b2);
BF1 m2(clk,rst,a3,a7,b3,b4);
BF1 m3(clk,rst,a2,a6,b5,b6);
BF1 m4(clk,rst,a4,a8,b7,b8);
endmodule
