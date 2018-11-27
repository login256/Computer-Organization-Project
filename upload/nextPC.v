`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:57:59 11/18/2018 
// Design Name: 
// Module Name:    nextPC 
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
module nextPC(
    input [31:0] curPC,
    input [31:0] BrImm,
    input [25:0] JImm,
    input [31:0] JRImm,
    input Br,
    input Jump,
    input JType,
    output [31:0] NPC,
    output [31:0] PCAdd4
    );

	assign PCAdd4=curPC+4;
	
	wire [31:0] BrPC, JPC;
	
	assign BrPC=PCAdd4+(BrImm<<2);
	assign JPC= JType ? {PCAdd4[31:28],JImm,2'b00} : JRImm ;
	assign NPC= Jump ? JPC : (Br ? BrPC : PCAdd4);

endmodule
