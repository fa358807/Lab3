`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:31:53 08/19/2015 
// Design Name: 
// Module Name:    lab3_2 
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
module lab3_2(
	input fcrystal,rst_n,
	output [14:0]display,
	output [3:0]ftsl
);
	 
wire fout;
wire [3:0]q;

assign ftsl = 4'b0111;	 
	 
freqdvi a1(
	.fcrystal(fcrystal),
	.rst_n(rst_n),
	.fout(fout)
);

bcdupcounter b1(
	.q(q),
	.clk(fout),
	.rst_n(rst_n)
);

bcd2ftsegdec c1(
	.display(display),
	.bcd(q) 
);


endmodule
