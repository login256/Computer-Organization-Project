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

	wire [31:0] DMAdr, DMcurPC;
	wire [31:0] DMDataW, DMDataR;
	wire DMcurWE;
	wire [3:0] DMByteEN;
	
	wire [31:0] PC_Fetch, Fetch_Instr;
	
	cpu CPU (
		.clk(clk), 
		.reset(reset), 
		.DMDataR(DMDataR), 
		.DMAdr(DMAdr), 
		.DMcurWE(DMcurWE), 
		.DMByteEN(DMByteEN), 
		.DMDataW(DMDataW), 
		.DMcurPC(DMcurPC), 
		.PC_Fetch(PC_Fetch), 
		.Fetch_Instr(Fetch_Instr)
    );
	
	datamemory DM(
		.clk(clk),
		.reset(reset),
		.A(DMAdr),
		.WD(DMDataW),
		.ByteEN(DMByteEN),
		.RD(DMDataR),
		.WE(DMcurWE),
		.PC(DMcurPC)
	);
	
	instrmemory IM(
		.PC(PC_Fetch),
		.Instr(Fetch_Instr)
	);

endmodule
