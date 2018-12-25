`include"..\define.v"
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:59:34 12/11/2018 
// Design Name: 
// Module Name:    Bridge 
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
module SouthBridge(
	input [31:0] Addr,
	input [31:0] WD,
	input WE,
	output [31:0] RD,
	
	output [5:0] HWInt,
	
	//Dev0
	output [31:0] Dev0Addr,
	output [31:0] Dev0WD,
	output Dev0WE,
	input [31:0] Dev0RD,
	input Dev0IRQ,
	
	//Dev1
	output [7:0] Dev1Addr,
	output [31:0] Dev1WD,
	output Dev1WE,
	input [31:0] Dev1RD,
	input Dev1IRQ,
	
	//Dev2
	output [7:0] Dev2Addr,
	output [31:0] Dev2WD,
	output Dev2WE,
	input [31:0] Dev2RD,
	
	//Dev3
	output [7:0] Dev3Addr,
	output [31:0] Dev3WD,
	output Dev3WE,
	input [31:0] Dev3RD,
	
	//Dev4
	output [7:0] Dev4Addr,
	output [31:0] Dev4WD,
	output Dev4WE,
	input [31:0] Dev4RD,
	
	//Dev5
	output [7:0] Dev5Addr,
	output [31:0] Dev5WD,
	output Dev5WE,
	input [31:0] Dev5RD
	
	);
	
	assign Dev0Addr=Addr[7:0];
	assign Dev1Addr=Addr[7:0];
	assign Dev2Addr=Addr[7:0];
	assign Dev3Addr=Addr[7:0];
	assign Dev4Addr=Addr[7:0];
	assign Dev5Addr=Addr[7:0];
	
	assign Dev0WD=WD;
	assign Dev1WD=WD;
	assign Dev2WD=WD;
	assign Dev3WD=WD;
	assign Dev4WD=WD;
	assign Dev5WD=WD;
	
	wire [31:0] ch=	(Addr>=`Dev0min && Addr<=`Dev0max) ? 0 :
					(Addr>=`Dev1min && Addr<=`Dev1max) ? 1 :
					(Addr>=`Dev2min && Addr<=`Dev2max) ? 2 :
					(Addr>=`Dev3min && Addr<=`Dev3max) ? 3 :
					(Addr>=`Dev4min && Addr<=`Dev4max) ? 4 :
					(Addr>=`Dev5min && Addr<=`Dev5max) ? 5 :
					-1;
					
	assign Dev0WE= ch==0 ? WE : 1'b0;
	assign Dev1WE= ch==1 ? WE : 1'b0;
	assign Dev2WE= ch==2 ? WE : 1'b0;
	assign Dev3WE= ch==3 ? WE : 1'b0;
	assign Dev4WE= ch==4 ? WE : 1'b0;
	assign Dev5WE= ch==5 ? WE : 1'b0;
	
	assign RD=	ch==0 ? Dev0RD :
				ch==1 ? Dev1RD :
				ch==2 ? Dev2RD :
				ch==3 ? Dev3RD :
				ch==4 ? Dev4RD :
				ch==5 ? Dev5RD :
				0;
	
	assign HWInt={1'b0,1'b0,1'b0,1'b0,Dev1IRQ,Dev0IRQ};
	
endmodule
