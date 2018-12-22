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
	input [1:0]EResultSel,
	input MDUEN,
	input DMWE,
	input DataWBSel,
	input RegWE,
	input [1:0] EXTCtrl,
	input [7:0] ALUCtrl,
	input [2:0] SLCtrl,
	input [2:0] MDUCtrl,
	//RegWEout
	output DE_RegWE,
	output EM_RegWE,
	output MW_RegWE,
	//Busy
	output MDUBusy,
	output DE_MDUEN,
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
	input [31:0] DataR,
	output [31:0] IOAddr,
	output OutWE,
	output [3:0] DMByteEN,
	output [31:0] DataW,
	output [31:0] DMcurPC,
	//IM
	output [31:0] PC_Fetch,
	input [31:0] Fetch_Instr,
	//Int
	input [5:0] HWInt,
	//Exc
	output ExcInOut
    );
	
	//General wires
	
	//for jump and branch
	wire [31:0] FD_InstrOut;
	wire [31:0] D_RD1;
	wire D_IsBr=IsBr, D_Jump=Jump, D_JType=JType;
	wire D_Br;
	
	//for last level
	wire [4:0] MW_A3Out;
	wire MW_RegWEOut;
	wire [31:0] MW_PCOut;
	wire [31:0] W_Result;
	wire [31:0] W_ResultOut;
	
	//for FW
	wire [31:0] DE_ImmOut;
	wire [31:0] EM_ResultOut;
	
	//for Exc
	wire [31:0] M_CP0EPCOut;
	wire M_ExcNow;
	wire M_IsERET;
	wire M_ExcInOut;
	
	// F
	
	wire [31:0] F_NPC, F_curPC, F_PCAdd8;
	
	wire F_IsBD;
	
	nextPC  CalcPC(
		.curPC(F_curPC), 
		.BrImm(FD_InstrOut[15:0]), 
		.JImm(FD_InstrOut[25:0]), 
		.JRImm(D_RD1), 
		.Br(D_Br),
		.Jump(D_Jump), 
		.JType(D_JType), 
		.NPC(F_NPC), 
		.PCAdd8(F_PCAdd8)//,
//		.IsBD(F_IsBD)
    );
	
	wire [31:0] F_PCorEPC;
	
	mux2#32 EXC_mux_F_PCorEPC(F_NPC,M_CP0EPCOut,M_IsERET,F_PCorEPC);
	
	wire [31:0] F_PCtoPCreg;
	
	mux2#32 EXC_mux_F_PCorHandle(F_PCorEPC,32'h00004180,M_ExcNow,F_PCtoPCreg);
	
	PCmem PCreg(
		.clk(clk), 
		.reset(reset),
		.EN((~stall)|M_ExcInOut),
		.NPC(F_PCtoPCreg), 
		.PC(F_curPC)
	);
	
	wire [31:0] F_IMMPCFetch, F_IMMInstr;
	
	wire F_ExcADEL;
	
	IMManager IMManager (
		.PCIn(F_curPC), 
		.PCFetch(F_IMMPCFetch), 
		.Instr_Fetch(Fetch_Instr), 
		.Instr(F_IMMInstr), 
		.ExcADEL(F_ExcADEL)
	);
	
	assign PC_Fetch=F_IMMPCFetch;

	//Checker
	
	wire F_ExcGet;
	wire [4:0] F_ExcCode;
	
	F_ExcChecker F_ExcChecker (
		.ExcADEL(F_ExcADEL), 
		.ExcGet(F_ExcGet), 
		.ExcCode(F_ExcCode)
		);
	// FD 
	
