`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:37:04 07/30/2015 
// Design Name: 
// Module Name:    bcdupcounter 
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
module bcdupcounter(
	output [3:0]q,
	output [3:0]q1,
	input clk,
	input rst_n
		    );

reg [3:0]q;
reg [3:0]q1;
reg [3:0]q_tmp;
reg [3:0]q1_tmp;


always @(*)
begin
	q1_tmp <=q1;
	q_tmp <=q;
end


	
	
always @(posedge clk or negedge rst_n)
if(~rst_n)
	begin
		q <= 4'd0;
		q1 <= 4'd0;
	end
else
	begin
	if(q1!=4'd9 && q==4'd9)
		begin
			q<=4'd0;
			q1<=q1_tmp+4'd1;
		end
	else if(q1==4'd9 && q==4'd9)
		begin
			q<=4'd0;
			q1<=4'd0;
		end
	else
		begin
			q<=q_tmp+4'd1;
		end
	end

	
	
endmodule



