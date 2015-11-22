
module std_selection(
	  input [31:0] select_section_coefficients_stdev_4_porty, // ufix32
    input [31:0] select_section_coefficients_stdev_3_porty, // ufix32
    input [31:0] select_section_coefficients_stdev_2_porty, // ufix32
    input [31:0] select_section_coefficients_stdev_1_porty, // ufix32
    input [31:0] select_section_coefficients_mean_4_porty, // ufix32
    input [31:0] select_section_coefficients_mean_3_porty, // ufix32
    input [31:0] select_section_coefficients_mean_2_porty, // ufix32
    input [31:0] select_section_coefficients_mean_1_porty, // ufix32 
	  input [1:0] adc_section,
	  output reg [31:0] std_output,
	  output reg [31:0] mean_output
    );
    
always @(*)
begin
  case(adc_section)
		2'b00:
		begin
			std_output = select_section_coefficients_stdev_1_porty;
			mean_output = select_section_coefficients_mean_1_porty;
		end
		2'b01:
		begin
			std_output = select_section_coefficients_stdev_2_porty;
			mean_output = select_section_coefficients_mean_2_porty;
		end
		2'b10:
		begin
			std_output = select_section_coefficients_stdev_3_porty;
			mean_output = select_section_coefficients_mean_3_porty;
		end
		2'b11:
		begin
			std_output = select_section_coefficients_stdev_4_porty;
			mean_output = select_section_coefficients_mean_4_porty;
		end
	endcase
end

endmodule