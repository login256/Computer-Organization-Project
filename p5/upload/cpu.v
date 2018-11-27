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
	//DM
	input [31:0] DMDataR,
	output [31:0] DMAdr,
	output DMcurWE,
	output [1:0] DMWLen,
	output [31:0] DMDataW,
	output [31:0] DMcurPC,
	//IM
	output [31:0] PC_Fetch,
	input [31:0] Fetch_Instr
    );
	
	wire [31:0] InstrtoCT;
	
	wire IsBr;
	wire Jump;
	wire JType;
	wire [1:0] A3Sel;
	wire ALUBSel;
	wire EResultSel;
	wire DMWE;
	wire DataWBSel;
	wire RegWE;
	wire [1:0] EXTCtrl;
	wire [7:0] ALUCtrl;
	wire [2:0] SLCtrl;
	wire [1:0] D1FWSel;
	wire [1:0] D2FWSel;
	wire [1:0] E1FWSel;
	wire [1:0] E2FWSel;
	wire [1:0] M1FWSel;
	wire [1:0] M2FWSel;
	wire stall;
	
	datapath DP (
		.clk(clk), 
		.reset(reset), 
		.InstrtoCT(InstrtoCT), 
		//Ctrl
		.IsBr(IsBr), 
		.Jump(Jump), 
		.JType(JType), 
		.DImmSel(DImmSel), 
		.A3Sel(A3Sel), 
		.ALUBSel(ALUBSel), 
		.EResultSel(EResultSel), 
		.DMWE(DMWE), 
		.DataWBSel(DataWBSel), 
		.RegWE(RegWE), 
		.EXTCtrl(EXTCtrl), 
		.ALUCtrl(ALUCtrl), 
		.SLCtrl(SLCtrl), 
		.D1FWSel(D1FWSel), 
		.D2FWSel(D2FWSel), 
		.E1FWSel(E1FWSel), 
		.E2FWSel(E2FWSel), 
		.M1FWSel(M1FWSel), 
		.M2FWSel(M2FWSel), 
		.stall(stall), 
		//DM
		.DMDataR(DMDataR), 
		.DMAdr(DMAdr), 
		.DMcurWE(DMcurWE), 
		.DMWLen(DMWLen), 
		.DMDataW(DMDataW), 
		.DMcurPC(DMcurPC), 
		//IM
		.PC_Fetch(PC_Fetch), 
		.Fetch_Instr(Fetch_Instr)
    );
	
	controller CT (
		.Instr(InstrtoCT), 
		.clk(clk), 
		.reset(reset), 
		//Ctrl
		.IsBr(IsBr), 
		.Jump(Jump), 
		.JType(JType), 
		.DImmSel(DImmSel), 
		.A3Sel(A3Sel), 
		.ALUBSel(ALUBSel), 
		.EResultSel(EResultSel), 
		.DMWE(DMWE), 
		.DataWBSel(DataWBSel), 
		.RegWE(RegWE), 
		.EXTCtrl(EXTCtrl), 
		.ALUCtrl(ALUCtrl), 
		.SLCtrl(SLCtrl), 
		.D1FWSel(D1FWSel), 
		.D2FWSel(D2FWSel), 
		.E1FWSel(E1FWSel), 
		.E2FWSel(E2FWSel), 
		.M1FWSel(M1FWSel), 
		.M2FWSel(M2FWSel), 
		.stall(stall)
    );
	
endmodule
