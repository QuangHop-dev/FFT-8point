`timescale 1ns / 1ps

module fdce(q,clk,ce,d);
    input d,clk,ce;
    output reg q;
initial begin q=0; end
always @ (posedge (clk)) begin
	if (ce)
		q <= d;
	else 
		q <= q ;
	end
endmodule
