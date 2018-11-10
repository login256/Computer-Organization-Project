`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:53:38 10/12/2018 
// Design Name: 
// Module Name:    pipeline 
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
module pipeline(
    input [31:0] A1,
    input [31:0] A2,
    input [31:0] B1,
    input [31:0] B2,
    input clk,
    output reg [31:0] C
    );
	
	reg [31:0] xx,yy;
	
	initial
	begin
		xx<=0;
		yy<=0;
		C<=32'b0;
	end
	
	always@(posedge clk)
	begin
		xx<=A1*B1;
		yy<=A2*B2;
		C<=xx+yy;
	end

endmodule
