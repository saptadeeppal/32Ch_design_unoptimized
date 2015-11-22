`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:02:07 11/15/2015 
// Design Name: 
// Module Name:    mean_selection 
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
module std_selection(
	 input [31:0] select_section_coefficients_stdev_4_porty, // ufix32
    input [31:0] select_section_coefficients_stdev_3_porty, // ufix32
    input [31:0] select_section_coefficients_stdev_2_porty, // ufix32
    input [31:0] select_section_coefficients_stdev_1_porty, // ufix32
	 input [1:0] adc_section,
	 output reg [31:0] std_o
    );

always @(*)
begin
	case(adc_section)
		2'b00:
		begin
			std_o = select_section_coefficients_stdev_1_porty;
		end
		2'b01:
		begin
			std_o = select_section_coefficients_stdev_2_porty;
		end
		2'b10:
		begin
			std_o = select_section_coefficients_stdev_3_porty;
		end
		2'b11:
		begin
			std_o = select_section_coefficients_stdev_4_porty;
		end
	endcase
end

endmodule