`include"..\..\define.v"
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:17:11 11/26/2018 
// Design Name: 
// Module Name:    ATDecoder 
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
module ATDecoder(
    input [31:0] Instr,
    output [4:0] A1,
    output [1:0] Tuse1,
    output [4:0] A2,
    output [1:0] Tuse2,
    output [4:0] A3,
    output [1:0] Tnew
    );
	
	wire [5:0] Opcode=Instr[31:26];
	wire [5:0] Funct=Instr[5:0];
	wire [4:0] rs=Instr[25:21];
	wire [4:0] rt=Instr[20:16];
	wire [4:0] rd=Instr[15:11];
	wire [4:0] r0=5'd0;
	wire [4:0] ra=5'h1f;
	reg [20:0] value;
	
	assign {A1,Tuse1,A2,Tuse2,A3,Tnew}=value;
	
	always@*
	begin
		case(Opcode)
		
		`opcodeR:	//R instr
		begin	
			case(Funct)
			
			`functADDU:
				value<={rs,2'd1,rt,2'd1,rd,2'd2};
			`functSUBU:
				value<={rs,2'd1,rt,2'd1,rd,2'd2};
			`functSLL:
				value<={rs,2'd1,r0,2'd0,rd,2'd2};
			`functJR:
				value<={rs,2'd0,r0,2'd0,r0,2'd0};
//			`functJALR:	
			
			default:
				value<=21'd0;
			endcase
		end
		
		`opcodeORI:
			value<={rs,2'd1,r0,2'd0,rt,2'd2};
		`opcodeLW:
			value<={rs,2'd1,r0,2'd0,rt,2'd1};
		`opcodeSW:
			value<={rs,2'd1,rt,2'd2,r0,2'd0};
		`opcodeBEQ:
			value<={rs,2'd0,rt,2'd0,r0,2'd0};
		`opcodeLUI:
			value<={r0,2'd0,r0,2'd0,rt,2'd1};
		`opcodeJAL:
			value<={r0,2'd0,r0,2'd0,ra,2'd1};
		`opcodeJ:
			value<={r0,2'd0,r0,2'd0,r0,2'd0};
//		`opcodeLH:
//		`opcodeLB:
//		`opcodeLWL:
//		`opcodeLWR:
//		`opcodeLHU:
//		`opcodeLBU:
//		`opcodeSH:
//		`opcodeSB:
//		`opcodeSWL:
//		`opcodeSWR:
		
		default:
			value<=21'd0;
		endcase
	end
	
endmodule
