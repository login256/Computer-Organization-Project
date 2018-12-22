`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:18:25 12/01/2018
// Design Name:   multi_divi_unit
// Module Name:   C:/Users/lyt/Documents/project/co/p6/mips/cpu/datapath/component/MDU_tb.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: multi_divi_unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MDU_tb;

	// Inputs
	reg clk;
	reg reset;
	reg [31:0] SrcA;
	reg [31:0] SrcB;
	reg Start;
	reg [2:0] MDUCtrl;

	// Outputs
	wire [31:0] lo;
	wire [31:0] hi;
	wire Busy;

	// Instantiate the Unit Under Test (UUT)
	multi_divi_unit uut (
		.clk(clk), 
		.reset(reset), 
		.SrcA(SrcA), 
		.SrcB(SrcB), 
		.Start(Start), 
		.MDUCtrl(MDUCtrl), 
		.lo(lo), 
		.hi(hi), 
		.Busy(Busy)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		SrcA = 0;
		SrcB = 0;
		Start = 0;
		MDUCtrl = 0;

		// Wait 100 ns for global reset to finish
		#95;
		reset<=0;
		SrcA<=32'd65536;
		SrcB<=32'd100000;
		MDUCtrl<=3'h0;
		#10;
		Start<=1;
		#10;
		Start<=0;
		// Add stimulus here
	end
	
	always #5 clk=~clk;
      
endmodule

