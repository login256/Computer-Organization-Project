`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:00:07 11/27/2018 
// Design Name: 
// Module Name:    stall 
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
module stall(
    input [4:0] IDA1,
    input [1:0] Tuse1,
    input [4:0] IDA2,
    input [1:0] Tuse2,
    input [4:0] DEA3,
    input [1:0] DETnew,
    input [4:0] EMA3,
    input [1:0] EMTnew,
    input [4:0] MWA3,
    input [1:0] MWTnew,
	output stall
    );


endmodule
