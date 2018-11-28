`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:52:09 11/21/2018
// Design Name:   savecalc
// Module Name:   C:/Users/lyt/Documents/project/co/p4/mips/SC_tb.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: savecalc
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SC_tb;

	// Inputs
	reg [31:0] Din;
	reg [1:0] bytesel;
	reg [2:0] SLCtrl;

	// Outputs
	wire [31:0] Dout;
	wire [1:0] DMWLen;

	// Instantiate the Unit Under Test (UUT)
	savecalc uut (
		.Din(Din), 
		.bytesel(bytesel), 
		.SLCtrl(SLCtrl), 
		.Dout(Dout), 
		.DMWLen(DMWLen)
	);

	initial begin
		// Initialize Inputs
		Din = 0;
		bytesel = 0;
		SLCtrl = 0;

		// Wait 100 ns for global reset to finish
		#100;
        Din=32'h12345678;
		bytesel=1;
		SLCtrl=0;
		#10;
		SLCtrl=1;
		#10;
		SLCtrl=2;
		#10;
		SLCtrl=3;
		#10;
		SLCtrl=4;
		#10;
		// Add stimulus here

	end
      
endmodule

