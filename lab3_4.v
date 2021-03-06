`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:21:58 08/20/2015 
// Design Name: 
// Module Name:    lab3_4 
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
module lab3_4(
	input clk,
	input rst_n,start,
	input [1:0]time_ctrl,
	output [3:0] ftsd_ctl,
	output [14:0] display,
	output [15:0]led
    );
	 
	 wire [3:0] bcd;
	wire [1:0] clk_ctl;
	wire [3:0] ina,inb,inc,ind;
	wire clk_out;
		
	
freq_div f1(
	.clk_ctl(clk_ctl), // divided clock output
	.clk(clk), // global clock input
	.rst_n(rst_n), // active low reset
	.clk_out(clk_out)
	);

bcd2ftsegdec b1( 
	.display(display), // 14-segment display output
	.bcd(bcd) // BCD input
	);

scan_ctl s1(
	.ftsd_ctl(ftsd_ctl), // ftsd display control signal 
	.ftsd_in(bcd), // output to ftsd display
	.in0(ina), // 1st input
	.in1(inb), // 2nd input
	.in2(inc), // 3rd input
	.in3(ind), // 4th input
	.ftsd_ctl_en(clk_ctl) // divided clock for scan control
	);
	
dcounter a1(
	.time_ctrl(time_ctrl),
	.clk(clk_out),
	.rst_n(rst_n),
	.led(led),
	.start(start),
	.ina(ina),
	.inb(inb),
	.inc(inc),
	.ind(ind)
	);


endmodule
