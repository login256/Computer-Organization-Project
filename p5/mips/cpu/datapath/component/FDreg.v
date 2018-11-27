`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:06:43 11/26/2018 
// Design Name: 
// Module Name:    FDreg 
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
module FDreg(
	input clk,
	input reset,
	input WE,
    input [31:0] InstrIn,
    input [31:0] PCAdd8In,
    output [31:0] InstrOut,
    output [31:0] PCAdd8Out
    );
	
	reg [31:0] Instr=0,PCAdd8=0;
	
	assign InstrOut=Instr;
	assign PCAdd8Out=PCAdd8;
	
	always @ (posedge clk, posedge reset)
	begin
		if(reset)
		begin
			Instr<=0;
			PCAdd8<=0;
		end
		else
		begin
			if(WE)
			begin
				Instr<=InstrIn;
				PCAdd8<=PCAdd8In;
			end
		end
	end
	
endmodule
