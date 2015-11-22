`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:07:44 11/10/2015 
// Design Name: 
// Module Name:    coeff_reg 
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
module coeff_comparator(
	 // 21 bits two's complement adc_count
	 input  [20:0] adc_count_i,
	 // section limit
	 input  [19:0] section_limit,
	 // output section 
	 output reg [1:0] adc_section_o
    );
    // temporariy reg wire
	 reg  [21:0] tmp_store;

	
always @(*)
begin
	// when adc_count >0
	if(adc_count_i[20]==0 && adc_count_i != 21'b0)
	begin
		if(adc_count_i>section_limit)
		begin
			adc_section_o = 2'b11;	
		end
		else
		begin
			adc_section_o = 2'b10;
		end
	end
	// when adc_count <=0
	else 
	begin
		tmp_store[21]=0;
		tmp_store[20:0]=~adc_count_i+1;
	   if(tmp_store>section_limit)
		begin
			adc_section_o = 2'b00;
		end
		else
		begin
			adc_section_o = 2'b01;
		end
	end
end

endmodule
