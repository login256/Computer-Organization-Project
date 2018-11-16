`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:34:38 11/15/2018 
// Design Name: 
// Module Name:    datamemory 
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
module datamemory(
	input clk,
	input reset,
    input [31:0] A,
    input [31:0] WD,
    input WE,
    output [31:0] RD,
	input PC
    );
	
	parameter MAXN=1024;
	
	reg [31:0] mem[MAXN-1:0];
	
	assign RD=mem[A];
	
	integer i;
	
	initial
	begin
		for(i=0;i<MAXN;i=i+1)
			mem[i]<=32'h0;
	end
	
	always @(posedge clk, posedge reset)
	begin
		if(reset)
		begin
			for(i=0;i<MAXN;i=i+1)
				mem[i]<=32'h0;
		end
		else
		begin
			$display("@%h: *%h <= %h",PC, A, WD);
			if(WE)
				mem[A]<=WD;
		end
	end

endmodule
