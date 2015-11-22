`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:04:01 11/15/2015 
// Design Name: 
// Module Name:    coeff_selection 
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
module coeff_selection(
	 // adc section   
	 input [1:0] adc_section, 
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 input [31:0] select_section_coefficients_coeff_4_9_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_4_8_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_4_7_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_4_6_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_4_5_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_4_4_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_4_3_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_4_2_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_4_10_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_4_1_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_4_0_porty, // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 input [31:0] select_section_coefficients_coeff_3_9_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_3_8_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_3_7_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_3_6_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_3_5_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_3_4_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_3_3_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_3_2_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_3_10_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_3_1_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_3_0_porty, // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 input [31:0] select_section_coefficients_coeff_2_9_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_2_8_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_2_7_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_2_6_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_2_5_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_2_4_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_2_3_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_2_2_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_2_10_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_2_1_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_2_0_porty, // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 input [31:0] select_section_coefficients_coeff_1_9_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_1_8_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_1_7_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_1_6_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_1_5_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_1_4_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_1_3_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_1_2_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_1_10_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_1_1_porty, // ufix32
    input [31:0] select_section_coefficients_coeff_1_0_porty, // ufix32 
	 // output logic
	 output reg [31:0]	coeff1_o, // ufix32
    output reg [31:0] coeff2_o, // ufix32
    output reg [31:0] coeff3_o, // ufix32
    output reg [31:0] coeff4_o, // ufix32
    output reg [31:0] coeff5_o, // ufix32
    output reg [31:0] coeff6_o, // ufix32
    output reg [31:0] coeff7_o, // ufix32
    output reg [31:0] coeff8_o, // ufix32
    output reg [31:0] coeff9_o, // ufix32
    output reg [31:0] coeff10_o, // ufix32
    output reg [31:0] coeff0_o // ufix32 

    );

always @(*)
begin
	case(adc_section)
		// section 1
		2'b00:
		begin
			coeff0_o = select_section_coefficients_coeff_1_10_porty;
			coeff1_o = select_section_coefficients_coeff_1_9_porty;
			coeff2_o = select_section_coefficients_coeff_1_8_porty;
			coeff3_o = select_section_coefficients_coeff_1_7_porty;
			coeff4_o = select_section_coefficients_coeff_1_6_porty;
			coeff5_o = select_section_coefficients_coeff_1_5_porty;
			coeff6_o = select_section_coefficients_coeff_1_4_porty;
			coeff7_o = select_section_coefficients_coeff_1_3_porty;
			coeff8_o = select_section_coefficients_coeff_1_2_porty;
			coeff9_o = select_section_coefficients_coeff_1_1_porty;
			coeff10_o = select_section_coefficients_coeff_1_0_porty;
		end
		// section 2
		2'b01:
		begin
			coeff0_o = select_section_coefficients_coeff_2_10_porty;
			coeff1_o = select_section_coefficients_coeff_2_9_porty;
			coeff2_o = select_section_coefficients_coeff_2_8_porty;
			coeff3_o = select_section_coefficients_coeff_2_7_porty;
			coeff4_o = select_section_coefficients_coeff_2_6_porty;
			coeff5_o = select_section_coefficients_coeff_2_5_porty;
			coeff6_o = select_section_coefficients_coeff_2_4_porty;
			coeff7_o = select_section_coefficients_coeff_2_3_porty;
			coeff8_o = select_section_coefficients_coeff_2_2_porty;
			coeff9_o = select_section_coefficients_coeff_2_1_porty;
			coeff10_o = select_section_coefficients_coeff_2_0_porty;
		end
		// section 3
		2'b10:
		begin
			coeff0_o = select_section_coefficients_coeff_3_10_porty;
			coeff1_o = select_section_coefficients_coeff_3_9_porty;
			coeff2_o = select_section_coefficients_coeff_3_8_porty;
			coeff3_o = select_section_coefficients_coeff_3_7_porty;
			coeff4_o = select_section_coefficients_coeff_3_6_porty;
			coeff5_o = select_section_coefficients_coeff_3_5_porty;
			coeff6_o = select_section_coefficients_coeff_3_4_porty;
			coeff7_o = select_section_coefficients_coeff_3_3_porty;
			coeff8_o = select_section_coefficients_coeff_3_2_porty;
			coeff9_o = select_section_coefficients_coeff_3_1_porty;
			coeff10_o = select_section_coefficients_coeff_3_0_porty;
		end
		// section 4
		2'b11:
		begin
			coeff0_o = select_section_coefficients_coeff_4_10_porty;
			coeff1_o = select_section_coefficients_coeff_4_9_porty;
			coeff2_o = select_section_coefficients_coeff_4_8_porty;
			coeff3_o = select_section_coefficients_coeff_4_7_porty;
			coeff4_o = select_section_coefficients_coeff_4_6_porty;
			coeff5_o = select_section_coefficients_coeff_4_5_porty;
			coeff6_o = select_section_coefficients_coeff_4_4_porty;
			coeff7_o = select_section_coefficients_coeff_4_3_porty;
			coeff8_o = select_section_coefficients_coeff_4_2_porty;
			coeff9_o = select_section_coefficients_coeff_4_1_porty;
			coeff10_o = select_section_coefficients_coeff_4_0_porty;
		end	
	endcase
end

endmodule
