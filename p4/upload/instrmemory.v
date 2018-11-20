`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:57:33 11/16/2018 
// Design Name: 
// Module Name:    instrmemory 
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
module instrmemory(
    input [31:0] PC,
    output [31:0] Instr
    );
	
	parameter adrbits=10;
	parameter MAXN=(1<<adrbits);
	
	reg [31:0] ins[MAXN-1:0];
	
	assign Instr=ins[PC[2+adrbits-1:2]];
	
	integer i;
	
	initial
	begin
		for(i=0;i<MAXN;i=i+1)
		begin
			ins[i]=32'h0;
		end
		$readmemh("code.txt",ins,0,MAXN-1);
	end

endmodule
