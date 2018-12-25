`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:53:26 12/26/2018
// Design Name:   mips
// Module Name:   C:/Users/lyt/Documents/project/co/p8/mips/mips_tb.v
// Project Name:  mips
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mips
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mips_tb;

	// Inputs
	reg clk_in;
	reg sys_rstn;
	reg [7:0] dip_switch0;
	reg [7:0] dip_switch1;
	reg [7:0] dip_switch2;
	reg [7:0] dip_switch3;
	reg [7:0] dip_switch4;
	reg [7:0] dip_switch5;
	reg [7:0] dip_switch6;
	reg [7:0] dip_switch7;
	reg [7:0] user_key;

	// Outputs
	wire [31:0] led_light;
	wire [7:0] digital_tube0;
	wire [3:0] digital_tube_sel0;
	wire [7:0] digital_tube1;
	wire [3:0] digital_tube_sel1;
	wire [7:0] digital_tube2;
	wire digital_tube_sel2;

	// Instantiate the Unit Under Test (UUT)
	mips uut (
		.clk_in(clk_in), 
		.sys_rstn(sys_rstn), 
		.dip_switch0(dip_switch0), 
		.dip_switch1(dip_switch1), 
		.dip_switch2(dip_switch2), 
		.dip_switch3(dip_switch3), 
		.dip_switch4(dip_switch4), 
		.dip_switch5(dip_switch5), 
		.dip_switch6(dip_switch6), 
		.dip_switch7(dip_switch7), 
		.user_key(user_key), 
		.led_light(led_light), 
		.digital_tube0(digital_tube0), 
		.digital_tube_sel0(digital_tube_sel0), 
		.digital_tube1(digital_tube1), 
		.digital_tube_sel1(digital_tube_sel1), 
		.digital_tube2(digital_tube2), 
		.digital_tube_sel2(digital_tube_sel2)
	);

	initial begin
		// Initialize Inputs
		clk_in = 0;
		sys_rstn = 0;
		dip_switch0 = 32'hffffffff;
		dip_switch1 = 32'hffffffff;
		dip_switch2 = 32'hffffffff;
		dip_switch3 = 32'hffffffff;
		dip_switch4 = 32'hffffffff;
		dip_switch5 = 32'hffffffff;
		dip_switch6 = 32'hffffffff;
		dip_switch7 = 32'hffffffff;
		user_key = 8'hff;

		// Wait 1000 ns for global reset to finish
		#1000;
        sys_rstn<=1;
		// Add stimulus here
		#40;
		user_key<=~8'd1;
		{dip_switch3,dip_switch2,dip_switch1,dip_switch0}<=~32'd123;
		{dip_switch7,dip_switch6,dip_switch5,dip_switch4}<=~32'd124324;
	end
      
	always #20 clk_in=~clk_in;
	  
endmodule

