`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:52:53 10/25/2018
// Design Name:   string
// Module Name:   C:/Users/lyt/Documents/project/co/p1/string/string_tb.v
// Project Name:  string
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: string
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module string_tb;

	// Inputs
	reg clk;
	reg clr;
	reg [7:0] in;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	string uut (
		.clk(clk), 
		.clr(clr), 
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		clr = 0;
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        clr<=1;
		#10;
		clr<=0;
		in<="3";
		#10;
		in<="+";
		#10;
		in<="5";
		#10;
		in<="*";
		#10
		in<="9";
		#10
		in<="9";
		#10
		in<="+";
		#10
		in<="9";
		#10
		clr<=1;
		#10
		in<="0";

	end
	
	always #5 clk=~clk;
      
endmodule

