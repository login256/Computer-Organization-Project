`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:56:31 12/12/2018 
// Design Name: 
// Module Name:    coprocessor0 
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
module coprocessor0(
	//mt/mf
	input clk,
	input reset,
	input [4:0] A,
	input [31:0] Din,
	input WE,
	output [31:0] Dout,
	//Exc/Int
	input ExcReq,
	input [4:0] ExcCodeIn,
	input [31:2] PCIn,
	input BDIn,
	input [5:0] HWInt,
	output ExcNow,
	//ERET
	input EXLClr,
	output [31:0] EPCOut
	);
	
	wire [31:0] Value [12:15];
	
	//SR
	reg [7:2] IM=0;
	reg EXL=0,IE=0;
	
	assign Value[12]={16'b0,IM,8'b0,EXL,IE};
	
	//Cause
	reg BD=0;
	reg [7:2] IP=0;
	reg [4:0] ExcCode=0;
	
	assign Value[13]={BD,15'b0,IP,3'b0,ExcCode,2'b0};
	
	//EPC
	reg [31:2] EPC=0;
	
	assign Value[14]={EPC,2'b0};
	
	assign EPCOut=Value[14];
	
	//PRID
	assign Value[15]=32'h19260817;
	
	assign Dout= A>=12&&A<=15 ? Value[A] : 0;
	
	assign ExcNow=ExcReq|((~EXL)&IE&(|(HWInt&IM)));
	
	always @(posedge clk)
	begin
		if(reset)
		begin
			IM<=0;
			EXL<=0;
			IE<=0;
			BD<=0;
			IP<=0;
			ExcCode<=0;
			EPC<=0;
		end
		else
		begin
			IP<=HWInt;
			if(ExcNow)
			begin
				if((~EXL)&IE&(|(IP&IM)))
					ExcCode<=0;
				else
					ExcCode<=ExcCodeIn;
				if(BDIn)
				begin
					BD<=1;
					EPC<=PCIn-30'd1;
				end
				else
				begin
					BD<=0;
					EPC<=PCIn;
				end
				EXL<=1;
			end
			else if(EXLClr)
			begin
				EXL<=0;
			end
			else if(WE)
			begin
				case(A)
				12:
				begin
					IM<=Din[15:10];
					EXL<=Din[1];
					IE<=Din[0];
				end
				14:
				begin
					EPC<=Din[31:2];
				end
				endcase
			end
		end
	end

endmodule
