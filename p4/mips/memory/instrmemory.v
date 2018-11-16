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
	
	reg [31:0] ins[1023:0];
	
	assign Instr=ins[PC[11:2]];
	
	initial
	begin
		$readmemh("code.txt",ins,0,1023);
	end

endmodule
