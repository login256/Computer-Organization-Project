`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:04:31 11/15/2018 
// Design Name: 
// Module Name:    mips 
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
module cpu(
    input clk,
    input reset,
	input [31:0] Instr,
	input [31:0] DMDataR,
	output [31:0] PC,
	output [31:0] DMAdr,
	output DMWE,
	output [31:0] DMDataW,
	output [1:0] DMWLen
    );
	
	wire IsBr;
	wire Jump;
	wire JType;
	wire RegA3Sel;
	wire SaveRA;
	wire [1:0] DatatoReg;
	wire RegWE;
	wire ALUBSel;
	wire [1:0]EXTCtrl;
	wire [7:0] ALUCtrl;
	
	datapath DP (
    .clk(clk), 
    .reset(reset), 
    .IsBr(IsBr), 
    .Jump(Jump), 
    .JType(JType), 
    .RegA3Sel(RegA3Sel), 
    .SaveRA(SaveRA), 
    .DatatoReg(DatatoReg), 
    .RegWE(RegWE), 
    .ALUBSel(ALUBSel), 
    .EXTCtrl(EXTCtrl), 
    .ALUCtrl(ALUCtrl), 
    .Instr(Instr), 
    .DMDataR(DMDataR), 
    .DMAdr(DMAdr), 
    .PC(PC),
	.DMDataW(DMDataW)
    );

	wire [5:0] Opcode,Funct;
	
	assign Opcode=Instr[31:26];
	assign Funct=Instr[5:0];
	
	controller CT(
    .Opcode(Opcode), 
    .Funct(Funct), 
    .IsBr(IsBr), 
    .Jump(Jump), 
    .JType(JType), 
    .RegA3Sel(RegA3Sel), 
    .SaveRA(SaveRA), 
    .DatatoReg(DatatoReg), 
    .RegWE(RegWE), 
    .ALUBSel(ALUBSel), 
    .DMWE(DMWE), 
    .EXTCtrl(EXTCtrl), 
    .ALUCtrl(ALUCtrl)
    );
	
endmodule
