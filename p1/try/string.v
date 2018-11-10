`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:28:52 10/26/2018 
// Design Name: 
// Module Name:    string 
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
module string(
	input clk,
	input clr,
	input [7:0] in,
	output reg out=0
    );
	 integer state=0;
	 
	 always @(posedge clr) begin
		state=0;
		out<=0;
	 end
	 
	 always @(posedge clk) begin
		if(clr!=1) begin
			case(state)
			0:
				begin
					if(in>=48&&in<=57) begin
						state=1;
					end
					else begin
						state=3;
					end
				end
			1:
				begin
					if(in==42||in==43)begin
						state=2;
					end
					else begin
						state=3;
					end
				end
			2:
				begin
					if(in>=48&&in<=57) begin
						state=1;
					end
					else begin
						state=3;
					end
				end
			3:
				begin
					state=3;
				end
			default:;
			endcase
			if(state==1)begin
				out<=1;
			end
			else begin
				out<=0;
			end
		end
	 end


endmodule
