`timescale 1ns / 1ps

module FFT_stage2(clk,rst,a1,a2,a3,a4,a5,a6,a7,a8,
                         c1,cr2,ci2,c3,cr4,ci4,c5,cr6,ci6,c7,cr8,ci8);
								 
input [15:0] a1,a2,a3,a4,a5,a6,a7,a8;
output [15:0] c1,cr2,ci2,c3,cr4,ci4,c5,cr6,ci6,c7,cr8,ci8;
input clk,rst;

wire [15:0] b1,b2,b3,b4,b5,br6,bi6,b7,br8,bi8;

BF1 m1(clk,rst,a1,a2,b1,b3);
BF2 m2(clk,rst,b2,b4,cr2,cr4,ci2,ci4);
BF1 m3(clk,rst,a5,a6,b5,b7);
BF2 m4(clk,rst,a7,a8,br6,br8,bi6,bi8);

Delayblock df1(clk,rst,b1,c1);
Delayblock df2(clk,rst,b3,c3);

Delayblock df3(clk,rst,a3,b2);
Delayblock df4(clk,rst,a4,b4);

Delayblock df5(clk,rst,b5,c5);
Delayblock df6(clk,rst,b7,c7);

complex_mul cm1(clk,rst,br6,bi6,cr6,ci6);
complex_mul1 cm2(clk,rst,br8,bi8,cr8,ci8);

endmodule
