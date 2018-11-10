`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:45:48 10/12/2018 
// Design Name: 
// Module Name:    code 
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
module code(
    input Clk,
    input Reset,
    input Slt,
    input En,
    output [63:0] Output0,
    output [63:0] Output1
    );
	
	reg [63:0] cnt0,cnt1;
	reg [1:0] ti1;
	assign Output0=cnt0;
	assign Output1=cnt1;
	
	initial
	begin
		cnt0<=64'b0;
		cnt1<=64'b0;
		ti1<=2'b0;
	end
	always @(posedge Clk)
	begin
		if(Reset)
		begin
			cnt0<=64'b0;
			cnt1<=64'b0;
			ti1<=2'b0;
		end
		else
		begin
			if(En)
			begin
				if(!Slt)
				begin
					cnt0<=cnt0+1;
				end
				else
				begin
					ti1<=ti1+2'b1;
					if(ti1==2'b11)
						cnt1<=cnt1+1;
				end
			end
		end
	end
endmodule
