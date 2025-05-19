`timescale 1ns / 1ps

module rsh8(a,b);
    input [15:0] a;
    output [15:0] b;
    
assign {b[15:7],b[6:0]}= {a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15],a[15:8]};

endmodule
