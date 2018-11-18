`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:21:05 11/18/2018
// Design Name:   cpu
// Module Name:   C:/Users/lyt/Documents/project/co/p4/mips/CPU_tb.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: cpu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPU_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [31:0] Instr;
	reg [31:0] DMDataR;

	// Outputs
	wire [31:0] PC;
	wire [31:0] DMAdr;
	wire DMWE;
	wire [31:0] DMDataW;

	// Instantiate the Unit Under Test (UUT)
	cpu uut (
		.clk(clk), 
		.reset(reset), 
		.Instr(Instr), 
		.DMDataR(DMDataR), 
		.PC(PC), 
		.DMAdr(DMAdr), 
		.DMWE(DMWE), 
		.DMDataW(DMDataW)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		Instr = 0;
		DMDataR = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		Instr=32'h1211000b;
		
		// Add stimulus here

	end
      
endmodule

