`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:07:04 07/31/2015 
// Design Name: 
// Module Name:    bcdcounter 
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
module bcdcounter(
	input clk,
	output [14:0]display,
	output [3:0]ftsd_ctl
	    );
	 
reg [3:0]q;
reg [3:0]q_tmp;
reg fout;	 
reg [24:0]ftemp;
reg [21:0]fcnt;
reg [14:0]display;
reg [1:0]ftsd_ctl_en;
reg [3:0]ftsd_ctl;
reg ftsd_in;


always @(fcnt or fout or ftsd_ctl_en)
	ftemp={fout,fcnt,ftsd_ctl_en}+1'b1;

always @(posedge clk)
	{fout,fcnt,ftsd_ctl_en}=ftemp;

always @(q)
	q_tmp = q + 1'b1;
	
always @(posedge fout)
	q = q_tmp;


// 14-segment display scan control
always @*
  case (ftsd_ctl_en)
    2'b00: 
    begin
      ftsd_ctl=4'b0111;
      ftsd_in=q[0];
    end
    2'b01: 
    begin
      ftsd_ctl=4'b1011;
      ftsd_in=q[1];
    end
	 2'b10: 
    begin
      ftsd_ctl=4'b1101;
      ftsd_in=q[2];
    end
	 2'b11: 
    begin
      ftsd_ctl=4'b1110;
      ftsd_in=q[3];
    end
    default: 
    begin
      ftsd_ctl=4'b0000;
      ftsd_in=q[0];
    end
  endcase


always @(ftsd_in)
	case(ftsd_in)
		4'd0:	display=15'b0000_0011_1111_111;//0
		4'd1:	display=15'b1111_1111_1011_011;//1
		4'd2:	display=15'b0010_0100_1111_111;//2
		4'd3:	display=15'b0000_1100_1111_111;//3
		4'd4:	display=15'b1001_1000_1111_111;//4
		4'd5:	display=15'b0100_1000_1111_111;//5
		4'd6:	display=15'b0100_0000_1111_111;//6
		4'd7:	display=15'b0001_1111_1111_111;//7
		4'd8:	display=15'b0000_0000_1111_111;//8
		4'd9:	display=15'b0000_1000_1111_111;//9
		default:	display=15'b0111_0000_1111_111;//F
	endcase

endmodule



