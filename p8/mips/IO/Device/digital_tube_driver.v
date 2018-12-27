`include"..\..\define.v"
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:18:08 12/25/2018 
// Design Name: 
// Module Name:    digital_tube_driver 
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
module digital_tube_driver(
	input clk,
	input reset,
    input [7:0] Addr,
	input WE,
	input [31:0] Din,
	output [31:0] Dout,
	
	output reg [7:0] digital_tube0,
	output reg [3:0] digital_tube_sel0,
	output reg [7:0] digital_tube1,
	output reg [3:0] digital_tube_sel1,
	output reg [7:0] digital_tube2,
	output reg digital_tube_sel2
	);
	
	wire [7:0] tube_value [0:15]={	
									~8'b01111110,	//0
									~8'b00110000,	//1
									~8'b01101101,	//2
									~8'b01111001,	//3
									~8'b00110011,	//4
									~8'b01011011,	//5
									~8'b01011111,	//6
									~8'b01110000,	//7
									~8'b01111111,	//8
									~8'b01111011,	//9
									~8'b01110111,	//A
									~8'b00011111,	//b
									~8'b01001110,	//C
									~8'b00111101,	//d
									~8'b01001111,	//E
									~8'b01000111	//F
									};
	reg [31:0] value [0:1];
	
	assign Dout=	Addr==`Dev4begin+0 ? value[0] :
					Addr==`Dev4begin+4 ? value[1] :
					0;
	
	reg [31:0] count=0;
	reg [1:0] cur=0;
	
	always @(posedge clk)
	begin
		if(reset)
		begin
			value[0]<=0;
			value[1]<=0;
			count<=0;
			cur<=0;
			digital_tube0<=0;
			digital_tube1<=0;
			digital_tube2<=0;
			digital_tube_sel0<=4'hf;
			digital_tube_sel1<=4'hf;
			digital_tube_sel2<=1'h1;
		end
		else
		begin
			count<=count+1;
			if(count==32'd124999)
			begin
				case(cur)
					2'd0:
					begin
						digital_tube0<=tube_value[value[0][3:0]];
						digital_tube1<=tube_value[value[0][19:16]];
					end
					2'd1:
					begin
						digital_tube0<=tube_value[value[0][7:4]];
						digital_tube1<=tube_value[value[0][23:20]];
					end
					2'd2:
					begin
						digital_tube0<=tube_value[value[0][11:8]];
						digital_tube1<=tube_value[value[0][27:24]];
					end
					2'd3:
					begin
						digital_tube0<=tube_value[value[0][15:12]];
						digital_tube1<=tube_value[value[0][31:28]];
					end
				endcase
				digital_tube2<=tube_value[value[1][3:0]];
				digital_tube_sel0<=4'b1<<cur;
				digital_tube_sel1<=4'b1<<cur;
				digital_tube_sel2<=1'b1;
				cur<=cur+2'd1;
				count<=0;
			end
			if(WE)
			begin
				if(Addr==`Dev4begin+0)
					value[0]<=Din;
				else if(Addr==`Dev4begin+4)
					value[1]<=Din;
			end
		end
	end
	
endmodule
