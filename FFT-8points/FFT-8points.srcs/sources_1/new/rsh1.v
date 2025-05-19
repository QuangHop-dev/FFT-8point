`timescale 1ns / 1ps

module rsh1(a,b);
    input [15:0] a;
    output [15:0] b;
    
assign {b[15],b[14:0]}= {a[15],a[15:1]};

endmodule
