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
module PCmem(
	input clk,
	input reset,
	input EN,
    input [31:0] NPC,
    output [31:0] PC
    );
	
	reg [31:0] PCreg;
	
	assign PC=PCreg;
	
	initial
	begin
		PCreg<=32'h00003000;
	end

	always @(posedge clk)
	begin
		if(reset)
			PCreg<=32'h00003000;
		else
			if(EN)
				PCreg<=NPC;
	end
	
endmodule
