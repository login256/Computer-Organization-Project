`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:22:44 11/27/2018 
// Design Name: 
// Module Name:    Branch_Control 
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
module Branch_Control(
    input [31:0] RD1,
    input [31:0] RD2,
    input [4:0] rt,
    input IsBr,
    input [5:0] Opcode,
    output Br
    );
	
	assign Br=IsBr&~(|(RD1^RD2));

endmodule
