`include"..\..\..\define.v"
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:40:22 12/17/2018 
// Design Name: 
// Module Name:    E_ExcChecker 
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
module E_ExcChecker(
	input PreExcGet,
	input [4:0] PreExcCode,
	input [31:0] Instr,
	input Overflow,
	output ExcGet,
	output [4:0] ExcCode
    );
	
	wire [5:0] Opcode=Instr[31:26];
	wire [5:0] Funct=Instr[5:0];
	wire [5:0] Rs=Instr[25:21];
	wire [5:0] Rt=Instr[20:16];
	
	reg canOV=0;
	reg Store=0;
	reg Load=0;
	
	always @*
	begin
		case(Opcode)
		`opcodeSPECIAL:	//R instr
		begin	
			case(Funct)
			`functADD:
			begin
				canOV<=1;
				Store<=0;
				Load<=0;
			end
			`functSUB:
			begin
				canOV<=1;
				Store<=0;
				Load<=0;
			end
			default:
			begin
				canOV<=0;
				Store<=0;
				Load<=0;
			end
			endcase
		end
		
		`opcodeADDI:
		begin
			canOV<=1;
			Store<=0;
			Load<=0;
		end
			
		`opcodeLB:
		begin
			canOV<=0;
			Store<=0;
			Load<=1;
		end
		`opcodeLBU:
		begin
			canOV<=0;
			Store<=0;
			Load<=1;
		end
		`opcodeLH:
		begin
			canOV<=0;
			Store<=0;
			Load<=1;
		end
		`opcodeLHU:
		begin
			canOV<=0;
			Store<=0;
			Load<=1;
		end
		`opcodeLW:
		begin
			canOV<=0;
			Store<=0;
			Load<=1;
		end

		`opcodeSB:
		begin
			canOV<=0;
			Store<=1;
			Load<=0;
		end
		`opcodeSH:
		begin
			canOV<=0;
			Store<=1;
			Load<=0;
		end
		`opcodeSW:
		begin
			canOV<=0;
			Store<=1;
			Load<=0;
		end
			
		default:
		begin
			canOV<=0;
			Store<=0;
			Load<=0;
		end
		endcase
	end
	
	assign ExcGet=PreExcGet|(canOV&Overflow)|((Store|Load)&Overflow);
	
	assign ExcCode=	PreExcGet ? PreExcCode :
					(canOV&Overflow) ? `ExcOV :
					(Store&Overflow) ? `ExcAdES :
					(Load&Overflow) ? `ExcAdEL :
					5'd0;
	
endmodule
