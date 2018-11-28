`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:20:11 11/18/2018
// Design Name:   datapath
// Module Name:   C:/Users/lyt/Documents/project/co/p4/mips/DP_tb.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: datapath
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DP_tb;

	// Inputs
	reg clk;
	reg reset;
	reg IsBr;
	reg Jump;
	reg JType;
	reg RegA3Sel;
	reg SaveRA;
	reg [1:0] DatatoReg;
	reg RegWE;
	reg ALUBSel;
	reg [1:0] EXTCtrl;
	reg [7:0] ALUCtrl;
	reg [31:0] Instr;
	reg [31:0] DMDataR;

	// Outputs
	wire [31:0] DMAdr;
	wire [31:0] DMDataW;
	wire [31:0] PC;

	// Instantiate the Unit Under Test (UUT)
	datapath uut (
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
		.DMDataW(DMDataW), 
		.PC(PC)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		IsBr = 0;
		Jump = 0;
		JType = 0;
		RegA3Sel = 0;
		SaveRA = 0;
		DatatoReg = 0;
		RegWE = 0;
		ALUBSel = 0;
		EXTCtrl = 0;
		ALUCtrl = 0;
		Instr = 0;
		DMDataR = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

