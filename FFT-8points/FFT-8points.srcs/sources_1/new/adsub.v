`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:01:33 03/25/2024 
// Design Name: 
// Module Name:    adsub 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module adsub (sel,c,a,p1);
  input [0 : 0] sel;
  input [17 : 0] a;
  input [17 : 0] c;
  output [17 : 0] p1;
  //wire [18:0] p;
 //ad_sub m1(sel, a, c, p);
 //assign p1 = p[17:0];
 assign p1 = (sel)?(c-a):(c+a);
endmodule
