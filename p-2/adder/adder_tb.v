`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:43:32 10/11/2018
// Design Name:   adder
// Module Name:   C:/Users/lyt/Documents/project/co/p-2/adder/adder_tb.v
// Project Name:  adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module adder_tb;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;
	reg Clk;
	reg En;

	// Outputs
	wire [3:0] Sum;
	wire Overflow;

	// Instantiate the Unit Under Test (UUT)
	adder uut (
		.A(A), 
		.B(B), 
		.Clk(Clk), 
		.En(En), 
		.Sum(Sum), 
		.Overflow(Overflow)
	);
	integer i,j;
	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		Clk = 0;
		En = 0;

		// Wait 100 ns for global reset to finish
		// Add stimulus here
		En=1;
		for(i=0;i<=15;i=i+1)
		begin
			for(j=0;j<=15;j=j+1)
			begin
				A=i;
				B=j;
				Clk=1;
				#10;
				Clk=0;
				#10;
			end
		end
	end
      
endmodule

