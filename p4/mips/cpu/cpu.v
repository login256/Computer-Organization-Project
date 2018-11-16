`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:04:31 11/15/2018 
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
module cpu(
    input clk,
    input reset,
	input Instr[31:0],
	input DataR[31:0],
	output PC,
	output DMAdr,
	output DMWE,
	output [31:0]DataW
    );
	
	wire Br;
	wire Jump;
	wire PCImmSrc;
    wire Reg3Src;
    wire DatatoReg;
    wire RegWE;
    wire ALUSrc;
    wire [7:0] ALUCtrl;
    wire DMWE;
    wire [1:0] ExtCtrl;
	
	datapath DP(
				.clk(clk),
				.reset(reset),
				.Br(Br),
				.Jump(Jump),
				.PCImmSrc(PCImmSrc),
				.Reg3Src(Reg3Src),
				.DatatoReg(DatatoReg),
				.RegWE(RegWE),
				.ALUSrc(ALUSrc),
				.ALUCtrl(ALUCtrl),
				.ExtCtrl(ExtCtrl)
				);
	
	controller CT(
	);
	
endmodule
