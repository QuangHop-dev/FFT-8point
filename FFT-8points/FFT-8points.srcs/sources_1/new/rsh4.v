`timescale 1ns / 1ps

module rsh4(a,b);
    input [15:0] a;
    output [15:0] b;
    
assign {b[15:11],b[10:0]}= {a[15],a[15],a[15],a[15],a[15:4]};

endmodule