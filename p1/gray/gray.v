`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:47:49 10/25/2018 
// Design Name: 
// Module Name:    gray 
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
module gray(
    input Clk,
    input Reset,
    input En,
    output [2:0] Output,
    output reg Overflow
    );
	
	reg [2:0] cnt;
	
	initial
	begin
		cnt=0;
		Overflow=0;
	end
	assign Output={cnt[2],cnt[2]^cnt[1],cnt[1]^cnt[0]};
	
	always @(posedge Clk)
	begin
		if(Reset)
		begin
			cnt<=0;
			Overflow<=0;
		end
		else if(En)
		begin
			if(cnt==3'b111)
			begin
				cnt<=0;
				Overflow<=1;
			end
			else
				cnt<=cnt+1;
		end
		
	end

endmodule
