`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:47:49 08/20/2015 
// Design Name: 
// Module Name:    lab3_3 
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
module lab3_3(
	input clk,rst_n,
	output [3:0] ftsd_ctl,
	output [14:0] display
	//output [3:0]led
    );
	 
wire clk_out;
wire [1:0]clk_ctl;
wire rst_n;
wire [3:0]bcd;
wire [3:0]q;
wire [3:0]q1;
wire [3:0]in1;
wire [3:0]in2;

//assign led=q1;
assign in1=4'd0;
assign in2=4'd0;

	 
freq_div a1(
	.clk_out(clk_out), // divided clock output
	.clk_ctl(clk_ctl), // divided clock output for scan freq
	.clk(clk), // global clock input
	.rst_n(rst_n)
);

scan_ctl b1(
	.ftsd_in(bcd), // Binary data 
	.ftsd_ctl(ftsd_ctl), // scan control for 14-segment display(in the always block)
	.in0(in1),
	.in1(in2),
	.in2(q1),
	.in3(q), // binary input control for the four digits 
	.ftsd_ctl_en(clk_ctl)// divided clock for scan control
);

bcd2ftsegdec c1(
	.display(display), // SSD display output
	.bcd(bcd) // BCD input
);

bcdupcounter d1(
	.q(q),
	.q1(q1),
	.clk(clk_out),
	.rst_n(rst_n)
);




endmodule
