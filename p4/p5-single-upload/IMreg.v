`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:37:29 11/27/2018 
// Design Name: 
// Module Name:    IMreg 
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
module IMreg(
	input clk,
	input reset,
    input [31:0] Din,
    output [31:0] Dout
    );
	
	reg [31:0] re=0;
	
	assign Dout=re;
	
	always @(posedge clk, posedge reset)
	begin
		if(reset)
			re<=0;
		else
			re<=Din;
	end

endmodule
