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
	input [1:0] WLen,
    output [31:0] RD,
	input [31:0] PC
    );
	
	parameter adrbits=10;
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
			if(WE)
			begin
				if(by==0&&WLen==0)
					mem[sa][7:0]=WD[7:0];
				else if(by==0&&WLen==1)
					mem[sa][15:0]=WD[15:0];
				else if(by==0&&WLen==2)
					mem[sa][23:0]=WD[23:0];
				else if(by==0&&WLen==3)
					mem[sa][31:0]=WD[31:0];
				else if(by==1&&WLen==0)
					mem[sa][15:8]=WD[15:8];
				else if(by==1&&WLen==1)
					mem[sa][23:8]=WD[23:8];
				else if(by==1&&WLen==2)
					mem[sa][31:8]=WD[31:8];
				else if(by==2&&WLen==0)
					mem[sa][23:16]=WD[23:16];
				else if(by==2&&WLen==1)
					mem[sa][31:16]=WD[31:16];
				else if(by==3&&WLen==0)
					mem[sa][31:24]=WD[31:24];
				else
					$display("????");
				$display("%d@%h: *%h <= %h", $time, PC, A, mem[sa]);
			end
		end
	end

endmodule
