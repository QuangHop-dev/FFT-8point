`timescale 1ns / 1ps

module ROM_tb;
	reg clk;
	reg [2:0] addres;
	reg en;
	wire [15:0] data_out;
	ROM uut (
		.clk(clk), 
		.addres(addres), 
		.data_out(data_out), 
		.en(en)
	);
	always #5 clk = ~clk;
	initial begin
		clk = 0;
		addres = 0;
		en = 1;
		#100;
		addres = 4;
		#100;
		addres = 7;
	end
endmodule

