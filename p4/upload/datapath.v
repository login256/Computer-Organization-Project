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
	input IsBr,
	input Jump,
	input JType,
	input RegA3Sel,
	input SaveRA,
	input [1:0] DatatoReg,
	input RegWE,
	input ALUBSel,
	input [1:0]EXTCtrl,
	input [7:0] ALUCtrl,
    input [31:0] Instr,
	input [31:0] DMDataR,
	input [2:0] SLCtrl,
	output [31:0] DMAdr,
	output [1:0] DMWLen,
	output [31:0] DMDataW,
	output [31:0] PC
    );
	
	//General wire
	wire [4:0] rs,rt,rd;
	wire [15:0]Imm;
	
	assign rs=Instr[25:21];
	assign rt=Instr[20:16];
	assign rd=Instr[15:11];
	assign Imm=Instr[15:0];
	
	//PC wire
	wire [31:0] BrImm, JRImm;
	wire [25:0] JImm;
	wire [31:0] PCAdd4,NPC;
	
	//RF wire
	wire [4:0] GRFA1,GRFA2,GRFA3;
	wire [31:0] GRFWD, GRFRD1, GRFRD2;
	
	//EXT wire
	wire [15:0] EXTImm;
	wire [31:0] EXTResult;
	
	//ALU wire
	wire [31:0] ALUSrcA, ALUSrcB, ALUResult;
	wire [4:0] ALUShamt;
	wire ALUzero;
	
	//SC wire
	wire [31:0] SCDin,SCDout,SCAdrin,SCAdrout;
	wire [1:0] SCbytesel;
	wire [1:0] SCWLen;
	
	//BC wire
	wire Br;
	
//DM
	assign DMAdr=SCAdrout;
	assign DMDataW=SCDout;
	assign DMWLen=SCWLen;
	
//next PC
	
	assign JRImm=GRFRD1;
	assign JImm=Instr[25:0];
	assign BrImm=EXTResult;
	
	nextPC CalcPC (
		.curPC(PC), 
		.BrImm(BrImm), 
		.JImm(JImm), 
		.JRImm(JRImm), 
		.Br(Br), 
		.Jump(Jump), 
		.JType(JType), 
		.NPC(NPC), 
		.PCAdd4(PCAdd4)
    );

	PCmem PCmem (
		.clk(clk), 
		.reset(reset), 
		.NPC(NPC), 
		.PC(PC)
	);

	
//RF

	wire [4:0] muxRegA3Sel_Out;
		
	assign GRFA1=rs;
	assign GRFA2=rt;
	
	mux2#5 mux_RegA3Sel(rd,rt,RegA3Sel,muxRegA3Sel_Out);
	mux2#5 mux_SaveRA(muxRegA3Sel_Out,5'h1f,SaveRA,GRFA3);	//GRFA3
	
	mux4#32 mux_DatatoReg(ALUResult,DMDataR,PCAdd4,32'd0,DatatoReg,GRFWD);	//GRFWD
	
	regfile GRF (
		.clk(clk), 
		.reset(reset), 
		.A1(GRFA1), 
		.A2(GRFA2), 
		.A3(GRFA3), 
		.WD(GRFWD), 
		.WE(RegWE), 
		.RD1(GRFRD1), 
		.RD2(GRFRD2), 
		.PC(PC)
    );
	
//EXT

	assign EXTImm=Imm;
	
	ext EXT (
		.Imm(EXTImm), 
		.EXTCtrl(EXTCtrl), 
		.Result(EXTResult)
    );
	
//ALU

	assign ALUSrcA=GRFRD1;
	assign ALUShamt=Instr[10:6];
	
	mux2#32 mux_ALUBSel(GRFRD2,EXTResult,ALUBSel,ALUSrcB);	//ALUSrcB
		
	alu ALU(
		.SrcA(ALUSrcA), 
		.SrcB(ALUSrcB), 
		.Shamt(ALUShamt), 
		.ALUCtrl(ALUCtrl), 
		.ALUResult(ALUResult), 
		.zero(ALUzero)
	);

//SC
	
	assign SCDin=GRFRD2;
	assign SCAdrin=ALUResult;
	
	savecalc SC (
    .Din(SCDin), 
    .Adrin(SCAdrin), 
    .SLCtrl(SLCtrl), 
    .Dout(SCDout),
	.Adrout(SCAdrout),
    .WLen(SCWLen)
    );

//BC
	assign Br=IsBr&(~ALUzero);

endmodule
