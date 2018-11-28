`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:25:37 11/18/2018
// Design Name:   mips
// Module Name:   C:/Users/lyt/Documents/project/co/p4/mips//mips_tb.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mips
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mips_tb;

	// Inputs
	reg clk;
	reg reset;

	// Instantiate the Unit Under Test (UUT)
	mips uut (
		.clk(clk), 
		.reset(reset)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		#20;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#15;
        reset<=0;
		// Add stimulus here
		#100;
		reset<=1;
		#20;
		reset<=0;
	end
      
	always #5 clk=~clk; 
	 
endmodule

