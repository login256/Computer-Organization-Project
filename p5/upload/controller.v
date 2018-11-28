`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:38:05 11/26/2018 
// Design Name: 
// Module Name:    controller 
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
module controller(
    input [31:0] Instr,
	input clk,
	input reset,
	//main_CT
	output IsBr,
	output Jump,
	output JType,
	output DImmSel,
	output [1:0] A3Sel,
	output ALUBSel,
	output EResultSel,
	output DMWE,
	output DataWBSel,
	output RegWE,
	output [1:0] EXTCtrl,
	output [7:0] ALUCtrl,
	output [2:0] SLCtrl,
	//RegWE
	input DERegWE,
	input EMRegWE,
	input MWRegWE,
	//Forward
	output [1:0] D1FWSel,
	output [1:0] D2FWSel,
	output [1:0] E1FWSel,
	output [1:0] E2FWSel,
	output [1:0] M1FWSel,
	output [1:0] M2FWSel,
	//stall
	output stall
    );
	
	/*
	wire IsBr,Jump,Jtype,ALUBSel,EResultSel,DMWE,DataWBSel,RegWE;
	wire [1:0] A3Sel;
	wire [1:0] EXTCtrl;
	wire [7:0] ALUCtrl;
	wire [2:0] SLCtrl;
	*/
	
	main_controller MCT	(
		.Opcode(Instr[31:26]), 
		.Funct(Instr[5:0]), 
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
		.SLCtrl(SLCtrl)
    );
	
	wire [4:0] ATDA1, ATDA2, ATDA3;
	wire [1:0] ATDTuse1,ATDTuse2,ATDTnew;
	
	ATDecoder ATD (
		.Instr(Instr), 
		.A1(ATDA1), 
		.Tuse1(ATDTuse1), 
		.A2(ATDA2), 
		.Tuse2(ATDTuse2), 
		.A3(ATDA3), 
		.Tnew(ATDTnew)
    );
	
	wire [4:0] CTRDEA1,CTRDEA2,CTRDEA3,CTREMA1,CTREMA2,CTREMA3,CTRMWA1,CTRMWA2,CTRMWA3;
	wire [1:0] CTRDETnew,CTREMTnew,CTRMWTnew;
	
	CTreg CTR (
		.clk(clk), 
		.reset(reset), 
		.A1(ATDA1), 
		.A2(ATDA2),
		.A3(ATDA3), 
		.Tnew(ATDTnew), 
		.DEA1(CTRDEA1), 
		.DEA2(CTRDEA2), 
		.DEA3(CTRDEA3), 
		.DETnew(CTRDETnew), 
		.EMA1(CTREMA1), 
		.EMA2(CTREMA2), 
		.EMA3(CTREMA3), 
		.EMTnew(CTREMTnew), 
//		.MWA1(CTRMWA1), 
//		.MWA2(CTRMWA2), 
		.MWA3(CTRMWA3), 
		.MWTnew(CTRMWTnew)
    );
	
//	wire [1:0] FWCTD1FWSel,FWCTD2FWSel,FWCTE1FWSel,FWCTE2FWSel,FWCTM1FWSel,FWCTM2FWSel;
	
	forward_controller FWCT (
		.IDA1(ATDA1), 
		.IDA2(ATDA2), 
		.DEA1(CTRDEA1), 
		.DEA2(CTRDEA2), 
		.DEA3(CTRDEA3), 
		.DERegWE(DERegWE),
		.DETnew(CTRDETnew), 
		.EMA1(CTREMA1), 
		.EMA2(CTREMA2), 
		.EMA3(CTREMA3), 
		.EMRegWE(EMRegWE),
		.EMTnew(CTREMTnew), 
//		.MWA1(CTRMWA1), 
//		.MWA2(CTRMWA2), 
		.MWA3(CTRMWA3), 
		.MWRegWE(MWRegWE),
		.MWTnew(CTRMWTnew), 
		.D1FWSel(D1FWSel), 
		.D2FWSel(D2FWSel), 
		.E1FWSel(E1FWSel), 
		.E2FWSel(E2FWSel), 
		.M1FWSel(M1FWSel), 
		.M2FWSel(M2FWSel)
    );
	
	stall_controller SCT (
		.IDA1(ATDA1), 
		.Tuse1(ATDTuse1), 
		.IDA2(ATDA2), 
		.Tuse2(ATDTuse2), 
		.DEA3(CTRDEA3), 
		.DERegWE(DERegWE),
		.DETnew(CTRDETnew), 
		.EMA3(CTREMA3), 
		.EMRegWE(EMRegWE),
		.EMTnew(CTREMTnew), 
		.MWA3(CTRMWA3),
		.MWRegWE(MWRegWE),
		.MWTnew(CTRMWTnew), 
		.stall(stall)
    );

endmodule
