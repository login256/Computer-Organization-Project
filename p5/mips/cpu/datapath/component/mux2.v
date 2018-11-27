`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:45:20 11/17/2018 
// Design Name: 
// Module Name:    mux2 
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
module mux2 #(parameter WIDTH=32)(
    input [WIDTH-1:0] SrcA,
    input [WIDTH-1:0] SrcB,
	input sel,
    output [WIDTH-1:0] Out
    );

	assign Out=sel?SrcB:SrcA;

endmodule
