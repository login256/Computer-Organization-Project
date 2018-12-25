`include "..\..\..\define.v"
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:00:48 11/17/2018 
// Design Name: 
// Module Name:    controller 
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
module main_controller(
    input [5:0] Opcode,
    input [5:0] Funct,
	input [4:0] Rs,
	input [4:0] Rt,
	output IsBr,
	output Jump,
	output JType,
	output DImmSel,
	output [1:0] A3Sel,
	output ALUBSel,
	output [1:0]EResultSel,
	output MDUEN,
	output DMWE,
	output DataWBSel,
	output RegWE,
	output [1:0] EXTCtrl,
	output [7:0] ALUCtrl,
	output [2:0] SLCtrl,
	output [2:0] MDUCtrl
    );
	
	reg [12:0]controls;
	
//	assign {IsBr,Jump,JType,DImmSel,A3Sel[1:0],ALUBSel,EResultSel[1:0],MDUEN,DMWE,DataWBSel,RegWE,EXTCtrl[1:0],ALUCtrl[7:0],SLCtrl[2:0],MDUCtrl[2:0]}=controls;
	assign {IsBr,Jump,JType,DImmSel,A3Sel[1:0],ALUBSel,EResultSel[1:0],MDUEN,DMWE,DataWBSel,RegWE}=controls;
	
	reg [1:0] EXTCT;
	assign EXTCtrl=EXTCT;
	reg [7:0] ALUCT;
	assign ALUCtrl=ALUCT;
	reg [2:0] SLCT;
	assign SLCtrl=SLCT;
	reg [2:0] MDUCT;
	assign MDUCtrl=MDUCT;
	
	always@*
	begin
		case(Opcode)
		`opcodeSPECIAL:	//R instr
		begin	
			case(Funct)
			`functADD:
				controls<={13'b0_0_0_0_00_0_00_0_0_0_1};
			`functADDU:
				controls<={13'b0_0_0_0_00_0_00_0_0_0_1};
			`functSUB:
				controls<={13'b0_0_0_0_00_0_00_0_0_0_1};
			`functSUBU:
				controls<={13'b0_0_0_0_00_0_00_0_0_0_1};
			`functAND:
				controls<={13'b0_0_0_0_00_0_00_0_0_0_1};
			`functOR:
				controls<={13'b0_0_0_0_00_0_00_0_0_0_1};
			`functXOR:
				controls<={13'b0_0_0_0_00_0_00_0_0_0_1};
			`functNOR:
				controls<={13'b0_0_0_0_00_0_00_0_0_0_1};
			`functSLLV:
				controls<={13'b0_0_0_0_00_0_00_0_0_0_1};
			`functSRLV:
				controls<={13'b0_0_0_0_00_0_00_0_0_0_1};
			`functSRAV:
				controls<={13'b0_0_0_0_00_0_00_0_0_0_1};
			`functSLT:
				controls<={13'b0_0_0_0_00_0_00_0_0_0_1};
			`functSLTU:
				controls<={13'b0_0_0_0_00_0_00_0_0_0_1};

			`functSLL:
				controls<={13'b0_0_0_0_00_0_00_0_0_0_1};
			`functSRL:
				controls<={13'b0_0_0_0_00_0_00_0_0_0_1};
			`functSRA:
				controls<={13'b0_0_0_0_00_0_00_0_0_0_1};

			`functMULT:
				controls<={13'b0_0_0_0_00_0_00_1_0_0_0};
			`functMULTU:
				controls<={13'b0_0_0_0_00_0_00_1_0_0_0};
			`functDIV:
				controls<={13'b0_0_0_0_00_0_00_1_0_0_0};
			`functDIVU:
				controls<={13'b0_0_0_0_00_0_00_1_0_0_0};
			
			`functMFHI:
				controls<={13'b0_0_0_0_00_0_11_0_0_0_1};
			`functMFLO:
				controls<={13'b0_0_0_0_00_0_10_0_0_0_1};
				
			`functMTHI:
				controls<={13'b0_0_0_0_00_0_00_1_0_0_0};
			`functMTLO:
				controls<={13'b0_0_0_0_00_0_00_1_0_0_0};
			
			`functJR:
				controls<={13'b0_1_0_0_00_0_00_0_0_0_0};

			`functJALR:	
				controls<={13'b0_1_0_1_00_0_01_0_0_0_1};

			default:
				controls<=13'b0;
			endcase
		end
		
		`opcodeADDI:
			controls<={13'b0_0_0_0_01_1_00_0_0_0_1};
		`opcodeADDIU:
			controls<={13'b0_0_0_0_01_1_00_0_0_0_1};
		`opcodeSLTI:
			controls<={13'b0_0_0_0_01_1_00_0_0_0_1};
		`opcodeSLTIU:
			controls<={13'b0_0_0_0_01_1_00_0_0_0_1};
		`opcodeANDI:
			controls<={13'b0_0_0_0_01_1_00_0_0_0_1};
		`opcodeORI:
			controls<={13'b0_0_0_0_01_1_00_0_0_0_1};
		`opcodeXORI:
			controls<={13'b0_0_0_0_01_1_00_0_0_0_1};
			
		`opcodeLUI:
			controls<={13'b0_0_0_0_01_1_01_0_0_0_1};
		
		`opcodeLB:
			controls<={13'b0_0_0_0_01_1_00_0_0_1_1};
		`opcodeLBU:
			controls<={13'b0_0_0_0_01_1_00_0_0_1_1};
		`opcodeLH:
			controls<={13'b0_0_0_0_01_1_00_0_0_1_1};
		`opcodeLHU:
			controls<={13'b0_0_0_0_01_1_00_0_0_1_1};
		`opcodeLW:
			controls<={13'b0_0_0_0_01_1_00_0_0_1_1};

		`opcodeSB:
			controls<={13'b0_0_0_0_00_1_00_0_1_0_0};
		`opcodeSH:
			controls<={13'b0_0_0_0_00_1_00_0_1_0_0};
		`opcodeSW:
			controls<={13'b0_0_0_0_00_1_00_0_1_0_0};
		
		`opcodeBEQ:
			controls<={13'b1_0_0_0_00_0_00_0_0_0_0};
		`opcodeBNE:
			controls<={13'b1_0_0_0_00_0_00_0_0_0_0};
		
		`opcodeBLEZ:
			controls<={13'b1_0_0_0_00_0_00_0_0_0_0};
		`opcodeBGTZ:
			controls<={13'b1_0_0_0_00_0_00_0_0_0_0};

		`opcodeREGIMM:
		begin
			case(Rt)
			`rtBLTZ:
				controls<={13'b1_0_0_0_00_0_00_0_0_0_0};
			`rtBGEZ:
				controls<={13'b1_0_0_0_00_0_00_0_0_0_0};
			default:
				controls<=13'b0;
			endcase
		end

		`opcodeJ:
			controls<={13'b0_1_1_0_00_0_00_0_0_0_0};
		`opcodeJAL:
			controls<={13'b0_1_1_1_11_0_01_0_0_0_1};
		
		`opcodeCOP0:
		begin
			case(Rs)
			`rsMF:
				controls<={13'b0_0_0_0_01_0_00_0_0_0_1};
			`rsMT:
				controls<={13'b0_0_0_0_00_0_00_0_0_0_0};
			
			5'b10000:
			begin
				case(Funct)
				`functERET:
					controls<={13'b0_0_0_0_00_0_00_0_0_0_0};
				default:
					controls<=13'b0;
				endcase
			end
			
			default:
				controls<=13'b0;
			endcase
		end
		
//		`opcodeLWL:
//		`opcodeLWR:
//		`opcodeSWL:
//		`opcodeSWR:
		
		default:
			controls<=13'b0;
		endcase
	end

	//EXTCT

	always @*
	begin
		case(Opcode)
		`opcodeADDI:
			EXTCT<=2'b01;
		`opcodeADDIU:
			EXTCT<=2'b01;
		`opcodeSLTI:
			EXTCT<=2'b01;
		`opcodeSLTIU:
			EXTCT<=2'b01;
		`opcodeANDI:
			EXTCT<=2'b00;
		`opcodeORI:
			EXTCT<=2'b00;
		`opcodeXORI:
			EXTCT<=2'b00;
			
		`opcodeLUI:
			EXTCT<=2'b10;
		
		`opcodeLB:
			EXTCT<=2'b01;
		`opcodeLBU:
			EXTCT<=2'b01;
		`opcodeLH:
			EXTCT<=2'b01;
		`opcodeLHU:
			EXTCT<=2'b01;
		`opcodeLW:
			EXTCT<=2'b01;

		`opcodeSB:
			EXTCT<=2'b01;
		`opcodeSH:
			EXTCT<=2'b01;
		`opcodeSW:
			EXTCT<=2'b01;
		
		default:
			EXTCT<=2'b00;
		endcase
	end

	//ALUCtrl	
	always @*
	begin
	case(Opcode)
		`opcodeSPECIAL:	//R instr
		begin	
			case(Funct)
			`functADD:
				ALUCT<=`aluAdd;
			`functADDU:
				ALUCT<=`aluAdd;
			`functSUB:
				ALUCT<=`aluSub;
			`functSUBU:
				ALUCT<=`aluSub;
			`functAND:
				ALUCT<=`aluAnd;
			`functOR:
				ALUCT<=`aluOr;
			`functXOR:
				ALUCT<=`aluXor;
			`functNOR:
				ALUCT<=`aluNor;
			`functSLLV:
				ALUCT<=`aluSllv;
			`functSRLV:
				ALUCT<=`aluSrlv;
			`functSRAV:
				ALUCT<=`aluSrav;
			`functSLT:
				ALUCT<=`aluLt;
			`functSLTU:
				ALUCT<=`aluLtu;

			`functSLL:
				ALUCT<=`aluSll;
			`functSRL:
				ALUCT<=`aluSrl;
			`functSRA:
				ALUCT<=`aluSra;

			default:
				ALUCT<=8'b0;
			endcase
		end
		
		`opcodeADDI:
			ALUCT<=`aluAdd;
		`opcodeADDIU:
			ALUCT<=`aluAdd;
		`opcodeSLTI:
			ALUCT<=`aluLt;
		`opcodeSLTIU:
			ALUCT<=`aluLtu;
		`opcodeANDI:
			ALUCT<=`aluAnd;
		`opcodeORI:
			ALUCT<=`aluOr;
		`opcodeXORI:
			ALUCT<=`aluXor;
		
		`opcodeLB:
			ALUCT<=`aluAdd;
		`opcodeLBU:
			ALUCT<=`aluAdd;
		`opcodeLH:
			ALUCT<=`aluAdd;
		`opcodeLHU:
			ALUCT<=`aluAdd;
		`opcodeLW:
			ALUCT<=`aluAdd;

		`opcodeSB:
			ALUCT<=`aluAdd;
		`opcodeSH:
			ALUCT<=`aluAdd;
		`opcodeSW:
			ALUCT<=`aluAdd;
		default:
			ALUCT<=8'b0;
		endcase
	end
	
	//MDUCtrl
	always @*
	begin
		case(Opcode)
		`opcodeSPECIAL:	//R instr
		begin	
			case(Funct)
			`functMULT:
				MDUCT<=`mduMult;
			`functMULTU:
				MDUCT<=`mduMultu;
			`functDIV:
				MDUCT<=`mduDiv;
			`functDIVU:
				MDUCT<=`mduDivu;
				
			`functMTHI:
				MDUCT<=`mduMthi;
			`functMTLO:
				MDUCT<=`mduMtlo;

			default:
				MDUCT<=3'b0;
			endcase
		end
		
		default:
			MDUCT<=3'b0;
		endcase
	end
	
	//SLCtrl
	always @*
	begin
		case(Opcode)
		
		`opcodeLB:
			SLCT<=`slbyte;
		`opcodeLBU:
			SLCT<=`slbyteu;
		`opcodeLH:
			SLCT<=`slhalf;
		`opcodeLHU:
			SLCT<=`slhalfu;
		`opcodeLW:
			SLCT<=`slword;

		`opcodeSB:
			SLCT<=`slbyte;
		`opcodeSH:
			SLCT<=`slhalf;
		`opcodeSW:
			SLCT<=`slword;

		default:
			SLCT<=3'b0;
		endcase
	end
	
endmodule


/*
		case(Opcode)
		`opcodeSPECIAL:	//R instr
		begin	
			case(Funct)
			`functADD:
			`functADDU:
			`functSUB:
			`functSUBU:
			`functAND:
			`functOR:
			`functXOR:
			`functNOR:
			`functSLLV:
			`functSRLV:
			`functSRAV:
			`functSLT:
			`functSLTU:

			`functSLL:				
			`functSRL:
			`functSRA:

			`functMULT:
			`functMULTU:
			`functDIV:
			`functDIVU:
			
			`functMFHI:
			`functMFLO:
				
			`functMTHI:
			`functMTLO:
			
			`functJR:

			`functJALR:

			default:
			endcase
		end
		
		`opcodeADDI:
		`opcodeADDIU:
		`opcodeSLTI:
		`opcodeSLTIU:
		`opcodeANDI:
		`opcodeORI:
		`opcodeXORI:
			
		`opcodeLUI:
		
		`opcodeLB:
		`opcodeLBU:
		`opcodeLH:
		`opcodeLHU:
		`opcodeLW:

		`opcodeSB:
		`opcodeSH:
		`opcodeSW:
		
		`opcodeBEQ:
		`opcodeBNE:
		
		`opcodeBLEZ:
		`opcodeBGTZ:

		`opcodeREGIMM:
		begin
			case(Rt)
			`rtBLTZ:
			`rtBGEZ:
			default:
			endcase
		end

		`opcodeJ:
		`opcodeJAL:
		
		`opcodeCOP0:
		begin
			case(Rs)
			`rsMF:
			`rsMT:
			5'b10000:
			begin
				case(Funct)
				`functERET:
				default:
				endcase
			end
			default:
			endcase
		end
		default:
		endcase
*/