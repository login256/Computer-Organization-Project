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
	output [31:0] Dev1Addr,
	output [31:0] Dev1WD,
	output Dev1WE,
	input [31:0] Dev1RD,
	input Dev1IRQ
	);
	
	assign Dev0Addr=Addr;
	assign Dev1Addr=Addr;
	
	assign Dev0WD=WD;
	assign Dev1WD=WD;
	
	wire [31:0] ch=	(Addr>=32'h00007f00 && Addr<=32'h00007f0b) ? 0 :
					(Addr>=32'h00007f10 && Addr<=32'h00007f1b) ? 1 :
					-1;
					
	assign Dev0WE= ch==0 ? WE : 1'b0;
	assign Dev1WE= ch==1 ? WE : 1'b0;
	
	assign RD=	ch==0 ? Dev0RD :
				ch==1 ? Dev1RD :
				0;
	
	assign HWInt={1'b0,1'b0,1'b0,1'b0,Dev1IRQ,Dev0IRQ};
	
endmodule
