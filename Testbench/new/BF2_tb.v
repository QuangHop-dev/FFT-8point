`timescale 1ns / 1ps

module BF2_tb;
	reg clk;
	reg rst;
	reg [15:0] a;
	reg [15:0] b;

	wire [15:0] a1;
	wire [15:0] a2;
	wire [15:0] b1;
	wire [15:0] b2;

	BF2 uut (
		.clk(clk), 
		.rst(rst), 
		.a(a), 
		.b(b), 
		.a1(a1), 
		.a2(a2), 
		.b1(b1), 
		.b2(b2)
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
		b = 16'h0182;
		#50;
		a = 16'h0001;
		b = 16'h0004;
	end
endmodule

