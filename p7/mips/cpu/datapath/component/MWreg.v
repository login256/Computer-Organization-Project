`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:35:52 11/27/2018 
// Design Name: 
// Module Name:    MWreg 
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
module MWreg(
	input clk,
	input reset,
	input ExcClr,
	//Data	
	input [31:0] ResultIn,
	input [31:0] RD2In,
	input [4:0] A3In,
	input [31:0] DMDataRIn,
	output [31:0] ResultOut,
	output [31:0] RD2Out,
	output [4:0] A3Out,
	output [31:0] DMDataROut,
	//Ctrl
	input DataWBSelIn,
	input RegWEIn,
	input [2:0] SLCtrlIn,
    
	output DataWBSelOut,
	output RegWEOut,
	output [2:0] SLCtrlOut,
	//PC
	input [31:0] PCIn,
	output [31:0] PCOut
    );
	
	reg [31:0] Result=0, RD2=0, DMDataR=0;
	reg [4:0] A3=0;
	
	assign ResultOut=Result;
	assign RD2Out=RD2;
	assign A3Out=A3;
	assign DMDataROut=DMDataR;
	
	reg DMWE=0,DataWBSel=0,RegWE=0;
	reg [2:0] SLCtrl=0;
	
	assign DataWBSelOut=DataWBSel;
	assign RegWEOut=RegWE;
	assign SLCtrlOut=SLCtrl;
	
	reg [31:0] PC=0;
	assign PCOut=PC;
	
	always @(posedge clk)
	begin
		if(reset)
		begin
			Result<=0;
			RD2<=0;
			A3<=0;
			DMDataR<=0;
			DataWBSel<=0;
			RegWE<=0;
			SLCtrl<=0;
			PC<=0;
		end
		else if(ExcClr)
		begin
			Result<=0;
			RD2<=0;
			A3<=0;
			DMDataR<=0;
			DataWBSel<=0;
			RegWE<=0;
			SLCtrl<=0;
			PC<=0;
		end
		else
		begin
			Result<=ResultIn;
			RD2<=RD2In;
			A3<=A3In;
			DMDataR<=DMDataRIn;
			DataWBSel<=DataWBSelIn;
			RegWE<=RegWEIn;
			SLCtrl<=SLCtrlIn;
			PC<=PCIn;
		end
	end

endmodule