//	wire [31:0] FD_InstrOut;
	wire [31:0] FD_PCAdd8Out, FD_curPCOut;
	wire FD_BDOut;
	wire FD_ExcGetOut;
	wire [4:0] FD_ExcCodeOut;
	
	FDreg FDreg (
		.clk(clk), 
		.reset(reset),
		.ExcClr(M_ExcInOut),
		.EN(~stall), 
		.InstrIn(F_IMMInstr), 
		.PCAdd8In(F_PCAdd8), 
		.curPCIn(F_curPC), 
		.InstrOut(FD_InstrOut), 
		.PCAdd8Out(FD_PCAdd8Out), 
		.curPCOut(FD_curPCOut),
		//BD
//		.BDIn(F_IsBD),
		.BDIn(D_IsBr|D_Jump),
		.BDOut(FD_BDOut),
		//Exc
		.ExcGetIn(F_ExcGet),
		.ExcCodeIn(F_ExcCode),
		.ExcGetOut(FD_ExcGetOut),
		.ExcCodeOut(FD_ExcCodeOut),
		//EPC
		.EPC(M_CP0EPCOut)
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
		.WD(W_Result), 
		.WE(MW_RegWEOut), 
		.RD1(D_RFRD1), 
		.RD2(D_RFRD2), 
		.TPC(MW_PCOut)
    );
	
//	wire [31:0] D_RD1;
	wire [31:0] D_RD2;
	
	mux4#32 FW_mux_D_RD1(D_RFRD1,DE_ImmOut,EM_ResultOut,W_ResultOut,D1FWSel,D_RD1);
	mux4#32 FW_mux_D_RD2(D_RFRD2,DE_ImmOut,EM_ResultOut,W_ResultOut,D2FWSel,D_RD2);
	
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
	mux4#5 FC_mux_D_A3(D_rd,D_rt,D_rs,5'h1f,D_A3Sel,D_A3);
	
	//D_Checker
	
	wire D_ExcGet;
	wire [4:0] D_ExcCode;
	
	D_ExcCheker D_ExcCheker(
		.PreExcGet(FD_ExcGetOut), 
		.PreExcCode(FD_ExcCodeOut), 
		.Instr(FD_InstrOut), 
		.ExcGet(D_ExcGet), 
		.ExcCode(D_ExcCode)
		);
	
	//DEreg
	wire [31:0] DE_RD1Out, DE_RD2Out;
//	wire [31:0] DEImmOut; 
	wire [4:0] DE_A3Out, DE_ShamtOut;
	wire DE_ALUBSelOut, DE_MDUENOut, DE_DMWEOut, DE_DataWBSelOut, DE_RegWEOut;
	wire [1:0] DE_EResultSelOut;
	wire [2:0] DE_SLCtrlOut,DE_MDUCtrlOut;
	wire [7:0] DE_ALUCtrlOut;
	
	wire [31:0] DE_InstrOut;
	wire DE_BDOut;
	wire [31:0] DE_PCOut;
	
	wire DE_ExcGetOut;
	wire [4:0] DE_ExcCodeOut;
	
	DEreg DEreg (
		.clk(clk), 
		.reset(reset), 
		.StallClr(stall), 
		.ExcClr(M_ExcInOut),
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
		.MDUENIn(MDUEN),
		.DMWEIn(DMWE),
		.DataWBSelIn(DataWBSel),
		.RegWEIn(RegWE),
		.ALUCtrlIn(ALUCtrl), 
		.SLCtrlIn(SLCtrl), 
		.MDUCtrlIn(MDUCtrl),
		.ALUBSelOut(DE_ALUBSelOut), 
		.EResultSelOut(DE_EResultSelOut),
		.MDUENOut(DE_MDUENOut),
		.DMWEOut(DE_DMWEOut), 
		.DataWBSelOut(DE_DataWBSelOut), 
		.RegWEOut(DE_RegWEOut), 
		.ALUCtrlOut(DE_ALUCtrlOut), 
		.SLCtrlOut(DE_SLCtrlOut), 
		.MDUCtrlOut(DE_MDUCtrlOut),
		//Instr
		.InstrIn(FD_InstrOut),
		.InstrOut(DE_InstrOut),
		//Exc
		.ExcGetIn(D_ExcGet),
		.ExcCodeIn(D_ExcCode),
		.ExcGetOut(DE_ExcGetOut),
		.ExcCodeOut(DE_ExcCodeOut),
		//BD
		.BDIn(FD_BDOut),
		.BDOut(DE_BDOut),
		//PC
		.PCIn(FD_curPCOut), 
		.PCOut(DE_PCOut),
		//EPC
		.EPC(M_CP0EPCOut)
	);
	
	assign DE_RegWE=DE_RegWEOut;
	assign DE_MDUEN=DE_MDUENOut;
	
	// E
	
	wire [31:0] E_RD1, E_RD2;
	
	mux4#32 FW_mux_E_RD1(DE_RD1Out,EM_ResultOut,W_ResultOut,32'h0,E1FWSel,E_RD1);
	mux4#32 FW_mux_E_RD2(DE_RD2Out,EM_ResultOut,W_ResultOut,32'h0,E2FWSel,E_RD2);
	
	wire [31:0] E_ALUSrcB;
	
	mux2#32 FC_mux_E_ALUSrcB(E_RD2,DE_ImmOut,DE_ALUBSelOut,E_ALUSrcB);
	
	//ALU
	
	wire [31:0] E_ALUResult;
	wire E_Overflow;
	alu ALU (
		.SrcA(E_RD1), 
		.SrcB(E_ALUSrcB), 
		.Shamt(DE_ShamtOut), 
		.ALUCtrl(DE_ALUCtrlOut), 
		.Result(E_ALUResult),
		.Overflow(E_Overflow)
	);
	
	//MDU
	
	wire [31:0] E_MDUlo, E_MDUhi;
	wire E_MDUBusy,E_MDUWillBusy;
	
	multi_divi_unit MDU (
		.clk(clk), 
		.reset(reset), 
		.SrcA(E_RD1), 
		.SrcB(E_RD2), 
		.Start(DE_MDUENOut),
		.EN(~M_ExcInOut),
		.MDUCtrl(DE_MDUCtrlOut), 
		.lo(E_MDUlo), 
		.hi(E_MDUhi), 
		.Busy(E_MDUBusy),
		.WillBusy(E_MDUWillBusy)
	);
	
	assign MDUBusy=E_MDUWillBusy;
	
	wire [31:0] E_Result;
	mux4#32 FC_mux_E_Result(E_ALUResult,DE_ImmOut,E_MDUlo,E_MDUhi,DE_EResultSelOut,E_Result);
	
	//E_Cheker
	
	wire E_ExcGet;
	wire [4:0] E_ExcCode;
	
	E_ExcChecker E_ExcChecker (
		.PreExcGet(DE_ExcGetOut), 
		.PreExcCode(DE_ExcCodeOut), 
		.Instr(DE_InstrOut), 
		.Overflow(E_Overflow), 
		.ExcGet(E_ExcGet), 
		.ExcCode(E_ExcCode)
		);
	
	// EM
