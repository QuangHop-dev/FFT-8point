`timescale 1ns / 1ps

module FFT_stage3(clk,rst,a1,a2,ar3,ai3,ar4,ai4,a5,a6,ar7,ai7,ar8,ai8,
                          b1,br2,bi2,br3,bi3,br4,bi4,b5,br6,bi6,br7,bi7,br8,bi8);

input [15:0] a1,a2,ar3,ai3,ar4,ai4,a5,a6,ar7,ai7,ar8,ai8;
output [15:0] b1,br2,bi2,br3,bi3,br4,bi4,b5,br6,bi6,br7,bi7,br8,bi8;
input clk,rst;

////for Real part
BF1 m1(clk,rst,a1,a2,b1,b5);
BF1 m2(clk,rst,ar3,ar4,br6,br2);
BF2 m3(clk,rst,a5,a6,br3,br7,bi3,bi7);
BF1 m4(clk,rst,ar7,ar8,br8,br4);

////for imagnary part
BF1 m5(clk,rst,ai3,ai4,bi6,bi2);
BF1 m6(clk,rst,ai7,ai8,bi8,bi4);

endmodule
