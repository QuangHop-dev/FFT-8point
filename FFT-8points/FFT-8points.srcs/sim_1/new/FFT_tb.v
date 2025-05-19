`timescale 1ns / 1ps

module FFT_tb;

	reg clk;
	reg rst;
	reg start;

	wire [15:0] Re;
	wire [15:0] Im;

	FFT_processor uut (
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.Re(Re), 
		.Im(Im)
	);
	always #5 clk = ~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		start = 0;

		// Wait 100 ns for global reset to finish
		#300;
      start = 1;
		#10;
		start = 0;

	end
      
endmodule

