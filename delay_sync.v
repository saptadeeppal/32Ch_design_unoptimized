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
module delay_sync(
 input [31:0] sync_i, 
 input srdyi, 
 output reg [31:0] sync_o,
 input GlobalReset
	);

always@(posedge srdyi)
begin
	if(GlobalReset == 0) sync_o <= sync_i;
	else if(GlobalReset == 1) sync_o <= 0;
end
endmodule