//	wire [31:0] EM_ResultOut;
	wire [31:0] EM_RD2Out;
	wire [4:0] EM_A3Out;
	wire EM_DMWEOut, EM_DataWBSelOut, EM_RegWEOut;
	wire [2:0] EM_SLCtrlOut;
	wire [31:0] EM_InstrOut;
	wire [31:0] EM_PCOut;
	wire EM_BDOut;
	wire EM_ExcGetOut;
	wire [4:0] EM_ExcCodeOut;
	
	EMreg EMreg (
		.clk(clk), 
		.reset(reset), 
		.ExcClr(M_ExcInOut),
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
		
		//Instr
		.InstrIn(DE_InstrOut),
		.InstrOut(EM_InstrOut),
		
		//Exc
		.ExcGetIn(E_ExcGet),
		.ExcCodeIn(E_ExcCode),
		.ExcGetOut(EM_ExcGetOut),
		.ExcCodeOut(EM_ExcCodeOut),
	
		//BD
		.BDIn(DE_BDOut),
		.BDOut(EM_BDOut),
		
		//PC
		.PCIn(DE_PCOut), 
		.PCOut(EM_PCOut),
		
		//EPC
		.EPC(M_CP0EPCOut)
		);
	
	assign EM_RegWE=EM_RegWEOut;
	// M
	
	wire [31:0] M_RD2;
	
	mux4#32 FW_mux_M_RD2(EM_RD2Out,W_ResultOut,32'h0,32'h0,M2FWSel,M_RD2);
	
	//SC
	
	wire [31:0] M_SCDout, M_SCAdrout;
	wire [3:0] M_SCByteEN;
	
	savecalc SC (
    .Din(M_RD2), 
    .Adrin(EM_ResultOut), 
    .SLCtrl(EM_SLCtrlOut), 
    .Dout(M_SCDout),
	.Adrout(M_SCAdrout),
    .ByteEN(M_SCByteEN)
    );
	
	assign IOAddr=M_SCAdrout;
	assign DataW=M_SCDout;
	assign DMByteEN=M_SCByteEN;
	assign OutWE=EM_DMWEOut&(~M_ExcInOut);
	assign DMcurPC=EM_PCOut;
	
	//M_Checker
	
	wire M_ExcGet;
	wire [4:0] M_ExcCode;
	
	M_ExcChecker M_ExcChecker (
		.PreExcGet(EM_ExcGetOut),
		.PreExcCode(EM_ExcCodeOut),
		.Instr(EM_InstrOut), 
		.ByteSel(EM_ResultOut[1:0]), 
		.Addr(EM_ResultOut), 
		.ExcGet(M_ExcGet),
		.ExcCode(M_ExcCode)
		);
	
	//CP0CT
	
	wire M_CPOWE;
	wire M_MResultSel;
