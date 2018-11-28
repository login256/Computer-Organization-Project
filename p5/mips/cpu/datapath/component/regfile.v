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
	input [31:0]TPC
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
	
	always @(posedge clk)
	begin
		if(reset)
		begin
			for(i=1;i<=31;i=i+1)
			begin
				rf[i]<=32'h0;
			end
		end
		else
		begin
			if(WE)
			begin
				$display("%d@%h: $%d <= %h", $time, TPC, A3, WD);
				if(A3!=0)
				begin
					rf[A3]<=WD;
				end
			end
		end
	end

endmodule
