`timescale 1ns / 1ps

module mux16(A,B,S,Y);

    input [15:0] A,B;
    output [15:0] Y;
    input S;

assign Y = (S)? B : A;
endmodule