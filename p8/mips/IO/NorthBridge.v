`include"..\define.v"
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:56:30 12/22/2018 
// Design Name: 
// Module Name:    NorthBridge 
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
module NorthBridge(
	input [31:0] Addr,
	input [31:0] WD,
	input WE,
	output [31:0] RD,
	
	//DM
	output [31:0] DMAddr,
	output [31:0] DMWD,
	output DMWE,
	input [31:0] DMRD,
	
	//SouthBridge
	output [31:0] SBrAddr,
	output [31:0] SBrWD,
	output SBrWE,
	input [31:0] SBrRD
    );
	
	assign DMAddr=Addr;
	assign SBrAddr=Addr;
	
	assign DMWD=WD;
	assign SBrWD=WD;
	
	wire IsDM= `DMmin<=Addr && Addr<=`DMmax;

	assign DMWE= IsDM ? WE : 1'b0;
	assign SBrWE= IsDM ? 1'b0 : WE;
	
	assign RD= IsDM ? DMRD : SBrRD;

endmodule
