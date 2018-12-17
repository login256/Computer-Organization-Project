`include "define.v"
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:31:51 12/01/2018 
// Design Name: 
// Module Name:    multiplier 
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
module multi_divi_unit(
	input clk,
	input reset,
    input [31:0] SrcA,
    input [31:0] SrcB,
    input Start,
	input EN,
	input [2:0] MDUCtrl,
    output [31:0] lo,
    output [31:0] hi,
    output Busy,
	output WillBusy
    );
	
	reg [3:0] counter=0;
	
	assign Busy=~(counter==0);
	assign WillBusy=(counter>1)||(Start&&(MDUCtrl!=`mduMtlo&&MDUCtrl!=`mduMthi));
	
	reg [31:0] SrcA_reg=0, SrcB_reg=0;
	reg [2:0] MDUCtrl_reg=0;
	
	reg [31:0]lo_reg=0, hi_reg=0;
	assign lo=lo_reg;
	assign hi=hi_reg;
	

	always @(posedge clk)
	begin
		if(reset)
		begin
			lo_reg<=0;
			hi_reg<=0;
			counter<=0;
			SrcA_reg<=0;
			SrcB_reg<=0;
			MDUCtrl_reg<=0;
		end
		else
		begin
			if(Start&EN)
			begin
				SrcA_reg<=SrcA;
				SrcB_reg<=SrcB;
				MDUCtrl_reg<=MDUCtrl;
				case(MDUCtrl)
				
				`mduMult:
					counter<=5;
				`mduMultu:
					counter<=5;
				`mduDiv:
					counter<=10;
				`mduDivu:
					counter<=10;
				`mduMtlo:
				begin
					lo_reg<=SrcA;
					counter<=0;
				end
				`mduMthi:
				begin
					hi_reg<=SrcA;
					counter<=0;
				end
								
				endcase
			end
			else
			begin
				if(counter==4'd1)
					begin
						case(MDUCtrl_reg)
						`mduMult:
							{hi_reg,lo_reg}<=$signed($signed({{32{SrcA_reg[31]}},SrcA_reg})*$signed({{32{SrcB_reg[31]}},SrcB_reg}));
						`mduMultu:
							{hi_reg,lo_reg}<=$unsigned($unsigned({32'h0,SrcA_reg})*$unsigned({32'h0,SrcB_reg}));
						`mduDiv:
						begin
							lo_reg<=$signed($signed(SrcA_reg)/$signed(SrcB_reg));
							hi_reg<=$signed($signed(SrcA_reg)%$signed(SrcB_reg));
						end
						`mduDivu:
						begin
							lo_reg<=$unsigned($unsigned(SrcA_reg)/$unsigned(SrcB_reg));
							hi_reg<=$unsigned($unsigned(SrcA_reg)%$unsigned(SrcB_reg));
						end
						endcase
					end
				if(counter!=0)
				begin
					counter<=counter-4'd1;	
				end
			end
		end
	end

endmodule
