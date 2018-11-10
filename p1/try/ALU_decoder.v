`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:51:51 10/30/2018 
// Design Name: 
// Module Name:    ALU_decoder 
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
module ALU_decoder(
    input [1:0] ALUOp,
    input [5:0] Funct,
    output [2:0] ALUControl
    );
	
	assign ALUControl=	ALUOp==2'b00 ? 3'b010 :
						ALUOp==2'b01 ? 3'b110 :
						Funct==6'b100000 ? 3'b010 :
						Funct==6'b100010 ? 3'b110 :
						Funct==6'b100100 ? 3'b000 :
						Funct==6'b100101 ? 3'b001 :
						Funct==6'b101010 ? 3'b111 :
						3'h0;
	/*	always @ *
	begin
		if(ALUOp==2'b00)
			ALUControl<=3'b010;
		else if(ALUOp==2'b01)
			ALUControl<=3'b110;
		else if(ALUOp==2'b1X)
		begin
			case(Funct)
			6'b100000: ALUControl<=3'b010;
			6'b100010: ALUControl<=3'b110;
			6'b100100: ALUControl<=3'b000;
			6'b100101: ALUControl<=3'b001;
			6'b101010: ALUControl<=3'b111;
			endcase
		end
	end
	*/
endmodule
