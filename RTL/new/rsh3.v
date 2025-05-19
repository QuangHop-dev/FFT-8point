`timescale 1ns / 1ps

module rsh3(a,b);
    input [15:0] a;
    output [15:0] b;
    
assign {b[15:12],b[11:0]}= {a[15],a[15],a[15],a[15:3]};

endmodule
