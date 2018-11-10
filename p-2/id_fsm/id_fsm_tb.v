`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:46:38 10/12/2018
// Design Name:   id_fsm
// Module Name:   C:/Users/lyt/Documents/project/co/p-2/id_fsm/id_fsm_tb.v
// Project Name:  id_fsm
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: id_fsm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module id_fsm_tb;

	// Inputs
	reg [7:0] char;
	reg clk;

	// Outputs
	wire out;

	// Instantiate the Unit Under Test (UUT)
	id_fsm uut (
		.char(char), 
		.clk(clk), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		char = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		char=8'd100;
		#10;
		char=8'd102;
		#10;
		char=8'd49;
		#10
		char=8'd55;
		#10;
		char=8'd121;
		#10;
		char=8'd50;
		#10;
		char=8'd10;
		
		
	end
    
	always #5 clk=~clk;
	
endmodule

