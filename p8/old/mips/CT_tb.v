`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:37:40 11/18/2018
// Design Name:   controller
// Module Name:   C:/Users/lyt/Documents/project/co/p4/mips/CT_tb.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CT_tb;

	// Inputs
	reg [5:0] Opcode;
	reg [5:0] Funct;

	// Outputs
	wire IsBr;
	wire Jump;
	wire JType;
	wire RegA3Sel;
	wire SaveRA;
	wire [1:0] DatatoReg;
	wire RegWE;
	wire ALUBSel;
	wire DMWE;
	wire [1:0] EXTCtrl;
	wire [7:0] ALUCtrl;

	// Instantiate the Unit Under Test (UUT)
	controller uut (
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

	initial begin
		// Initialize Inputs
		Opcode = 0;
		Funct = 0;

		// Wait 100 ns for global reset to finish
		#100;
		Opcode=6'b001101;
        
		// Add stimulus here

	end
      
endmodule

