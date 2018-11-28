`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:35:52 11/27/2018 
// Design Name: 
// Module Name:    MWreg 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module MWreg(
	input clk,
	input reset,
	//Data	
	input [31:0] ResultIn,
	input [4:0] A3In,
	output [31:0] ResultOut,
	output [4:0] A3Out,
	//Ctrl
	input RegWEIn,
	output RegWEOut,
	//PC
	input [31:0] PCIn,
	output [31:0] PCOut
	);
	
	reg [31:0] Result=0;
	reg [4:0] A3=0;
	
	assign ResultOut=Result;
	assign A3Out=A3;
	
	reg RegWE=0;
	
	assign RegWEOut=RegWE;
	
	reg [31:0] PC=0;
	assign PCOut=PC;
	
	always @(posedge clk)
	begin
		if(reset)
		begin
			Result<=0;
			A3<=0;
			RegWE<=0;
			PC<=0;
		end
		else
		begin
			Result<=ResultIn;
			A3<=A3In;
			RegWE<=RegWEIn;
			PC<=PCIn;
		end
	end

endmodule
