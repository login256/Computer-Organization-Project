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
    output [31:0] Result,
	output Overflow
    );

//	assign zero= Result==0;
	
	assign Result=		ALUCtrl==`aluAdd ? SrcA+SrcB :
						ALUCtrl==`aluSub ? SrcA-SrcB :
						ALUCtrl==`aluAnd ? SrcA&SrcB :
						ALUCtrl==`aluOr  ? SrcA|SrcB :
						ALUCtrl==`aluXor ? SrcA^SrcB :
						ALUCtrl==`aluNor ? ~(SrcA|SrcB) :
						ALUCtrl==`aluSll ? $unsigned(SrcB<<Shamt) :
						ALUCtrl==`aluSrl ? $unsigned($unsigned(SrcB)>>Shamt) :
						ALUCtrl==`aluSra ? $signed($signed(SrcB)>>>Shamt) :
						ALUCtrl==`aluEq  ? SrcA==SrcB :
						ALUCtrl==`aluLt  ? $signed($signed(SrcA)<$signed(SrcB)) :
						ALUCtrl==`aluLe  ? $signed($signed(SrcA)<=$signed(SrcB)) :
						ALUCtrl==`aluGt  ? $signed($signed(SrcA)>$signed(SrcB)) :
						ALUCtrl==`aluGe  ? $signed($signed(SrcA)>=$signed(SrcB)) :
						ALUCtrl==`aluLtu  ? $unsigned($unsigned(SrcA)<$unsigned(SrcB)) :
						ALUCtrl==`aluLeu  ? $unsigned($unsigned(SrcA)<=$unsigned(SrcB)) :
						ALUCtrl==`aluGtu  ? $unsigned($unsigned(SrcA)>$unsigned(SrcB)) :
						ALUCtrl==`aluGeu  ? $unsigned($unsigned(SrcA)>=$unsigned(SrcB)) :
						ALUCtrl==`aluSllv  ? SrcB<<SrcA[4:0] :
						ALUCtrl==`aluSrlv  ? $unsigned($unsigned(SrcB)>>SrcA[4:0]) :
						ALUCtrl==`aluSrav  ? $signed($signed(SrcB)>>>SrcA[4:0]) :
						0;
	
	wire [32:0] TempResult =  	ALUCtrl==`aluAdd ? {SrcA[31],SrcA}+{SrcB[31],SrcB}:
								ALUCtrl==`aluSub ? {SrcA[31],SrcA}-{SrcB[31],SrcB}:
								0;
	
	assign Overflow=TempResult[32]!=TempResult[31];
	
endmodule
