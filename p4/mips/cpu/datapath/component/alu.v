`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:58:02 11/16/2018 
// Design Name: 
// Module Name:    alu 
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
module alu(
    input [31:0] SrcA,
    input [31:0] SrcB,
    input [4:0] Shamt,
    input [7:0] ALUctrl,
    output [31:0] ALUResult,
    output zero
    );

	assign zero= ALUResult==zero;
	
	
endmodule
