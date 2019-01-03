`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:33:17 12/17/2018 
// Design Name: 
// Module Name:    F_ExcJudger 
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
module F_ExcChecker(
    input ExcADEL,
    output ExcGet,
    output [4:0] ExcCode
    );
	
	assign ExcGet=ExcADEL;
	assign ExcCode=ExcADEL? 5'd4 : 5'd0;

endmodule
