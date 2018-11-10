`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:35:21 10/11/2018 
// Design Name: 
// Module Name:    adder 
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
module adder(
    input [3:0] A,
    input [3:0] B,
    input Clk,
    input En,
    output [3:0] Sum,
    output Overflow
    );
	
	reg [3:0] ans;
	reg Overflow_reg;
	assign Sum=ans;
	assign Overflow=Overflow_reg;
	initial
	begin
		ans=4'b0;
	end
	
	always@(posedge Clk)
	begin
		{Overflow_reg,ans}=En?A+B:0;
	end
	
endmodule
