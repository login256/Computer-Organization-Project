`include"..\..\define.v"

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:14:35 12/14/2018 
// Design Name: 
// Module Name:    CP0Controller 
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
module CP0Controller(
    input [31:0] Instr,
    output CP0WE,
    output MResultSel,
    output IsERET
    );
	
	wire MFC0= Instr[31:26]==`opcodeCOP0 && Instr[25:21]==`rsMF;
	
	wire MTC0= Instr[31:26]==`opcodeCOP0 && Instr[25:21]==`rsMT;
	
	wire ERET= Instr[31:26]==`opcodeCOP0 && Instr[5:0]==`functERET && Instr[25]==1'b1;
	
	assign CP0WE = MTC0;
	
	assign IsERET = ERET;
	
	assign MResultSel = MFC0;
	

endmodule
