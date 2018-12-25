`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:12:28 11/16/2018 
// Design Name: 
// Module Name:    mips 
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
module mips(
	input clk_in,
	input sys_rstn,
//	input reset,
	
	//dip_switch
	input [7:0] dip_switch0,
	input [7:0] dip_switch1,
	input [7:0] dip_switch2,
	input [7:0] dip_switch3,
	input [7:0] dip_switch4,
	input [7:0] dip_switch5,
	input [7:0] dip_switch6,
	input [7:0] dip_switch7,
	
	//user_key
	input [7:0] user_key,
	
	//led_light
	output [31:0] led_light,
	
	//tube
	output [7:0] digital_tube0,
	output [3:0] digital_tube_sel0,
	output [7:0] digital_tube1,
	output [3:0] digital_tube_sel1,
	output [7:0] digital_tube2,
	output digital_tube_sel2
    );
	
	wire reset=~sys_rstn;
	wire clk,clk_double;
	
	CLOCK Inside_Clock(
		.CLK_IN1(clk_in),      // IN
		// Clock out ports
		.CLK_OUT1(clk),     // OUT
		.CLK_OUT2(clk_double)
		);
	
	wire [31:0] Addr, DMcurPC;
	wire [31:0] DataW, DataR;
	wire OutWE;
	wire [3:0] DMByteEN;
	
	wire [31:0] PC_Fetch, Fetch_Instr;
	
	wire [5:0] HWInt;
	
	
	cpu CPU (
		.clk(clk), 
		.reset(reset), 
		.DataR(DataR), 
		.Addr(Addr), 
		.OutWE(OutWE), 
		.DMByteEN(DMByteEN), 
		.DataW(DataW), 
		.DMcurPC(DMcurPC), 
		.PC_Fetch(PC_Fetch), 
		.Fetch_Instr(Fetch_Instr),
		.HWInt(HWInt)
	);
	
	wire [31:0] DMRD;
	wire [31:0] SBrRD;
	
	//NorthBridge
	wire [31:0] DMAddr,DMWD,SBrAddr,SBrWD;
	wire DMWE,SBrWE;
	
	NorthBridge NBr (
		.Addr(Addr), 
		.WD(DataW), 
		.WE(OutWE), 
		.RD(DataR), 
		.DMAddr(DMAddr), 
		.DMWD(DMWD), 
		.DMWE(DMWE), 
		.DMRD(DMRD), 
		.SBrAddr(SBrAddr), 
		.SBrWD(SBrWD), 
		.SBrWE(SBrWE), 
		.SBrRD(SBrRD)
		);

	
	datamemory DM(
		.clk_double(clk_double),
		.reset(reset),
		.A(DMAddr),
		.WD(DMWD),
		.ByteEN(DMByteEN),
		.RD(DMRD),
		.WE(DMWE)//,
//		.PC(DMcurPC)
	);
	
	
	
	wire [7:0] Dev0Addr;
	wire [31:0] Dev0WD,Dev0RD;
	wire Dev0WE,Dev0IRQ;
	
	wire [7:0] Dev1Addr;
	wire [31:0] Dev1WD,Dev1RD;
	wire Dev1WE,Dev1IRQ;
	
	wire [7:0] Dev2Addr;
	wire [31:0] Dev2WD,Dev2RD;
	wire Dev2WE;
	
	wire [7:0] Dev3Addr;
	wire [31:0] Dev3WD,Dev3RD;
	wire Dev3WE;
	
	wire [7:0] Dev4Addr;
	wire [31:0] Dev4WD,Dev4RD;
	wire Dev4WE;
	
	wire [7:0] Dev5Addr;
	wire [31:0] Dev5WD,Dev5RD;
	wire Dev5WE;
	
	//SorthBridge
	
	SouthBridge SBr (
		.Addr(SBrAddr), 
		.WD(SBrWD), 
		.WE(SBrWE), 
		.RD(SBrRD), 
		.HWInt(HWInt),
		
		.Dev0Addr(Dev0Addr), 
		.Dev0WD(Dev0WD), 
		.Dev0WE(Dev0WE), 
		.Dev0RD(Dev0RD), 
		.Dev0IRQ(Dev0IRQ),
		
		.Dev1Addr(Dev1Addr), 
		.Dev1WD(Dev1WD), 
		.Dev1WE(Dev1WE), 
		.Dev1RD(Dev1RD),
		.Dev1IRQ(Dev1IRQ),
		
		.Dev2Addr(Dev2Addr), 
		.Dev2RD(Dev2RD),
		
		.Dev3Addr(Dev3Addr), 
		.Dev3WD(Dev3WD), 
		.Dev3WE(Dev3WE), 
		.Dev3RD(Dev3RD),
		
		.Dev4Addr(Dev4Addr), 
		.Dev4WD(Dev4WD), 
		.Dev4WE(Dev4WE), 
		.Dev4RD(Dev4RD),
		
		.Dev5RD(Dev5RD)
	);

	//Dev0

	timer Timer (
		.clk(clk), 
		.reset(reset), 
		.Addr(Dev0Addr), 
		.WE(Dev0WE), 
		.Din(Dev0WD), 
		.Dout(Dev0RD), 
		.IRQ(Dev0IRQ)
		);
	
	//Dev1
	//Dev2
	dip_switch_driver Switch_driver (
		.clk(clk), 
		.reset(reset), 
		.Addr(Dev2Addr), 
		.Dout(Dev2RD), 
		.dip_switch0(dip_switch0), 
		.dip_switch1(dip_switch1), 
		.dip_switch2(dip_switch2), 
		.dip_switch3(dip_switch3), 
		.dip_switch4(dip_switch4), 
		.dip_switch5(dip_switch5), 
		.dip_switch6(dip_switch6), 
		.dip_switch7(dip_switch7)
    );
	//Dev3
	led_driver LED_driver (
		.clk(clk), 
		.reset(reset),
		.WE(Dev3WE),
		.Din(Dev3WD), 
		.Dout(Dev3RD), 
		.led_light_pin(led_light)
		);
		
	//Dev4
	digital_tube_driver Tube_driver (
		.clk(clk), 
		.reset(reset), 
		.Addr(Dev4Addr), 
		.WE(Dev4WE), 
		.Din(Dev4WD), 
		.Dout(Dev4RD), 
		.digital_tube0(digital_tube0), 
		.digital_tube_sel0(digital_tube_sel0), 
		.digital_tube1(digital_tube1), 
		.digital_tube_sel1(digital_tube_sel1), 
		.digital_tube2(digital_tube2), 
		.digital_tube_sel2(digital_tube_sel2)
		);
	//Dev5
	user_keys_driver Keys_driver (
		.clk(clk), 
		.reset(reset), 
		.Dout(Dev5RD), 
		.user_key(user_key)
    );
	
	instrmemory IM(
		.clk(clk_double),
		.PC(PC_Fetch),
		.Instr(Fetch_Instr)
	);
	
endmodule
