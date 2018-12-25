`include"..\..\define.v"
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:18:04 12/25/2018 
// Design Name: 
// Module Name:    dip_switch_driver 
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
module dip_switch_driver(
	input clk,
	input reset,
	input [7:0] Addr,
	output [31:0] Dout,
	input [7:0] dip_switch0,
	input [7:0] dip_switch1,
	input [7:0] dip_switch2,
	input [7:0] dip_switch3,
	input [7:0] dip_switch4,
	input [7:0] dip_switch5,
	input [7:0] dip_switch6,
	input [7:0] dip_switch7
	);
	
	wire [63:0] in={dip_switch7,dip_switch6,dip_switch5,dip_switch4,dip_switch3,dip_switch2,dip_switch1,dip_switch0};
	
	reg [31:0] value [1:0];
	
	assign Dout=	Addr==`Dev2begin+0 ? value[0] :
					Addr==`Dev2begin+4 ? value[1] :
					0;
	
	always@(posedge clk)
	begin
		if(reset)
		begin
			value[1]<=0;
			value[0]<=0;
		end
		else
		begin
			value[1]<=in[63:32];
			value[0]<=in[31:0];
		end
	end

endmodule
