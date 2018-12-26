`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:05:27 12/25/2018 
// Design Name: 
// Module Name:    user_keys_driver 
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
module user_keys_driver(
	input clk,
	input reset,
	/*
	input [7:0] Addr,
	input WE,
	input [31:0] Din,
	*/
	output [31:0] Dout,
	input [7:0] user_key
    );
	
	reg [7:0] value;
	
	assign Dout={24'b0,value};
	
	always @(posedge clk)
	begin
		if(reset)
			value<=0;
		else
			value<=~user_key;
	end
	
	
endmodule