//	wire M_IsERET;
	
	CP0Controller CP0CT (
		.Instr(EM_InstrOut), 
		.CP0WE(M_CP0WE), 
		.MResultSel(M_MResultSel), 
		.IsERET(M_IsERET)
		);

	//CP0
	
//	wire M_ExcNow;
//	wire [31:0] M_CP0EPCOut;
	wire [31:0] M_CP0Dout;
	
	coprocessor0 CP0 (
		.clk(clk), 
		.reset(reset), 
		.A(EM_InstrOut[15:11]), 
		.Din(EM_RD2Out),  
		.WE(M_CP0WE), 
		.Dout(M_CP0Dout), 
		.ExcReq(M_ExcGet),
		.ExcCodeIn(M_ExcCode),
		.PCIn(EM_PCOut[31:2]), 
		.BDIn(EM_BDOut), 
		.HWInt(HWInt), 
		.ExcNow(M_ExcNow), 
		.EXLClr(M_IsERET), 
		.EPCOut(M_CP0EPCOut)
    );
	
//	wire M_ExcInOut;
	assign M_ExcInOut=M_IsERET|M_ExcNow;
	assign ExcInOut=M_ExcInOut;
	
	wire [31:0] M_Result;
	
	mux2#32 FC_mux_M_Result(EM_ResultOut,M_CP0Dout,M_MResultSel,M_Result);
	
	//MW 
	
	wire [31:0] MW_ResultOut;
	wire [31:0] MW_RD2Out;
	wire [31:0] MW_DMDataROut;
//	wire [4:0] MW_A3Out;
	wire MW_DataWBSelOut;
	wire [2:0] MW_SLCtrlOut;
//	wire MW_RegWEOut;
//	wire [31:0] MW_PCOut;
	
	MWreg MWreg (
		.clk(clk), 
		.reset(reset),
		.ExcClr(M_ExcInOut),
		//Data
		.ResultIn(M_Result), 
		.RD2In(M_RD2),
		.A3In(EM_A3Out), 
		.DMDataRIn(DataR),
		.ResultOut(MW_ResultOut), 
		.RD2Out(MW_RD2Out),
		.A3Out(MW_A3Out),
		.DMDataROut(MW_DMDataROut),
		//Ctrl
		.DataWBSelIn(EM_DataWBSelOut), 
		.RegWEIn(EM_RegWEOut), 
		.SLCtrlIn(EM_SLCtrlOut), 
		
		.DataWBSelOut(MW_DataWBSelOut), 
		.RegWEOut(MW_RegWEOut), 
		.SLCtrlOut(MW_SLCtrlOut),
		//PC
		.PCIn(EM_PCOut), 
		.PCOut(MW_PCOut)
    );

	assign MW_RegWE=MW_RegWEOut;

	//LC
	
	wire [1:0] W_LCbytesel=MW_ResultOut[1:0];
	
	wire [31:0] W_LCDout;
	
	loadcalc LC (
		.memD(MW_DMDataROut), 
		.GRFD(MW_RD2Out), 
		.bytesel(W_LCbytesel), 
		.SLCtrl(MW_SLCtrlOut), 
		.Dout(W_LCDout)
    );
	
	//wire [31:0] W_Result;
	
	mux2#32 FC_mux_W_Result(MW_ResultOut,W_LCDout,MW_DataWBSelOut,W_ResultOut);
	
	assign W_Result=W_ResultOut;
	
endmodule
