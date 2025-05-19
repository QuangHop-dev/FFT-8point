`timescale 1ns / 1ps
module FFT_processor(clk,rst,start,Re,Im);

input clk,rst,start;
output [15:0] Re,Im;
wire [15:0] data_out,a1,a2,a3,a4,a5,a6,a7,a8,
            d1,dr2,di2,dr3,di3,dr4,di4,d5,dr6,di6,dr7,di7,dr8,di8;
wire [2:0] addr,out1,out2;
wire en1,en2,en3,en4,tc1,tc2,tc3;
parameter zro = 16'b0;

ROM mem(clk,addr,data_out,en1);

S2P blk1(clk,en2,data_out,a8,a7,a6,a5,a4,a3,a2,a1);

FFT_8point blk2(clk,rst,a1,a2,a3,a4,a5,a6,a7,a8,
                           d1,dr2,di2,dr3,di3,dr4,di4,d5,dr6,di6,dr7,di7,dr8,di8);

P2S blk3(clk,tc2,en4,d1,dr2,dr3,dr4,d5,dr6,dr7,dr8,Re);	 
P2S blk4(clk,tc2,en4,zro,di2,di3,di4,zro,di6,di7,di8,Im);

///control part..........
cnt4 ct1(addr,3'b000,start,en1,clk,rst,tc1,3'b110);	
pg p1(start,tc1,en1,clk,rst);
DFF d11(en2,clk,rst,en1);

cnt4 ct2(out1,3'b000,tc1,en3,clk,rst,tc2,3'b111);	
pg p2(tc1,tc2,en3,clk,rst);

cnt4 ct3(out2,3'b000,tc2,en4,clk,rst,tc3,3'b110);	
pg p3(tc2,tc3,en4,clk,rst);

endmodule
