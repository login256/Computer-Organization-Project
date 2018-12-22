`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:06:43 11/26/2018 
// Design Name: 
// Module Name:    FDreg 
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
module FDreg(
	input clk,
	input reset,
	input ExcClr,
	input EN,
    input [31:0] InstrIn,
    input [31:0] PCAdd8In,
	input [31:0] curPCIn,
	input BDIn,
	input ExcGetIn,
	input [4:0] ExcCodeIn,
    output [31:0] InstrOut,
    output [31:0] PCAdd8Out,
	output [31:0] curPCOut,
	output BDOut,
	output ExcGetOut,
	output [4:0]ExcCodeOut,
	
	input [31:0] EPC
    );
	
	reg [31:0] Instr=0,PCAdd8=0,curPC=0;
	reg BD=0;
	reg ExcGet=0;
	reg [4:0] ExcCode=0;
	
	assign InstrOut=Instr;
	assign PCAdd8Out=PCAdd8;
	assign curPCOut=curPC;
	assign BDOut=BD;
	assign ExcGetOut=ExcGet;
	assign ExcCodeOut=ExcCode;
	
	always @ (posedge clk)
	begin
		if(reset)
		begin
			Instr<=0;
			PCAdd8<=0;
			curPC<=0;
			BD<=0;
			ExcGet<=0;
			ExcCode<=0;
		end
		else if(ExcClr)
		begin
			Instr<=0;
			PCAdd8<=0;
			curPC<=EPC;
			BD<=0;
			ExcGet<=0;
			ExcCode<=0;
		end
		else
		begin
			if(EN)
			begin
				Instr<=InstrIn;
				PCAdd8<=PCAdd8In;
				curPC<=curPCIn;
				BD<=BDIn;
				ExcGet<=ExcGetIn;
				ExcCode<=ExcCodeIn;
			end
		end
	end
	
endmodule
