`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:54:15 10/12/2018
// Design Name:   buffer
// Module Name:   C:/Users/lyt/Documents/project/co/p-2/try/buffer_tb.v
// Project Name:  try
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: buffer
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module buffer_tb;

	// Inputs
	reg clk;
	reg in;
	
	wire out;

	// Instantiate the Unit Under Test (UUT)
	buffer uut (
		.clk(clk), 
		.in(in),
		.out(out)
	);

	initial begin
		// Initialize Inputs
		clk= 1;
		in = 0;
		#10;
		in=1;
		#10;
		in=0;
		#10;
		in=1;
	end
	
	always #5 clk=~clk;
      
endmodule

