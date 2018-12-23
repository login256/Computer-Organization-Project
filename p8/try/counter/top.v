`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:34:49 12/22/2018 
// Design Name: 
// Module Name:    top 
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
module top(
	input reset,
	input clk_in,
	input [7:0] user_key,
	input [7:0] dip_switch0,
	input [7:0] dip_switch1,
	input [7:0] dip_switch2,
	input [7:0] dip_switch3,
	input [7:0] dip_switch4,
	input [7:0] dip_switch5,
	input [7:0] dip_switch6,
	input [7:0] dip_switch7,
	output [31:0] led_light
	);
	
	reg [31:0] count;
	
	assign led_light=~count;
	
	wire EN=~user_key[0];
	wire start=~user_key[1];
	
	wire [31:0] value=~{dip_switch3,dip_switch2,dip_switch1,dip_switch0};
	
	always @(posedge clk_in)
	begin
		if(reset)
			count<=0;
		else
		begin
			if(start)
			begin
				count<=value;
			end
			else if(EN)
			begin
				if(count!=0)
					count<=count-1;
			end
		end
	end

endmodule
