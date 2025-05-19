`timescale 1ns / 1ps

module BF1_tb;

	reg clk;
	reg rst;
	reg [15:0] a;
	reg [15:0] b;

	wire [15:0] y1;
	wire [15:0] y2;

	BF1 uut (
		.clk(clk), 
		.rst(rst), 
		.a(a), 
		.b(b), 
		.y1(y1), 
		.y2(y2)
	);
	always #5 clk = ~clk;
	initial begin
		clk = 0;
		rst = 1;
		a = 0;
		b = 0;
		#20;
		rst = 0;
		a = 16'h0100;
		b = 16'h0180;
		#50;
		a = 16'h8080;
		b = 16'h6000; 
	end
endmodule

