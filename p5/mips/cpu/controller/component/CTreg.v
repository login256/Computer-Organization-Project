`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:50:34 11/27/2018 
// Design Name: 
// Module Name:    CTreg 
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
module CTreg(
	input clk,
	input reset,
    input [4:0] A1,
    input [1:0] Tuse1,
    input [4:0] A2,
    input [1:0] Tuse2,
    input [4:0] A3,
    input [1:0] Tnew,
	output reg [4:0] DEA1,
    output reg [4:0] DEA2,
    output reg [4:0] DEA3,
    output reg [1:0] DETnew,
    output reg [4:0] EMA1,
    output reg [4:0] EMA2,
    output reg [4:0] EMA3,
    output reg [1:0] EMTnew,
//	output reg [4:0] MWA1,
//	output reg [4:0] MWA2,
    output reg [4:0] MWA3,
    output reg [1:0] MWTnew
    );
	
	always@(posedge clk, posedge reset)
	begin
		if(reset)
		begin
			DEA1<=0;
			DEA2<=0;
			DEA3<=0;
			DETnew<=0;
			EMA1<=0;
			EMA2<=0;
			EMA3<=0;
			EMTnew<=0;
//			MWA1<=0;
//			MWA2<=0;
			MWA3<=0;
			MWTnew<=0;
		end
		else
		begin
			DEA1<=A1;
			DEA2<=A2;
			DEA3<=A3;
			DETnew<=Tnew==0?2'd0:Tnew-2'd1;
			EMA1<=DEA1;
			EMA2<=DEA2;
			EMA3<=DEA3;
			EMTnew<=DETnew==0?2'd0:DETnew-2'd1;
//			MWA1<=EMA1;
//			MWA2<=EMA2;
			MWA3<=EMA3;
			MWTnew<=EMTnew==0?2'd0:EMTnew-2'd1;
		end
	end

endmodule
