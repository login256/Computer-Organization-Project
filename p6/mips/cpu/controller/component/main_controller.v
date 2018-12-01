`include "..\..\define.v"
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
	
	reg [28:0]controls;
	
	assign {IsBr,Jump,JType,DImmSel,A3Sel[1:0],ALUBSel,EResultSel[1:0],MDUEN,DMWE,DataWBSel,RegWE,EXTCtrl[1:0],ALUCtrl[7:0],SLCtrl[2:0],MDUCtrl[2:0]}=controls;
	
	always@*
	begin
		case(Opcode)
		
		`opcodeR:	//R instr
		begin	
			case(Funct)
			
			`functADDU:
				controls<={13'b0_0_0_0_00_0_00_0_0_0_1,2'b00,`aluAdd,3'b0,3'b0};
			`functSUBU:
				controls<={13'b0_0_0_0_00_0_00_0_0_0_1,2'b00,`aluSub,3'b0,3'b0};
			`functSLL:
				controls<={13'b0_0_0_0_00_0_00_0_0_0_1,2'b00,`aluSll,3'b0,3'b0};
			`functMULT:
				controls<={13'b0_0_0_0_00_0_00_1_0_0_0,2'b00,8'b0,3'b0,`mduMult};
			`functMFLO:
				controls<={13'b0_0_0_0_10_0_10_0_0_0_1,2'b00,8'b0,3'b0,3'b0};
			`functMFHI:
				controls<={13'b0_0_0_0_10_0_11_0_0_0_1,2'b00,8'b0,3'b0,3'b0};
//			`functMULTU:
//				controls<={13'b0_0_0_0_00_0_00_1_0_0_0,2'b00,8'b0,3'b0,`mduMult};
				
			`functJR:
				controls<={13'b0_1_0_0_00_0_00_0_0_0_0,2'b00,8'b0,3'b0,3'b0};
//			`functJALR:	
//				controls<={13'b0_1_0_00_1_0_0_00,8'b0,3'b0};
				
			default:
				controls<=29'b0;
			endcase
		end
		
		`opcodeORI:
			controls<={13'b0_0_0_0_01_1_00_0_0_0_1,2'b00,`aluOr,3'b0,3'b0};
		`opcodeLUI:
			controls<={13'b0_0_0_0_01_1_01_0_0_0_1,2'b10,8'b0,3'b0,3'b0};
		`opcodeLW:
			controls<={13'b0_0_0_0_01_1_00_0_0_1_1,2'b01,`aluAdd,`slword,3'b0};
		`opcodeSW:
			controls<={13'b0_0_0_0_00_1_00_0_1_0_0,2'b01,`aluAdd,`slword,3'b0};
		`opcodeBEQ:
			controls<={13'b1_0_0_0_00_0_00_0_0_0_0,2'b00,`aluEq,3'b0,3'b0};
		`opcodeJ:
			controls<={13'b0_1_1_0_00_0_00_0_0_0_0,2'b00,8'b0,3'b0,3'b0};
		`opcodeJAL:
			controls<={13'b0_1_1_1_11_0_01_0_0_0_1,2'b00,8'b0,3'b0,3'b0};
//		`opcodeLH:
//			controls<={13'b0_0_0_01_1_1_0_01,`aluAdd,`slhalf};
//		`opcodeLB:
//			controls<={13'b0_0_0_01_1_1_0_01,`aluAdd,`slbyte};
//		`opcodeLWL:
//			controls<={13'b0_0_0_01_1_1_0_01,`aluAdd,`slwordleft};
//		`opcodeLWR:
//			controls<={13'b0_0_0_01_1_1_0_01,`aluAdd,`slwordright};
//		`opcodeLHU:
//			controls<={13'b0_0_0_01_1_1_0_01,`aluAdd,`slhalfu};
//		`opcodeLBU:
//			controls<={13'b0_0_0_01_1_1_0_01,`aluAdd,`slbyteu};
//		`opcodeSH:
//			controls<={13'b0_0_0_00_0_1_1_01,`aluAdd,`slhalf};
//		`opcodeSB:
//			controls<={13'b0_0_0_00_0_1_1_01,`aluAdd,`slbyte};
//		`opcodeSWL:
//			controls<={13'b0_0_0_00_0_1_1_01,`aluAdd,`slwordleft};
//		`opcodeSWR:
//			controls<={13'b0_0_0_00_0_1_1_01,`aluAdd,`slwordright};
		
		default:
			controls<=29'b0;
		endcase
	end

endmodule
