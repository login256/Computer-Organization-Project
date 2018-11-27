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
	input [31:0] Din2,
    output [31:0] Dout,
	output [31:0] Dout2
    );
	
	reg [31:0] re=0,re2=0;
	
	assign Dout=re;
	assign Dout2=re2;
	
	always @(posedge clk, posedge reset)
	begin
		if(reset)
		begin
			re<=0;
			re2<=0;
		end
		else
		begin
			re<=Din;
			re2<=Din2
		end
	end

endmodule
