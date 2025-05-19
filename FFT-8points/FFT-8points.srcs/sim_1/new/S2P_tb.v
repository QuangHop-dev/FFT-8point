`timescale 1ns / 1ps

module S2P_tb;

	reg clk;
	reg en;
	reg [15:0] a;

	wire [15:0] a1;
	wire [15:0] a2;
	wire [15:0] a3;
	wire [15:0] a4;
	wire [15:0] a5;
	wire [15:0] a6;
	wire [15:0] a7;
	wire [15:0] a8;

	S2P uut (
		.clk(clk), 
		.en(en), 
		.a(a), 
		.a1(a1), 
		.a2(a2), 
		.a3(a3), 
		.a4(a4), 
		.a5(a5), 
		.a6(a6), 
		.a7(a7), 
		.a8(a8)
	);

	always #5 clk = ~clk;

   initial begin
       clk = 0;
       en = 1;
       a = 16'habcd;
	end
	
endmodule

