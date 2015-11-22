`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:30:07 11/15/2015 
// Design Name: 
// Module Name:    delay_sync 
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
module delay_block(
 input in,
 output reg out,
 input clk
	);

reg temp = 0;
	
always@(clk)
begin
  
  temp <=in;
  out <= temp;
  
end

endmodule
