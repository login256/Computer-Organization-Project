`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:34:33 12/23/2018 
// Design Name: 
// Module Name:    led_driver 
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
module led_driver(
	input clk,
	input reset,
	input WE,
	input [31:0] Din,
	output [31:0] Dout,
	output [31:0] led_light_pin
    );
	
	reg [31:0] value=~0;
	
	assign led_light_pin=value;
	assign Dout=~value;
	
	always @(posedge clk)
	begin
		if(reset)
		begin
			value<=~0;
		end
		else if(WE)
		begin
			value<=~Din;
		end
	end
	
endmodule
