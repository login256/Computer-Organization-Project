`include"..\..\define.v"
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:22:44 11/27/2018 
// Design Name: 
// Module Name:    Branch_Control 
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
module Branch_Control(
    input [31:0] RD1,
    input [31:0] RD2,
    input [4:0] rt,
    input IsBr,
    input [5:0] Opcode,
    output Br
    );

	wire Cmp=	Opcode==`opcodeBEQ ? ~(|(RD1^RD2)) :
				Opcode==`opcodeBNE ? (|(RD1^RD2)) :
				Opcode==`opcodeBLEZ ? $signed($signed(RD1)<=$signed(0)) :
				Opcode==`opcodeREGIMM && rt==`rtBLTZ ? $signed($signed(RD1)<$signed(0)) :
				Opcode==`opcodeBGTZ ? $signed($signed(RD1)>$signed(0)) :
				Opcode==`opcodeREGIMM && rt==`rtBGEZ ?  $signed($signed(RD1)>=$signed(0)) :
				0;
	
	assign Br= IsBr&Cmp;

	/*	
	wire Cmp=	Opcode==`opcodeBEQ ? ~(|(RD1^RD2)) :
				Opcode==`opcodeBNE ? (|(RD1^RD2)) :
				Opcode==`opcodeBLEZ ? ((~(|(RD1))) | (RD1[31])) :
				Opcode==`opcodeREGIMM && rt==`rtBLTZ ? (RD1[31]) :
				Opcode==`opcodeBGTZ ? (~RD1[31]) && (|(RD1)):
				Opcode==`opcodeREGIMM && rt==`rtBGEZ ?  (~RD1[31]):
				0;
	*/

	/*
	assign Br=	Opcode==`opcodeBEQ ? IsBr&~(|(RD1^RD2)) :
				Opcode==`opcodeBNE ? IsBr&(|(RD1^RD2)) :
				Opcode==`opcodeBLEZ ? IsBr&((~(|(RD1))) | (RD1[31])) :
				Opcode==`opcodeREGIMM && rt==`rtBLTZ ? IsBr&(RD1[31]) :
				Opcode==`opcodeBGTZ ? IsBr&(~RD1[31]) :
				Opcode==`opcodeREGIMM && rt==`rtBGEZ ?  IsBr&((~(|(RD1))) | (~RD1[31])):
				0;
	*/
endmodule
