`include"define.v"
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:38:17 12/17/2018 
// Design Name: 
// Module Name:    D_ExcCheker 
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
module D_ExcCheker(
    input PreExcGet,
    input [4:0] PreExcCode,
    input [31:0] Instr,
    output ExcGet,
    output [4:0] ExcCode
    );
	
	wire [5:0] Opcode=Instr[31:26];
	wire [5:0] Funct=Instr[5:0];
	wire [5:0] Rs=Instr[25:21];
	wire [5:0] Rt=Instr[20:16];
	
	reg Rec=1;
	
	always @*
	begin
		case(Opcode)
		`opcodeSPECIAL:	//R instr
		begin	
			case(Funct)
			`functADD:
				Rec<=1;
			`functADDU:
				Rec<=1;
			`functSUB:
				Rec<=1;
			`functSUBU:
				Rec<=1;
			`functAND:
				Rec<=1;
			`functOR:
				Rec<=1;
			`functXOR:
				Rec<=1;
			`functNOR:
				Rec<=1;
			`functSLLV:
				Rec<=1;
			`functSRLV:
				Rec<=1;
			`functSRAV:
				Rec<=1;
			`functSLT:
				Rec<=1;
			`functSLTU:
				Rec<=1;

			`functSLL:
				Rec<=1;			
			`functSRL:
				Rec<=1;
			`functSRA:
				Rec<=1;

			`functMULT:
				Rec<=1;
			`functMULTU:
				Rec<=1;
			`functDIV:
				Rec<=1;
			`functDIVU:
				Rec<=1;
			
			`functMFHI:
				Rec<=1;
			`functMFLO:
				Rec<=1;
				
			`functMTHI:
				Rec<=1;
			`functMTLO:
				Rec<=1;
			
			`functJR:
				Rec<=1;

			`functJALR:
				Rec<=1;

			default:
				Rec<=0;
			endcase
		end
		
		`opcodeADDI:
			Rec<=1;
		`opcodeADDIU:
			Rec<=1;
		`opcodeSLTI:
			Rec<=1;
		`opcodeSLTIU:
			Rec<=1;
		`opcodeANDI:
			Rec<=1;
		`opcodeORI:
			Rec<=1;
		`opcodeXORI:
			Rec<=1;
			
		`opcodeLUI:
			Rec<=1;
		
		`opcodeLB:
			Rec<=1;
		`opcodeLBU:
			Rec<=1;
		`opcodeLH:
			Rec<=1;
		`opcodeLHU:
			Rec<=1;
		`opcodeLW:
			Rec<=1;

		`opcodeSB:
			Rec<=1;
		`opcodeSH:
			Rec<=1;
		`opcodeSW:
			Rec<=1;
		
		`opcodeBEQ:
			Rec<=1;
		`opcodeBNE:
			Rec<=1;
		
		`opcodeBLEZ:
			Rec<=1;
		`opcodeBGTZ:
			Rec<=1;

		`opcodeREGIMM:
		begin
			case(Rt)
			`rtBLTZ:
				Rec<=1;
			`rtBGEZ:
				Rec<=1;
			default:
				Rec<=0;
			endcase
		end

		`opcodeJ:
			Rec<=1;
		`opcodeJAL:
			Rec<=1;
		
		`opcodeCOP0:
		begin
			case(Rs)
			`rsMF:
				Rec<=1;
			`rsMT:
				Rec<=1;
			5'b10000:
			begin
				case(Funct)
				`functERET:
					Rec<=1;
				default:
					Rec<=0;
				endcase
			end
			default:
				Rec<=0;
			endcase
		end
		default:
			Rec<=0;
		endcase
	end
	
	
	assign ExcGet=PreExcGet|(~Rec);
	
	assign ExcCode=	PreExcGet ? PreExcCode :
					(~Rec) ? `ExcRI :
					5'd0;

endmodule
