`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:27:47 12/13/2018 
// Design Name: 
// Module Name:    IMManager 
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
module IMManager(
	input [31:0] PCIn,
	output [31:0] PCFetch,
	input [31:0] Instr_Fetch,
	output [31:0] Instr,
	output ExcADEL
	);
	
	assign ExcADEL=~(PCIn>=32'h00003000 && PCIn<=32'h00004fff && PCIn[1:0]==2'b00);
	
	assign PCFetch=ExcADEL ? 32'h00003000 : PCIn;
	
	assign Instr=ExcADEL ? 0 : Instr_Fetch;
	
endmodule
