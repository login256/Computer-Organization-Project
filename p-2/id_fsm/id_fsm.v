`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:19:26 10/12/2018 
// Design Name: 
// Module Name:    id_fsm 
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
module id_fsm(
    input [7:0] char,
    input clk,
    output out
    );
	
	reg [1:0] state;
	
	wire [1:0] type;
	
	parameter s0=2'b0, s1=2'b1, s2=2'b10;
	
	assign type = (char>=8'd65 && char<=8'd90) || (char>=8'd97 && char<=8'd122) ? 2'b1 : 
				  char>=8'd48 && char<=8'd57 ? 2'b10 : 
				  2'b0;
	assign out = state==s2;
	
	initial
	begin
		state = s0;
	end
	
	always@(posedge clk)
	begin
		case (state)
		s0:
			state <= type==1 ? 1 : s0;
		s1:
			state <= type==0 ? s0 :
			         type==1 ? s1 :
					 s2;
		s2:
			state <= type==0 ? s0 :
			         type==1 ? s1 :
					 s2;
		default
			state <= s0;
		endcase
	end
	
endmodule
