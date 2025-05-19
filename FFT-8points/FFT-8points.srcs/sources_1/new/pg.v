`timescale 1ns / 1ps

module pg(start,tc,q,clk,reset);
	 input start,tc,clk,reset;
	 output  q;
	 
	 wire t1,t2;
	 parameter vdd=1'b1;
	 parameter gnd=1'b0;
	
    mux M1(t2,vdd,start,q);
	 mux M2(q,gnd,tc,t1);
	 DFF d2(t2,clk,reset,t1);

endmodule