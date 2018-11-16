`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:15:58 11/15/2018 
// Design Name: 
// Module Name:    datapath 
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
module datapath(
	input clk,
	input reset,
    input Br,
    input Jump,
    input PCImmSrc,
    input Reg3Src,
    input DatatoReg,
    input RegWE,
    input ALUSrc,
    input [7:0] ALUCtrl,
    input [1:0] ExtCtrl,
	input [31:0] Instr,
	input [31:0] DMData,
	output [31:0] DMAdr,
	output PC
    );
	
	wire [31:0] curPC,PCadd4,nPC;
	wire confirmBr;
//next PC	
	PCreg PCreg(
			.clk(clk),
			.reset(reset),
			.PC(curPC),
			.NPC(nPC)
	);
	
//RF
	regfile RF(
	);
	
//EXT
	ext EXT(
	);
	
//ALU
	alu ALU(
	);

endmodule
