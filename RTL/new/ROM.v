`timescale 1ns / 1ps

module ROM(clk,addres,data_out,en);

input clk,en;

input [2:0] addres;

output reg [15:0] data_out;

reg [15:0] mem [0:7];

initial begin
	$readmemb("input.txt", mem); 
end 

always@(posedge clk)
	begin
		if(en)
			data_out <= mem[addres];
		else
			data_out <= data_out;
		end
endmodule