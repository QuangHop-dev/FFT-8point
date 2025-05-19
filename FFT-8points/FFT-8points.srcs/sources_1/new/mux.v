`timescale 1ns / 1ps

module mux(A,B,S,Y);

    input  A,B;
    output  Y;
    input S;
 
assign Y = (S)? B : A;
endmodule