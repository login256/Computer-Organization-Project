`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:12:28 11/16/2018 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input clk,
    input reset
    );

	wire [31:0] DMAdr, PC;
	wire [31:0] DataW, DataR, Instr;
	wire DMWE;
	
		cpu CPU(
	);
	
	datamemory DM(
	.clk(clk),
	.reset(reset),
	.A(DMAdr),
	.WD(DataW),
	.RD(DataR),
	.WE(DMWE)
	);
	
	instrmemory IM(
	.PC(PC),
	.Instr(Instr)
	);

endmodule
