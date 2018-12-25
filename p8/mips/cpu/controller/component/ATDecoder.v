`include"..\..\..\define.v"
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
    output [1:0] Tnew,
	output MDUreq
    );
	
	wire [5:0] Opcode=Instr[31:26];
	wire [5:0] Funct=Instr[5:0];
	wire [5:0] Rs=Instr[25:21];
	wire [5:0] Rt=Instr[20:16];
	wire [4:0] rs=Instr[25:21];
	wire [4:0] rt=Instr[20:16];
	wire [4:0] rd=Instr[15:11];
	wire [4:0] r0=5'd0;
	wire [4:0] ra=5'h1f;
	reg [20:0] value;
	reg MDUreq_value;
	
	assign {A1,Tuse1,A2,Tuse2,A3,Tnew}=value;
	assign MDUreq=MDUreq_value;
	
	always@*
	begin
		case(Opcode)
		`opcodeSPECIAL:	//R instr
		begin	
			case(Funct)
			`functADD:
				value<={rs,2'd1,rt,2'd1,rd,2'd2};
			`functADDU:
				value<={rs,2'd1,rt,2'd1,rd,2'd2};
			`functSUB:
				value<={rs,2'd1,rt,2'd1,rd,2'd2};
			`functSUBU:
				value<={rs,2'd1,rt,2'd1,rd,2'd2};
			`functAND:
				value<={rs,2'd1,rt,2'd1,rd,2'd2};
			`functOR:
				value<={rs,2'd1,rt,2'd1,rd,2'd2};
			`functXOR:
				value<={rs,2'd1,rt,2'd1,rd,2'd2};
			`functNOR:
				value<={rs,2'd1,rt,2'd1,rd,2'd2};
			`functSLLV:
				value<={rs,2'd1,rt,2'd1,rd,2'd2};
			`functSRLV:
				value<={rs,2'd1,rt,2'd1,rd,2'd2};
			`functSRAV:
				value<={rs,2'd1,rt,2'd1,rd,2'd2};
			`functSLT:
				value<={rs,2'd1,rt,2'd1,rd,2'd2};
			`functSLTU:
				value<={rs,2'd1,rt,2'd1,rd,2'd2};

			`functSLL:
				value<={r0,2'd0,rt,2'd1,rd,2'd2};
			`functSRL:
				value<={r0,2'd0,rt,2'd1,rd,2'd2};
			`functSRA:
				value<={r0,2'd0,rt,2'd1,rd,2'd2};

			`functMULT:
				value<={rs,2'd1,rt,2'd1,r0,2'd0};
			`functMULTU:
				value<={rs,2'd1,rt,2'd1,r0,2'd0};
			`functDIV:
				value<={rs,2'd1,rt,2'd1,r0,2'd0};
			`functDIVU:
				value<={rs,2'd1,rt,2'd1,r0,2'd0};
			
			`functMFHI:
				value<={r0,2'd0,r0,2'd0,rd,2'd2};
			`functMFLO:
				value<={r0,2'd0,r0,2'd0,rd,2'd2};
				
			`functMTHI:
				value<={rs,2'd1,r0,2'd0,r0,2'd0};
			`functMTLO:
				value<={rs,2'd1,r0,2'd0,r0,2'd0};
			
			`functJR:
				value<={rs,2'd0,r0,2'd0,r0,2'd0};

			`functJALR:
				value<={rs,2'd0,r0,2'd0,rd,2'd1};

			default:
				value<=21'd0;
			endcase
		end
		
		`opcodeADDI:
			value<={rs,2'd1,r0,2'd0,rt,2'd2};
		`opcodeADDIU:
			value<={rs,2'd1,r0,2'd0,rt,2'd2};
		`opcodeSLTI:
			value<={rs,2'd1,r0,2'd0,rt,2'd2};
		`opcodeSLTIU:
			value<={rs,2'd1,r0,2'd0,rt,2'd2};
		`opcodeANDI:
			value<={rs,2'd1,r0,2'd0,rt,2'd2};
		`opcodeORI:
			value<={rs,2'd1,r0,2'd0,rt,2'd2};
		`opcodeXORI:
			value<={rs,2'd1,r0,2'd0,rt,2'd2};
			
		`opcodeLUI:
			value<={r0,2'd0,r0,2'd0,rt,2'd1};
		
		`opcodeLB:
			value<={rs,2'd1,r0,2'd0,rt,2'd3};
		`opcodeLBU:
			value<={rs,2'd1,r0,2'd0,rt,2'd3};
		`opcodeLH:
			value<={rs,2'd1,r0,2'd0,rt,2'd3};
		`opcodeLHU:
			value<={rs,2'd1,r0,2'd0,rt,2'd3};
		`opcodeLW:
			value<={rs,2'd1,r0,2'd0,rt,2'd3};

		`opcodeSB:
			value<={rs,2'd1,rt,2'd2,r0,2'd0};
		`opcodeSH:
			value<={rs,2'd1,rt,2'd2,r0,2'd0};
		`opcodeSW:
			value<={rs,2'd1,rt,2'd2,r0,2'd0};
		
		`opcodeBEQ:
			value<={rs,2'd0,rt,2'd0,r0,2'd0};
		`opcodeBNE:
			value<={rs,2'd0,rt,2'd0,r0,2'd0};
		
		`opcodeBLEZ:
			value<={rs,2'd0,r0,2'd0,r0,2'd0};
		`opcodeBGTZ:
			value<={rs,2'd0,r0,2'd0,r0,2'd0};

		`opcodeREGIMM:
		begin
			case(Rt)
			`rtBLTZ:
				value<={rs,2'd0,r0,2'd0,r0,2'd0};
			`rtBGEZ:
				value<={rs,2'd0,r0,2'd0,r0,2'd0};
			default:
				value<=21'd0;
			endcase
		end

		`opcodeJ:
			value<={r0,2'd0,r0,2'd0,r0,2'd0};
			
		`opcodeJAL:
			value<={r0,2'd0,r0,2'd0,ra,2'd1};
			
		`opcodeCOP0:
		begin
			case(Rs)
			`rsMF:
				value<={r0,2'd0,r0,2'd0,rt,2'd3};
			`rsMT:
				value<={r0,2'd0,rt,2'd2,r0,2'd0};
			5'b10000:
			begin
				case(Funct)
					`functERET:
						value<={r0,2'd0,r0,2'd0,r0,2'd0};
				default:
					value<=21'd0;
				endcase
			end
			default:
				value<=21'd0;
			endcase
		end
		default:
			value<=21'd0;
		endcase
	end
	
	always@*
	begin
		
		//Busy
		case(Opcode)
		
		`opcodeSPECIAL:	//R instr
		begin	
			case(Funct)
				`functMULT:
					MDUreq_value<=1'b1;
				`functMULTU:
					MDUreq_value<=1'b1;
				`functDIV:
					MDUreq_value<=1'b1;
				`functDIVU:
					MDUreq_value<=1'b1;
				`functMFLO:
					MDUreq_value<=1'b1;
				`functMFHI:
					MDUreq_value<=1'b1;
				`functMTLO:
					MDUreq_value<=1'b1;
				`functMTHI:
					MDUreq_value<=1'b1;
				default:
					MDUreq_value<=1'b0;
			endcase
		end
		default:
			MDUreq_value<=1'b0;
		endcase
	end
	
endmodule
