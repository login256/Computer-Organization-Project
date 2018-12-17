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
    input reset,
	output [31:0] Addr
    );

	wire [31:0] Addr, DMcurPC;
	wire [31:0] DataW, DataR;
	wire OutWE;
	wire [3:0] DMByteEN;
	
	wire [31:0] PC_Fetch, Fetch_Instr;
	
	wire [5:0] HWInt;
	
	cpu CPU (
		.clk(clk), 
		.reset(reset), 
		.DataR(DataR), 
		.Addr(Addr), 
		.OutWE(OutWE), 
		.DMByteEN(DMByteEN), 
		.DataW(DataW), 
		.DMcurPC(DMcurPC), 
		.PC_Fetch(PC_Fetch), 
		.Fetch_Instr(Fetch_Instr),
		.HWInt(HWInt)
    );
	
	wire [31:0] SBrRD;
	
	wire [31:0] Dev0Addr,Dev0WD,Dev0RD;
	wire Dev0WE,Dev0IRQ;
	
	wire [31:0] Dev1Addr,Dev1WD,Dev1RD;
	wire Dev1WE,Dev1IRQ;
	
	SouthBridge SBr (
		.Addr(Addr), 
		.WD(DataW), 
		.WE(OutWE), 
		.RD(SBrRD), 
		.HWInt(HWInt),
		.Dev0Addr(Dev0Addr), 
		.Dev0WD(Dev0WD), 
		.Dev0WE(Dev0WE), 
		.Dev0RD(Dev0RD), 
		.Dev0IRQ(Dev0IRQ),
		.Dev1Addr(Dev1Addr), 
		.Dev1WD(Dev1WD), 
		.Dev1WE(Dev1WE), 
		.Dev1RD(Dev1RD),
		.Dev1IRQ(Dev1IRQ)
	);

	timer Dev0 (
		.clk(clk), 
		.reset(reset), 
		.Addr(Dev0Addr), 
		.WE(Dev0WE), 
		.Din(Dev0WD), 
		.Dout(Dev0RD), 
		.IRQ(Dev0IRQ)
		);
	
	
	timer Dev1 (
		.clk(clk), 
		.reset(reset), 
		.Addr(Dev1Addr), 
		.WE(Dev1WE), 
		.Din(Dev1WD), 
		.Dout(Dev1RD), 
		.IRQ(Dev1IRQ)
		);
	
	wire [31:0] DMRD;
	
	datamemory DM(
		.clk(clk),
		.reset(reset),
		.A(Addr),
		.WD(DataW),
		.ByteEN(DMByteEN),
		.RD(DMRD),
		.WE(OutWE),
		.PC(DMcurPC)
	);
	
	wire DataRSel=~(Addr<=32'h00002fff);
	
	mux2#32 NorthBridge_mux_DataR(DMRD,SBrRD,DataRSel,DataR);

	instrmemory IM(
		.PC(PC_Fetch),
		.Instr(Fetch_Instr)
	);
	
endmodule
