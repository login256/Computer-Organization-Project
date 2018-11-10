`timescale 1ns / 1ps
module buffer(
    input clk,
    input in,
    output reg out = 0
    );
	reg buff=0;
	always @(posedge clk)
	begin
		buff<=in;
		out<=buff;
	end

endmodule