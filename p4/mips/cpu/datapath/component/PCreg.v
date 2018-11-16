`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:05:24 11/16/2018 
// Design Name: 
// Module Name:    PCreg 
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
module PCreg(
	input clk,
	input reset,
    input [31:0] NPC,
    output reg [31:0] PC
    );

	initial
	begin
		PC<=32'h00003000;
	end
	
	always @(posedge clk, posedge reset)
	begin
		if(reset)
			PC<=32'h00003000;
		else
			PC<=NPC;
	end
	
endmodule
