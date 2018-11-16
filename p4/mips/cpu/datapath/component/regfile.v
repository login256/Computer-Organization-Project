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
	input PC
    );
	
	reg [31:0] rf [31:0];
	
	assign RD1=rf[A1];
	assign RD2=rf[A2];
	
	integer i;
	initial
	begin
		for(i=0;i<=31;i=i+1)
		begin
			rf[i]=32'h0;
		end
	end

	always @(posedge clk, posedge reset)
	begin
		if(reset)
		begin
			for(i=0;i<=31;i=i+1)
			begin
				rf[i]<=32'h0;
			end
		end
		else
		begin
			if(WE)
			begin
				$display("@%h: $%d <= %h", WPC, Waddr,WData);
				if(A3!=0)
					rf[A3]<=WD;
			end
		end
	end

endmodule