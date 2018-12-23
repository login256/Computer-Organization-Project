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
	input clk,
    input [31:0] PC,
    output [31:0] Instr
    );
	
	wire [31:0] Addr=PC-32'h3000;
	
	IM_BlockRAM IM_BlockRAM (
		.clka(clk), // input clka
		.wea(1'b0), // input [0 : 0] wea
		.addra(Addr[14:2]), // input [12 : 0] addra
		.dina(0), // input [31 : 0] dina
		.douta(Instr) // output [31 : 0] douta
		);
	
	/*
	parameter adrbits=12;
	parameter MAXN=(1<<adrbits);
	
	reg [31:0] ins[MAXN-1:0];
	
	wire [31:0] adr=(PC-32'h00003000);
	
	assign Instr= ins[adr[2+adrbits-1:2]];
	
	integer i;
	
	initial
	begin
		for(i=0;i<MAXN;i=i+1)
		begin
			ins[i]=32'h0;
		end
		$readmemh("./IO/code.txt",ins);
		$readmemh("./IO/code_handler.txt",ins,1120,2047);
	end
	*/
	
endmodule
