`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:21:43 11/15/2018 
// Design Name: 
// Module Name:    regfile 
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
module regfile(
    input clk,
	input reset,
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] A3,
    input [31:0] WD,
    input WE,
    output [31:0] RD1,
    output [31:0] RD2,
	input [31:0]PC
    );
	
	reg [31:0] rf [31:1];
	
	assign RD1= A1!=0 ? rf[A1] : 32'h0;
	assign RD2= A2!=0 ? rf[A2] : 32'h0;
	integer i;
	
	initial
	begin
		for(i=1;i<=31;i=i+1)
		begin
			rf[i]=32'h0;
		end
	end
	
	
	reg [31:0] cnt=0, queue_ti [1023:0], queue_PC[1023:0], queue_A3[1023:0], queue_WD[1023:0], front=0,back=-1;

	always @(posedge clk)
	begin
		cnt=cnt+1;
		if(back>=front&&cnt==queue_ti[front]+4)
		begin
			$display("%d@%h: $%d <= %h", $time, queue_PC[front], queue_A3[front], queue_WD[front]);
			front=front+1;
		end
	end

	always @(posedge clk, posedge reset)
	begin
		if(reset)
		begin
			back=-1;
			front=0;
			for(i=1;i<=31;i=i+1)
			begin
				rf[i]<=32'h0;
			end
		end
		else
		begin
			if(WE)
			begin
				//$display("@%h: $%d <= %h", PC, A3, WD);
				back=back+1;
				queue_ti[back]=cnt;
				queue_PC[back]=PC;
				queue_A3[back]=A3;
				queue_WD[back]=WD;
				if(A3!=0)
					rf[A3]<=WD;
			end
		end
	end

endmodule
