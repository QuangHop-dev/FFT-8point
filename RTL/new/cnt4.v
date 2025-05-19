`timescale 1ns / 1ps

module cnt4(out,data,load,en,clk,rst,tc,lmt);
output [2:0] out;
output reg tc;
input [2:0] data;
input load, en, clk,rst;
reg [2:0] out;

input [2:0]lmt;
initial begin out=3'b000;
	tc=0; end
always @(posedge clk)
	if (rst) begin
		out <= 3'b000 ;
	end 
	else if (load) begin
		out <= data;
	end 
	else if (en)
		out <= out + 3'b001;
	else out <= out;
always @(posedge clk)
	if (out ==lmt)
		tc<=1;
	else tc<=0;
endmodule
