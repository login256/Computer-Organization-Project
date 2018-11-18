`include "define.v"
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:58:02 11/16/2018 
// Design Name: 
// Module Name:    alu 
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
module alu(
    input [31:0] SrcA,
    input [31:0] SrcB,
    input [4:0] Shamt,
    input [7:0] ALUCtrl,
    output [31:0] ALUResult,
    output zero
    );

	assign zero= ALUResult==0;
	
	assign ALUResult=	ALUCtrl==`aluAdd ? SrcA+SrcB :
						ALUCtrl==`aluSub ? SrcA-SrcB :
						ALUCtrl==`aluAnd ? SrcA&SrcB :
						ALUCtrl==`aluOr  ? SrcA|SrcB :
						ALUCtrl==`aluXor ? SrcA^SrcB :
						ALUCtrl==`aluNor ? ~(SrcA|SrcB) :
						ALUCtrl==`aluSll ? $unsigned(SrcB<<Shamt) :
						ALUCtrl==`aluSrl ? $unsigned(SrcB>>Shamt) :
						ALUCtrl==`aluSra ? $signed($signed(SrcB)>>>Shamt) :
						ALUCtrl==`aluEq  ? SrcA==SrcB :
						ALUCtrl==`aluLt  ? SrcA<SrcB :
						ALUCtrl==`aluLe  ? SrcA<=SrcB :
						ALUCtrl==`aluGt  ? SrcA>SrcB :
						ALUCtrl==`aluGe  ? SrcA>=SrcB :
						0;
	
endmodule
