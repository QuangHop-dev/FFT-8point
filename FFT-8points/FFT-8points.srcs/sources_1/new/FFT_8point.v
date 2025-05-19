`timescale 1ns / 1ps

module FFT_8point(clk,rst,a1,a2,a3,a4,a5,a6,a7,a8,
 d1,dr2,di2,dr3,di3,dr4,di4,d5,dr6,di6,dr7,di7,dr8,di8);
 
input [15:0] a1,a2,a3,a4,a5,a6,a7,a8;
wire [15:0] b1,b2,b3,b4,b5,b6,b7,b8;
wire [15:0] c1,cr2,ci2,c3,cr4,ci4,c5,cr6,ci6,c7,cr8,ci8;
output [15:0] d1,dr2,di2,dr3,di3,dr4,di4,d5,dr6,di6,dr7,di7,dr8,di8;
input clk,rst;
FFT_stage1 stg1(clk,rst,a1,a2,a3,a4,a5,a6,a7,a8,
                          b1,b2,b3,b4,b5,b6,b7,b8);
								  
FFT_stage2 stg2(clk,rst,b1,b3,b2,b4,b5,b7,b6,b8,
                         c1,cr2,ci2,c3,cr4,ci4,c5,cr6,ci6,c7,cr8,ci8);

//FFT_stage3 stg3(clk,rst,c1,c5,cr2,ci2,cr6,ci6,c3,c7,cr4,ci4,cr8,ci8,
//                          d1,d2,dr3,dr4,di3,di4,dr5,dr6,di5,di6,dr7,dr8,di7,di8);
FFT_stage3 stg3(clk,rst,c1,c5,cr2,ci2,cr6,ci6,c3,c7,cr4,ci4,cr8,ci8,
                       d1,dr2,di2,dr3,di3,dr4,di4,d5,dr6,di6,dr7,di7,dr8,di8);
endmodule
