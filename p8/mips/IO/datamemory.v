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
	input [3:0] ByteEN,
    output [31:0] RD,
	input [31:0] PC
    );
	
	parameter adrbits=12;
	parameter MAXN=(1<<adrbits);
	reg [31:0] mem[MAXN-1:0];
	wire [adrbits-1:0] sa;
	wire [1:0] by;
	assign sa=A[2+adrbits-1:2];
	assign by=A[1:0];
	
	assign RD=mem[sa];
	
	integer i;
	
	initial
	begin
		for(i=0;i<MAXN;i=i+1)
			mem[i]<=32'h0;
	end
	
	always @(posedge clk)
	begin
		if(reset)
		begin
			for(i=0;i<MAXN;i=i+1)
				mem[i]=32'h0;
		end
		else
		begin
			if(A>=0&&A<MAXN)
			begin
				if(WE)
				begin
					if(ByteEN[0])
						mem[sa][7:0]=WD[7:0];
					if(ByteEN[1])
						mem[sa][15:8]=WD[15:8];
					if(ByteEN[2])
						mem[sa][23:16]=WD[23:16];
					if(ByteEN[3])
						mem[sa][31:24]=WD[31:24];
					$display("%d@%h: *%h <= %h", $time, PC, {A[31:2],2'b00}, mem[sa]);
//					if(PC<32'h4180)
//						$display("@%h: *%h <= %h", PC, {A[31:2],2'b00}, mem[sa]);
				end
			end
		end
	end

endmodule
