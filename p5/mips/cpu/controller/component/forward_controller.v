`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:34:11 11/26/2018 
// Design Name: 
// Module Name:    forward_controller 
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
module forward_controller(
    input [4:0] IDA1,
    input [4:0] IDA2,
	input [4:0] DEA1,
    input [4:0] DEA2,
    input [4:0] DEA3,
    input [1:0] DETnew,
    input [4:0] EMA1,
    input [4:0] EMA2,
    input [4:0] EMA3,
    input [1:0] EMTnew,
//	input [4:0] MWA1,
//	input [4:0] MWA2,
    input [4:0] MWA3,
    input [1:0] MWTnew,
	output [1:0] D1FWSel,
	output [1:0] D2FWSel,
	output [1:0] E1FWSel,
	output [1:0] E2FWSel,
	output [1:0] M1FWSel,
	output [1:0] M2FWSel
	);
	
	assign D1FWSel=	IDA1==5'd0 ? 2'd0 :
					IDA1==DEA3&&DETnew==0 ? 2'd1 :
					IDA1==EMA3&&EMTnew==0 ? 2'd2 :
					IDA1==MWA3&&MWTnew==0 ? 2'd3 :
					2'd0;
	assign D2FWSel=	IDA2==5'd0 ? 2'd0 :
					IDA2==DEA3&&DETnew==0 ? 2'd1 :
					IDA2==EMA3&&EMTnew==0 ? 2'd2 :
					IDA2==MWA3&&MWTnew==0 ? 2'd3 :
					2'd0;
	assign E1FWSel=	DEA1==5'd0 ? 2'd0 :
					DEA1==EMA3&&EMTnew==0 ? 2'd1 :
					DEA1==MWA3&&MWTnew==0 ? 2'd2 :
					2'd0;
	assign E2FWSel=	DEA2==5'd0 ? 2'd0 :
					DEA2==EMA3&&EMTnew==0 ? 2'd1 :
					DEA2==MWA3&&MWTnew==0 ? 2'd2 :
					2'd0;
	assign M1FWSel=	EMA1==5'd0 ? 2'd0 :
					EMA1==MWA3&&MWTnew==0 ? 2'd1 :
					2'd0;
	assign M2FWSel=	EMA2==5'd0 ? 2'd0 :
					EMA2==MWA3&&MWTnew==0 ? 2'd1 :
					2'd0;	
	
endmodule
