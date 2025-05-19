`timescale 1ns / 1ps

module pg_tb;

	reg start;
	reg tc;
	reg clk;
	reg reset;

	wire q;

	pg uut (
		.start(start), 
		.tc(tc), 
		.q(q), 
		.clk(clk), 
		.reset(reset)
	);
	always #5 clk = ~clk;
	initial begin
		start = 0;
		tc = 0;
		clk = 0;
		reset = 0;

		#105;
      start = 1;
		#35;
		start = 0;
		tc = 1;
	
	end
      
endmodule

