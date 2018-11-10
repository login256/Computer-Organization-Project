////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: counter_synthesis.v
// /___/   /\     Timestamp: Thu Oct 11 21:43:58 2018
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim counter.ngc counter_synthesis.v 
// Device	: xa3s1500-4-fgg456
// Input file	: counter.ngc
// Output file	: C:\Users\lyt\Documents\project\co\p-2\try\netgen\synthesis\counter_synthesis.v
// # of Modules	: 1
// Design Name	: counter
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module counter (
  clk, rst_n, cnt
);
  input clk;
  input rst_n;
  output [3 : 0] cnt;
  wire clk_BUFGP_5;
  wire rst_n_IBUF_15;
  wire rst_n_inv;
  wire [3 : 0] Result;
  wire [3 : 0] count;
  FDC   count_0 (
    .C(clk_BUFGP_5),
    .CLR(rst_n_inv),
    .D(Result[0]),
    .Q(count[0])
  );
  FDC   count_1 (
    .C(clk_BUFGP_5),
    .CLR(rst_n_inv),
    .D(Result[1]),
    .Q(count[1])
  );
  FDC   count_2 (
    .C(clk_BUFGP_5),
    .CLR(rst_n_inv),
    .D(Result[2]),
    .Q(count[2])
  );
  FDC   count_3 (
    .C(clk_BUFGP_5),
    .CLR(rst_n_inv),
    .D(Result[3]),
    .Q(count[3])
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  \Mcount_count_xor<1>11  (
    .I0(count[1]),
    .I1(count[0]),
    .O(Result[1])
  );
  LUT3 #(
    .INIT ( 8'h6C ))
  \Mcount_count_xor<2>11  (
    .I0(count[0]),
    .I1(count[2]),
    .I2(count[1]),
    .O(Result[2])
  );
  LUT4 #(
    .INIT ( 16'h6AAA ))
  \Mcount_count_xor<3>11  (
    .I0(count[3]),
    .I1(count[2]),
    .I2(count[1]),
    .I3(count[0]),
    .O(Result[3])
  );
  IBUF   rst_n_IBUF (
    .I(rst_n),
    .O(rst_n_IBUF_15)
  );
  OBUF   cnt_3_OBUF (
    .I(count[3]),
    .O(cnt[3])
  );
  OBUF   cnt_2_OBUF (
    .I(count[2]),
    .O(cnt[2])
  );
  OBUF   cnt_1_OBUF (
    .I(count[1]),
    .O(cnt[1])
  );
  OBUF   cnt_0_OBUF (
    .I(count[0]),
    .O(cnt[0])
  );
  BUFGP   clk_BUFGP (
    .I(clk),
    .O(clk_BUFGP_5)
  );
  INV   rst_n_inv1_INV_0 (
    .I(rst_n_IBUF_15),
    .O(rst_n_inv)
  );
  INV   \Mcount_count_xor<0>11_INV_0  (
    .I(count[0]),
    .O(Result[0])
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

