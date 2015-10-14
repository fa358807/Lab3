`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:00:52 07/30/2015 
// Design Name: 
// Module Name:    freqdvi 
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
module freqdvi(
	input fcrystal,
	input rst_n,
	output fout,
	//output led,
	output [24:0]ftemp
    );

reg fout;	 
reg [24:0]ftemp;
reg [23:0]fcnt;
//assign led=fcrystal;

always @(*)
	ftemp={fout,fcnt}+1'b1;

always @(posedge fcrystal or negedge rst_n)
	if(~rst_n)
		begin
			{fout,fcnt} <= 25'd0;
		end
	else
		begin
			{fout,fcnt} <= ftemp;
		end
endmodule
