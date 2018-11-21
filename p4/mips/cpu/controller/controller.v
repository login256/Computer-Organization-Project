`include "..\define.v"
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
module controller(
    input [5:0] Opcode,
    input [5:0] Funct,
	output IsBr,
	output Jump,
	output JType,
	output RegA3Sel,
	output SaveRA,
	output [1:0] DatatoReg,
	output RegWE,
	output ALUBSel,
	output DMWE,
	output [1:0] EXTCtrl,
	output [7:0] ALUCtrl,
	output [1:0] DMWLen,
	output [2:0] SaveCtrl
    );
	
	reg [19:0]controls;
	
	assign {IsBr,Jump,JType,RegA3Sel,SaveRA,DatatoReg[1:0],RegWE,ALUBSel,DMWE,EXTCtrl[1:0],ALUCtrl[7:0]}=controls;
	
	always@*
	begin
		case(Opcode)
		
		`opcodeR:	//R instr
		begin	
			case(Funct)
			
			`functADDU:
				controls<={12'b0_0_0_0_0_00_1_0_0_00,`aluAdd};
			`functSUBU:
				controls<={12'b0_0_0_0_0_00_1_0_0_00,`aluSub};
			`functSLL:
				controls<={12'b0_0_0_0_0_00_1_0_0_00,`aluSll};
			`functJR:
				controls<={12'b0_1_0_0_0_00_0_0_0_00,8'b0};
				
			default:
				controls<=20'b0;
			endcase
		end
		
		`opcodeORI:
			controls<={12'b0_0_0_1_0_00_1_1_0_00,`aluOr};
		`opcodeLW:
			controls<={12'b0_0_0_1_0_01_1_1_0_01,`aluAdd};
		`opcodeSW:
			controls<={12'b0_0_0_0_0_00_0_1_1_01,`aluAdd};
		`opcodeBEQ:
			controls<={12'b1_0_0_0_0_00_0_0_0_01,`aluEq};
		`opcodeLUI:
			controls<={12'b0_0_0_1_0_00_1_1_0_10,`aluOr};
		`opcodeJAL:
			controls<={12'b0_1_1_0_1_10_1_0_0_00,8'b0};
			
		default:
			controls<=20'b0;
		endcase
	end

endmodule
