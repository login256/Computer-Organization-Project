`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:26:42 10/30/2018 
// Design Name: 
// Module Name:    GRF 
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
module GRF(
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] A3,
    input [31:0] WD3,
    input WE3,
	input Clk,
    output [31:0] RD1,
    output [31:0] RD2
    );
	
	reg [31:0] data[31:0];
	
	initial 
	begin
		for(integer i=0;i<=31;i=i+1)
		begin
			data[i]<=32'h0;
		end
	end
	
	assign RD1=data[A1];
	assign RD2=data[A2];
	
	always @(posedge Clk)
	begin
		if(WE3&&A3!=5'h0)
		begin
			data[A3]=WD3;
		end
	end
	
endmodule
