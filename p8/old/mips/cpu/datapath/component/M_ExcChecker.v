`include"..\..\define.v"
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:10:12 12/17/2018 
// Design Name: 
// Module Name:    M_ExcChecker 
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
module M_ExcChecker(
    input PreExcGet,
	input [4:0] PreExcCode,
	input [31:0] Instr,
	input [1:0] ByteSel,
	input [31:0] Addr,
	output ExcGet,
	output [4:0] ExcCode
    );
	
	wire [5:0] Opcode=Instr[31:26];
	wire [5:0] Funct=Instr[5:0];
	wire [5:0] Rs=Instr[25:21];
	wire [5:0] Rt=Instr[20:16];
	
	reg Store=0;
	reg Load=0;
	reg HalfAlign=0;
	reg WordAlign=0;
	
	always @*
	begin
		case(Opcode)
		`opcodeLB:
		begin
			Store<=0;
			Load<=1;
			HalfAlign<=0;
			WordAlign<=0;
		end
		`opcodeLBU:
		begin
			Store<=0;
			Load<=1;
			HalfAlign<=0;
			WordAlign<=0;
		end
		`opcodeLH:
		begin
			Store<=0;
			Load<=1;
			HalfAlign<=1;
			WordAlign<=0;
		end
		`opcodeLHU:
		begin
			Store<=0;
			Load<=1;
			HalfAlign<=1;
			WordAlign<=0;
		end
		`opcodeLW:
		begin
			Store<=0;
			Load<=1;
			HalfAlign<=0;
			WordAlign<=1;
		end

		`opcodeSB:
		begin
			Store<=1;
			Load<=0;
			HalfAlign<=0;
			WordAlign<=0;
		end
		`opcodeSH:
		begin
			Store<=1;
			Load<=0;
			HalfAlign<=1;
			WordAlign<=0;
		end
		`opcodeSW:
		begin
			Store<=1;
			Load<=0;
			HalfAlign<=0;
			WordAlign<=1;
		end
			
		default:
		begin
			Store<=0;
			Load<=0;
			HalfAlign<=0;
			WordAlign<=0;
		end
		endcase
	end
	
	wire InDMRage=(`DMmin<=Addr&&Addr<=`DMmax);
	
	wire InDevRage=	(`Dev0min<=Addr&&Addr<=`Dev0max)||
					(`Dev1min<=Addr&&Addr<=`Dev1max)||
					(`Dev2min<=Addr&&Addr<=`Dev2max)||
					(`Dev3min<=Addr&&Addr<=`Dev3max);
	
	wire NoWriteAddr= Addr==32'h7f08;
	
	assign ExcGet=	PreExcGet |
					(HalfAlign&(ByteSel[0]!=1'd0)&Store) |
					(HalfAlign&(ByteSel[0]!=1'd0)&Load) |
					(WordAlign&(ByteSel!=2'd0)&Store) |
					(WordAlign&(ByteSel!=2'd0)&Load) |
					(Store & (~(InDMRage|InDevRage))) |
					(Store & NoWriteAddr) |
					(Store & InDevRage & (~WordAlign)) |
					(Load & (~(InDMRage|InDevRage))) |
					(Load & InDevRage & (~WordAlign)) |
					1'b0;
	
	assign ExcCode=	PreExcGet ? PreExcCode :
					(HalfAlign&(ByteSel[0]!=1'd0)&Store) ? `ExcAdES :
					(HalfAlign&(ByteSel[0]!=1'd0)&Load) ? `ExcAdEL :
					(WordAlign&(ByteSel!=2'd0)&Store) ? `ExcAdES :
					(WordAlign&(ByteSel!=2'd0)&Load) ? `ExcAdEL :
					(Store & (~(InDMRage|InDevRage))) ? `ExcAdES :
					(Store & NoWriteAddr) ? `ExcAdES :
					(Store & InDevRage & (~WordAlign)) ? `ExcAdES :
					(Load & (~(InDMRage|InDevRage))) ? `ExcAdEL :
					(Load & InDevRage & (~WordAlign)) ? `ExcAdEL :
					5'd0;
endmodule
