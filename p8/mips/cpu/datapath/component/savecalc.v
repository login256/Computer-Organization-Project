`include"..\..\..\define.v"
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:23:54 11/21/2018 
// Design Name: 
// Module Name:    savecalc 
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
module savecalc(
    input [31:0] Din,
	input [31:0] Adrin,
    input [2:0] SLCtrl,
    output [31:0] Dout,
	output [31:0] Adrout,
	output [3:0] ByteEN
    );
	
	wire [1:0] bytesel=Adrin[1:0];
	
	assign Dout= 	SLCtrl==`slword ? Din :
					SLCtrl==`slhalf ? Din<<({bytesel[1],4'b0}) :
					SLCtrl==`slbyte ? Din<<({bytesel,3'b0}) :
					SLCtrl==`slwordleft ? Din>>({~bytesel,3'b0}) :
					SLCtrl==`slwordright ? Din<<({bytesel,3'b0}) :
					0;
					
	assign ByteEN= 	SLCtrl==`slword ? 4'b1111 :
					SLCtrl==`slhalf ? (4'b0011 << {bytesel[1],1'b0}) :
					SLCtrl==`slbyte ? (4'b0001 << bytesel) :
					SLCtrl==`slwordleft ? (4'b1111 >> (~bytesel)) :
					SLCtrl==`slwordright ? (4'b1111 << (bytesel)) :
					4'b0;
					
					/*
					SLCtrl==`slwordleft ? bytesel :
					SLCtrl==`slwordright ? ~bytesel :
					*/
	assign Adrout= Adrin;
	
	/*
	assign Adrout=	SLCtrl==`slword ? Adrin :
					SLCtrl==`slhalf ? Adrin :
					SLCtrl==`slbyte ? Adrin :
					SLCtrl==`slwordleft ? {Adrin[31:2],2'b00} :
					SLCtrl==`slwordright ? Adrin :
					Adrin;
	*/
	
	/*
	reg [31:0] Dtemp;
	reg [1:0] Ltemp;
	
	assign Dout=Dtemp;
	assign WLen=Ltemp;

	always @*
	begin
		case(SLCtrl)
		`slword:
		begin
			Dtemp<=Din;
			Ltemp<=2'b11;
		end
		`slhalf:
		begin
			Dtemp<=Din<<({bytesel[1],4'b0});
			Ltemp<=2'b01;
		end
		`slbyte:
		begin
			Dtemp<=Din<<({bytesel,3'b0});
			Ltemp<=2'b00;
		end
		`slwordleft:
		begin
			Dtemp<=Din>>({~bytesel,3'b0});
			Ltemp<=bytesel;
		end
		`slwordright:
		begin
			Dtemp<=Din<<({bytesel,3'b0});
			Ltemp<=~bytesel;
		end
		endcase
	end
	*/
	
endmodule
