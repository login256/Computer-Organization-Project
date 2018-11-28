`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:15:58 11/15/2018 
// Design Name: 
// Module Name:    datapath 
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
module datapath(
	input clk,
	input reset,
	//to_CT
	output [31:0] InstrtoCT,
	//Function
	input IsBr,
	input Jump,
	input JType,
	input DImmSel,
	input [1:0] A3Sel,
	input ALUBSel,
	input EResultSel,
	input DMWE,
	input DataWBSel,
	input RegWE,
	input [1:0] EXTCtrl,
	input [7:0] ALUCtrl,
	input [2:0] SLCtrl,
	//RegWEout
	output DE_RegWE,
	output EM_RegWE,
	output MW_RegWE,
	//Forward
	input [1:0] D1FWSel,
	input [1:0] D2FWSel,
	input [1:0] E1FWSel,
	input [1:0] E2FWSel,
	input [1:0] M1FWSel,
	input [1:0] M2FWSel,
	//stall
	input stall,
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
	
	//General wires
	
	//for jump and branch
	wire [31:0] FD_InstrOut;
	wire [31:0] D_RD1;
	wire D_IsBr=IsBr, D_Jump=Jump, D_JType=JType;
	wire D_Br;
	
	//for last level
	wire [31:0] MW_ResultOut;
	wire [4:0] MW_A3Out;
	wire MW_RegWEOut;
	wire [31:0] MW_PCOut;
	
	//for FW
	wire [31:0] DE_ImmOut;
	wire [31:0] EM_ResultOut;
	
	// F
	
	wire [31:0] F_NPC, F_curPC, F_PCAdd8;
	
	nextPC  CalcPC(
		.curPC(F_curPC), 
		.BrImm(FD_InstrOut[15:0]), 
		.JImm(FD_InstrOut[25:0]), 
		.JRImm(D_RD1), 
		.Br(D_Br),
		.Jump(D_Jump), 
		.JType(D_JType), 
		.NPC(F_NPC), 
		.PCAdd8(F_PCAdd8)
    );
	
	PCmem PCreg(
		.clk(clk), 
		.reset(reset),
		.EN(~stall),
		.NPC(F_NPC), 
		.PC(F_curPC)
	);
	assign PC_Fetch=F_curPC;
	
	// FD 
	
//	wire [31:0] FD_InstrOut;
	wire [31:0] FD_PCAdd8Out, FD_curPCOut;
	
	FDreg FDreg (
		.clk(clk), 
		.reset(reset), 
		.EN(~stall), 
		.InstrIn(Fetch_Instr), 
		.PCAdd8In(F_PCAdd8), 
		.curPCIn(F_curPC), 
		.InstrOut(FD_InstrOut), 
		.PCAdd8Out(FD_PCAdd8Out), 
		.curPCOut(FD_curPCOut)
    );
	
	// D
	
//	wire D_IsBr=IsBr, D_Jump=Jump, D_JType=JType;
	wire D_DImmSel=DImmSel;
	wire [1:0] D_A3Sel=A3Sel;
	
	assign InstrtoCT=FD_InstrOut;
	
	wire [4:0] D_rs=FD_InstrOut[25:21];
	wire [4:0] D_rt=FD_InstrOut[20:16];
	wire [4:0] D_rd=FD_InstrOut[15:11];
	wire [15:0] D_Imm=FD_InstrOut[15:0];
	wire [4:0] D_Shamt=FD_InstrOut[10:6];
	
	//RF
	
	wire [31:0] D_RFRD1,D_RFRD2;
	
	//wires down

	regfile RF (
		.clk(clk), 
		.reset(reset), 
		.A1(D_rs), 
		.A2(D_rt),
		.A3(MW_A3Out),
		.WD(MW_ResultOut), 
		.WE(MW_RegWEOut), 
		.RD1(D_RFRD1), 
		.RD2(D_RFRD2), 
		.TPC(MW_PCOut)
    );
	
//	wire [31:0] D_RD1;
	wire [31:0] D_RD2;
	
	mux4#32 FW_mux_D_RD1(D_RFRD1,DE_ImmOut,EM_ResultOut,MW_ResultOut,D1FWSel,D_RD1);
	mux4#32 FW_mux_D_RD2(D_RFRD2,DE_ImmOut,EM_ResultOut,MW_ResultOut,D2FWSel,D_RD2);
	
	//EXT
	
	wire [31:0] D_EXTResult;
	
	ext EXT (
		.Imm(D_Imm), 
		.EXTCtrl(EXTCtrl), 
		.Result(D_EXTResult)
    );
	
	//BC
	
	Branch_Control BC (
		.RD1(D_RD1), 
		.RD2(D_RD2), 
		.rt(D_rt), 
		.IsBr(D_IsBr), 
		.Br(D_Br),
		.Opcode(FD_InstrOut[31:26])
    );
	
	wire [31:0] D_ImmResult;
	mux2#32 FC_mux_D_ImmResult(D_EXTResult,FD_PCAdd8Out,D_DImmSel,D_ImmResult);
	
	wire [4:0] D_A3;
	mux4#5 FC_mux_D_A3(D_rd,D_rt,5'h1f,5'h0,D_A3Sel,D_A3);
	
	//DEreg
	wire [31:0] DE_RD1Out, DE_RD2Out;
//	wire [31:0] DEImmOut;
	wire [4:0] DE_A3Out, DE_ShamtOut;
	wire DE_ALUBSelOut, DE_EResultSelOut, DE_DMWEOut, DE_DataWBSelOut, DE_RegWEOut;
	wire [2:0] DE_SLCtrlOut;
	wire [7:0] DE_ALUCtrlOut;
	
	wire [31:0] DE_PCOut;
	
	DEreg DEreg (
		.clk(clk), 
		.reset(reset), 
		.clr(stall), 
		//Data
		.RD1In(D_RD1), 
		.RD2In(D_RD2), 
		.ImmIn(D_ImmResult), 
		.A3In(D_A3),
		.ShamtIn(D_Shamt),
		.RD1Out(DE_RD1Out), 
		.RD2Out(DE_RD2Out), 
		.ImmOut(DE_ImmOut), 
		.A3Out(DE_A3Out), 
		.ShamtOut(DE_ShamtOut), 
		//Ctrl
		.ALUBSelIn(ALUBSel), 
		.EResultSelIn(EResultSel),
		.DMWEIn(DMWE),
		.DataWBSelIn(DataWBSel),
		.RegWEIn(RegWE),
		.ALUCtrlIn(ALUCtrl), 
		.SLCtrlIn(SLCtrl), 
		.ALUBSelOut(DE_ALUBSelOut), 
		.EResultSelOut(DE_EResultSelOut), 
		.DMWEOut(DE_DMWEOut), 
		.DataWBSelOut(DE_DataWBSelOut), 
		.RegWEOut(DE_RegWEOut), 
		.ALUCtrlOut(DE_ALUCtrlOut), 
		.SLCtrlOut(DE_SLCtrlOut), 
		//PC
		.PCIn(FD_curPCOut), 
		.PCOut(DE_PCOut)
	);
	
	assign DE_RegWE=DE_RegWEOut;
	
	// E
	
	wire [31:0] E_RD1, E_RD2;
	
	mux4#32 FW_mux_E_RD1(DE_RD1Out,EM_ResultOut,MW_ResultOut,32'h0,E1FWSel,E_RD1);
	mux4#32 FW_mux_E_RD2(DE_RD2Out,EM_ResultOut,MW_ResultOut,32'h0,E2FWSel,E_RD2);
	
	wire [31:0] E_ALUSrcB;
	
	mux2#32 FC_mux_E_ALUSrcB(E_RD2,DE_ImmOut,DE_ALUBSelOut,E_ALUSrcB);
	
	//ALU
	
	wire [31:0] E_ALUResult;
	alu ALU (
		.SrcA(E_RD1), 
		.SrcB(E_ALUSrcB), 
		.Shamt(DE_ShamtOut), 
		.ALUCtrl(DE_ALUCtrlOut), 
		.Result(E_ALUResult)
	);
	
	wire [31:0] E_Result;
	mux2#32 FC_mux_E_Result(E_ALUResult,DE_ImmOut,DE_EResultSelOut,E_Result);
	
	// EM
//	wire [31:0] EM_ResultOut;
	wire [31:0] EM_RD2Out;
	wire [4:0] EM_A3Out;
	wire EM_DMWEOut, EM_DataWBSelOut, EM_RegWEOut;
	wire [2:0] EM_SLCtrlOut;
	wire [31:0] EM_PCOut;
	
	EMreg EMreg (
    .clk(clk), 
    .reset(reset), 
	//Data
    .ResultIn(E_Result), 
    .RD2In(E_RD2), 
    .A3In(DE_A3Out),
	
    .ResultOut(EM_ResultOut), 
    .RD2Out(EM_RD2Out), 
    .A3Out(EM_A3Out), 
	//Ctrl
    .DMWEIn(DE_DMWEOut), 
    .DataWBSelIn(DE_DataWBSelOut), 
    .RegWEIn(DE_RegWEOut), 
    .SLCtrlIn(DE_SLCtrlOut), 
	
    .DMWEOut(EM_DMWEOut), 
    .DataWBSelOut(EM_DataWBSelOut), 
    .RegWEOut(EM_RegWEOut), 
    .SLCtrlOut(EM_SLCtrlOut), 
	//PC
    .PCIn(DE_PCOut), 
    .PCOut(EM_PCOut)
    );
	
	assign EM_RegWE=EM_RegWEOut;
	// M
	
	wire [31:0] M_RD2;
	
	mux4#32 FW_mux_M_RD2(EM_RD2Out,MW_ResultOut,32'h0,32'h0,M2FWSel,M_RD2);
	
	//SC
	
	wire [31:0] M_SCDout, M_SCAdrout;
	wire [1:0] M_SCWLen;
	
	savecalc SC (
    .Din(M_RD2), 
    .Adrin(EM_ResultOut), 
    .SLCtrl(EM_SLCtrlOut), 
    .Dout(M_SCDout),
	.Adrout(M_SCAdrout),
    .WLen(M_SCWLen)
    );
	
	assign DMAdr=M_SCAdrout;
	assign DMDataW=M_SCDout;
	assign DMWLen=M_SCWLen;
	assign DMcurWE=EM_DMWEOut;
	assign DMcurPC=EM_PCOut;
	
	//LC
	
	wire [1:0] M_LCbytesel=EM_ResultOut[1:0];
	
	wire [31:0] M_LCDout;
	
	loadcalc LC (
		.memD(DMDataR), 
		.GRFD(M_RD2), 
		.bytesel(M_LCbytesel), 
		.SLCtrl(EM_SLCtrlOut), 
		.Dout(M_LCDout)
    );
	
	wire [31:0] M_Result;
	
	mux2#32 FC_mux_M_Result(EM_ResultOut,M_LCDout,EM_DataWBSelOut,M_Result);
	
	//MW 
	
//	wire [31:0] MW_ResultOut;
//	wire [4:0] MW_A3Out;
//	wire MW_RegWEOut;
//	wire [31:0] MW_PCOut;
	
	MWreg MWreg (
		.clk(clk), 
		.reset(reset), 
		//Data
		.ResultIn(M_Result), 
		.A3In(EM_A3Out), 
		.ResultOut(MW_ResultOut), 
		.A3Out(MW_A3Out), 
		//Ctrl
		.RegWEIn(EM_RegWEOut), 
		.RegWEOut(MW_RegWEOut), 
		//PC
		.PCIn(EM_PCOut), 
		.PCOut(MW_PCOut)
    );

	assign MW_RegWE=MW_RegWEOut;
	
endmodule
