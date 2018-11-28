`include"define.v"
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:48:05 11/21/2018 
// Design Name: 
// Module Name:    loadcalc 
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
module loadcalc(
    input [31:0] memD,
	input [31:0] GRFD,
    input [1:0] bytesel,
    input [2:0] SLCtrl,
    output [31:0] Dout
    );
	
	wire [31:0] temp;
	
	assign temp= 	SLCtrl==`slword ? memD :
					SLCtrl==`slhalf ? memD>>{bytesel[1],4'b0} :
					SLCtrl==`slbyte ? memD>>{bytesel,3'b0} :
					SLCtrl==`slhalfu ? memD>>{bytesel[1],4'b0} :
					SLCtrl==`slbyteu ? memD>>{bytesel,3'b0} :
					0;

	
	assign Dout= 	SLCtrl==`slword ? memD :
					SLCtrl==`slhalf ? {{16{ temp[15:15] }},temp[15:0]} :
					SLCtrl==`slbyte ? {{24{ temp[7:7] }},temp[7:0]} :
					SLCtrl==`slwordleft ? {memD<<{~bytesel,3'b0}} | ( (32'h00ffffff >> {bytesel,3'b0}) & GRFD):
					SLCtrl==`slwordright ? {memD>>{bytesel,3'b0}} | ( (32'hffffff00 << {~bytesel,3'b0}) & GRFD):
					SLCtrl==`slhalfu ? {{16{1'b0}},temp[15:0]} :
					SLCtrl==`slbyteu ? {{24{1'b0}},temp[7:0]} :
					0;

endmodule
