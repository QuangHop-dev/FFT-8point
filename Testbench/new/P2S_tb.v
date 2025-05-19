`timescale 1ns / 1ps
module P2S_tb;
	reg clk;
	reg ld;
	reg en;
	reg [15:0] a1;
	reg [15:0] a2;
	reg [15:0] a3;
	reg [15:0] a4;
	reg [15:0] a5;
	reg [15:0] a6;
	reg [15:0] a7;
	reg [15:0] a8;
	wire [15:0] t8;
	P2S uut (
		.clk(clk), 
		.ld(ld), 
		.en(en), 
		.a1(a1), 
		.a2(a2), 
		.a3(a3), 
		.a4(a4), 
		.a5(a5), 
		.a6(a6), 
		.a7(a7), 
		.a8(a8), 
		.t8(t8)
	);
	always #5 clk = ~clk;
	initial begin
		clk = 0;
		ld = 0;
		en = 1;
		a1 = 16'h1234;
		a2 = 16'h5678;
		a3 = 16'hABCD;
		a4 = 16'hCDEF;
		a5 = 16'h0123;
		a6 = 16'h7894;
		a7 = 16'h1987;
		a8 = 16'h4561;
		#10;
      ld = 1;
		#10;
		ld = 0;
	end  
endmodule

