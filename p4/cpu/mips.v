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
module mips(
    input clk,
    input reset
    );
	
	wire Br;
	wire Jump;
	wire PCIMM;
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
				.PCIMM(PCIMM),
				.Reg3Src(Reg3Src),
				.DatatoReg(DatatoReg),
				.RegWE(RegWE),
				.ALUSrc(ALUSrc),
				.ALUCtrl(ALUCtrl),
				.DMWE(DMWE),
				.ExtCtrl(ExtCtrl)
				);

endmodule
