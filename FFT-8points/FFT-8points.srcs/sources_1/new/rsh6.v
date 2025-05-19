`timescale 1ns / 1ps

module rsh6(a,b);
    input [15:0] a;
    output [15:0] b;
    
assign {b[15:9],b[8:0]}= {a[15],a[15],a[15],a[15],a[15],a[15],a[15:6]};

endmodule
