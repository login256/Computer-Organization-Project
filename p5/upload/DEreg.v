`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:34:27 11/27/2018 
// Design Name: 
// Module Name:    DEreg 
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
module DEreg(
	input clk,
	input reset,
	input clr,
	//Data
	input [31:0] RD1In,
	input [31:0] RD2In,
	input [31:0] ImmIn,
	input [4:0] A3In,
	input [4:0] ShamtIn,
	output [31:0] RD1Out,
	output [31:0] RD2Out,
	output [31:0] ImmOut,
	output [4:0] A3Out,
	output [4:0] ShamtOut,
	//Ctrl
	input ALUBSelIn,
	input EResultSelIn,
	input DMWEIn,
	input DataWBSelIn,
	input RegWEIn,
	input [7:0] ALUCtrlIn,
	input [2:0] SLCtrlIn,
    
	output ALUBSelOut,
	output EResultSelOut,
	output DMWEOut,
	output DataWBSelOut,
	output RegWEOut,
	output [7:0] ALUCtrlOut,
	output [2:0] SLCtrlOut,
	//PC
	input [31:0] PCIn,
	output [31:0] PCOut
    );
	
	reg [31:0] RD1=0, RD2=0, Imm=0;
	reg [4:0] A3=0, Shamt=0;
	
	assign RD1Out=RD1;
	assign RD2Out=RD2;
	assign ImmOut=Imm;
	assign A3Out=A3;
	assign ShamtOut=Shamt;
	
	reg ALUBSel=0,EResultSel=0,DMWE=0,DataWBSel=0,RegWE=0;
	reg [7:0] ALUCtrl=0;
	reg [2:0] SLCtrl=0;
	
	assign ALUBSelOut=ALUBSel;
	assign EResultSelOut=EResultSel;
	assign DMWEOut=DMWE;
	assign DataWBSelOut=DataWBSel;
	assign RegWEOut=RegWE;
	assign ALUCtrlOut=ALUCtrl;
	assign SLCtrlOut=SLCtrl;
	
	reg [31:0] PC=0;
	assign PCOut=PC;
	
	always @(posedge clk, posedge reset)
	begin
		if(reset||clr)
		begin
			RD1<=0;
			RD2<=0;
			Imm<=0;
			A3<=0;
			Shamt<=0;
			ALUBSel<=0;
			EResultSel<=0;
			DMWE<=0;
			DataWBSel<=0;
			RegWE<=0;
			ALUCtrl<=0;
			SLCtrl<=0;
			PC<=0;
		end
		else
		begin
			RD1<=RD1In;
			RD2<=RD2In;
			Imm<=ImmIn;
			A3<=A3In;
			Shamt<=ShamtIn;
			ALUBSel<=ALUBSelIn;
			EResultSel<=EResultSelIn;
			DMWE<=DMWEIn;
			DataWBSel<=DataWBSelIn;
			RegWE<=RegWEIn;
			ALUCtrl<=ALUCtrlIn;
			SLCtrl<=SLCtrlIn;
			PC<=PCIn;
		end
	end

endmodule
