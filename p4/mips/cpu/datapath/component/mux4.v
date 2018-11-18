`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:20:11 11/18/2018 
// Design Name: 
// Module Name:    mux4 
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
module mux4 #(parameter WIDTH=32)(
    input [WIDTH-1:0] SrcA,
    input [WIDTH-1:0] SrcB,
    input [WIDTH-1:0] SrcC,
    input [WIDTH-1:0] SrcD,
    input [1:0] sel,
    output [WIDTH-1:0] Result
    );

	assign Result=	sel==2'b00 ? SrcA :
					sel==2'b01 ? SrcB :
					sel==2'b10 ? SrcC :
					SrcD;
endmodule
