`timescale 1ns / 1ps
module Complex_Mul_tb;
	reg clk;
	reg rst;
	reg [15:0] a;
	reg [15:0] b;
	wire [15:0] R;
	wire [15:0] I;

	complex_mul uut (
		.clk(clk), 
		.rst(rst), 
		.a(a), 
		.b(b), 
		.R(R), 
		.I(I)
	);
	always #5 clk = ~clk;
	initial begin
		clk = 0;
		rst = 0;
		a = 16'h1234;
		b = 16'h5678;
		#100;
      rst = 1;
		#10;
		rst = 0;
	end
endmodule

