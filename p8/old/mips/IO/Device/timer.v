`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:52:08 12/11/2018 
// Design Name: 
// Module Name:    timer 
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

`define IM 3
`define Mode 2:1
`define Enable 0

module timer(
    input clk,
    input reset,
    input [7:0] Addr,
    input WE,
    input [31:0] Din,
    output [31:0] Dout,
    output IRQ
    );
	
	reg IRQ_reg=0;
	
	assign IRQ= CTRL[`IM]&IRQ_reg;
	
	reg [3:0] CTRL=0;
	reg [31:0] PRESET=0;
	reg [31:0] COUNT=0;
	
	wire [31:0] mem [3:0];
	
	assign mem[0]={28'b0,CTRL};
	assign mem[1]=PRESET;
	assign mem[2]=COUNT;
	assign mem[3]=0;
	
	assign Dout=mem[Addr[3:2]];
	
	reg [1:0] state=0;
	
	always@(posedge clk)
	begin
		if(reset)
		begin
			CTRL<=0;
			PRESET<=0;
			COUNT<=0;
			IRQ_reg<=0;
			state<=0;
		end
		else
		begin
			if(WE)
			begin
				if(Addr[3:0]==4'h0)
					CTRL<=Din[3:0];
				else if(Addr[3:0]==4'h4)
					PRESET<=Din;
				else if(Addr[3:0]==4'h8)
					$display("miao miao miao?");
				else
					$display("miao miao miao?2");
			end
			else
			begin
				case (state)
				
				2'd0:
				begin
					if(CTRL[`Enable]==1)
					begin
						state<=2'd1;
						IRQ_reg<=0;
					end
				end
				
				2'd1:
				begin
					state<=2'd2;
					COUNT<=PRESET;
				end
				
				2'd2:
				begin
					if(CTRL[`Enable]==0)
						state<=2'd0;
					else if(COUNT<=1)
					begin
						COUNT<=COUNT-1;
						state<=2'd3;
						IRQ_reg<=1;
						if(CTRL[`Mode]==2'b0)
							CTRL[`Enable]<=1'b0;
					end
					else
						COUNT<=COUNT-1;
				end
				
				2'd3:
				begin
					state<=2'd0;
					if(CTRL[`Mode]==2'b01)
						IRQ_reg<=0;
				end
				endcase
			end
		end
	end
	

endmodule
