`timescale 1ns / 1ps

module cnt4_tb;

	reg [2:0] data;
	reg load;
	reg en;
	reg clk;
	reg rst;
	reg [2:0] lmt;

	wire [2:0] out;
	wire tc;
	
	cnt4 uut (
		.out(out), 
		.data(data), 
		.load(load), 
		.en(en), 
		.clk(clk), 
		.rst(rst), 
		.tc(tc), 
		.lmt(lmt)
	);
	always #5 clk = ~clk;
   initial begin
       clk = 0;
       rst = 1;
       load = 0;
       en = 1;
       data = 3'b000;
       lmt = 3'b100;
       #20;
       rst = 0;
   end
	initial begin
       #10;
       load = 1; 
       #10;
       load = 0;

       #10;
       en = 1;
   end
endmodule


