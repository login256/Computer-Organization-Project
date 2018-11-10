`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:44:41 10/25/2018 
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
    output out
    );

	parameter 	s0=2'b00,
				s1=2'b01,
				s2=2'b10;
	reg [1:0] state;
	
	assign out= state==s1;
	
	initial
	begin
		state=s0;
	end
	
	always @(posedge clk, posedge clr)
	begin
		if(clr)
		begin
			state<=0;
		end
		else
		begin
			case(state)
			s0:
				state<= 8'd48<=in && in <=8'd57 ? s1 : s2;
			s1:
				state<= 8'd42==in || in ==8'd43 ? s0 : s2;
			s2:
				state<=s2;
			default:
				state<=s0;
			endcase
		end
	end

endmodule
