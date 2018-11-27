`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:54:15 11/17/2018 
// Design Name: 
// Module Name:    ext 
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
module ext(
    input [15:0] Imm,
    input [1:0] EXTCtrl,
    output [31:0] Result
    );
	
	assign Result=	EXTCtrl==2'b00 ? {{16{1'b0}},Imm} :
					EXTCtrl==2'b01 ? {{16{Imm[15:15]}},Imm} :
					EXTCtrl==2'b10 ? {Imm,{16{1'b0}}} :
					{{16{1'b1}},Imm};

endmodule
