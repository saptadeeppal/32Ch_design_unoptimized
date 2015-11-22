
module NLC_4sec_10th_order_1ch_v0 (
  input clk,
  input GlobalReset,
  input [31:0] select_section_coefficients_stdev_4_porty, // ufix32
  input [31:0] select_section_coefficients_stdev_3_porty, // ufix32
  input [31:0] select_section_coefficients_stdev_2_porty, // ufix32
  input [31:0] select_section_coefficients_stdev_1_porty, // ufix32
  input [31:0] select_section_coefficients_mean_4_porty, // ufix32
  input [31:0] select_section_coefficients_mean_3_porty, // ufix32
  input [31:0] select_section_coefficients_mean_2_porty, // ufix32
  input [31:0] select_section_coefficients_mean_1_porty, // ufix32
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
  output [20:0] x_lin, // sfix21
  input [20:0] x_adc, // sfix21
  output srdyo, // ufix1
  input srdyi, // ufix1
  input [19:0] section_limit // ufix20

);

adc_correction_engine UUT(
  //System clock and reset
  .sys_clk_i(clk),
  .reset_i(GlobalReset),
  
  //ADC input
  .srdyi(srdyi), 
  .adc_correction_in(x_adc),

  //NLC output
  .srdyo(srdyo), 
  .adc_correction_out(x_lin), 

  //X-value that separates the sections
  .section_limit(section_limit),

  //Reciprocal standard deviation for the centered and scaled fit
  .select_section_coefficients_stdev_4_porty(select_section_coefficients_stdev_4_porty), 
  .select_section_coefficients_stdev_3_porty(select_section_coefficients_stdev_3_porty), 
  .select_section_coefficients_stdev_2_porty(select_section_coefficients_stdev_2_porty), 
  .select_section_coefficients_stdev_1_porty(select_section_coefficients_stdev_1_porty), 

  //Negative meand for the centered and scaled fit
  .select_section_coefficients_mean_4_porty(select_section_coefficients_mean_4_porty), 
  .select_section_coefficients_mean_3_porty(select_section_coefficients_mean_3_porty), 
  .select_section_coefficients_mean_2_porty(select_section_coefficients_mean_2_porty), 
  .select_section_coefficients_mean_1_porty(select_section_coefficients_mean_1_porty), 

  //Section 4 coefficients (x > 0, |x| > section_limit)
  .select_section_coefficients_coeff_4_10_porty(select_section_coefficients_coeff_4_10_porty), 
  .select_section_coefficients_coeff_4_9_porty(select_section_coefficients_coeff_4_9_porty), 
  .select_section_coefficients_coeff_4_8_porty(select_section_coefficients_coeff_4_8_porty), 
  .select_section_coefficients_coeff_4_7_porty(select_section_coefficients_coeff_4_7_porty), 
  .select_section_coefficients_coeff_4_6_porty(select_section_coefficients_coeff_4_6_porty), 
  .select_section_coefficients_coeff_4_5_porty(select_section_coefficients_coeff_4_5_porty), 
  .select_section_coefficients_coeff_4_4_porty(select_section_coefficients_coeff_4_4_porty), 
  .select_section_coefficients_coeff_4_3_porty(select_section_coefficients_coeff_4_3_porty), 
  .select_section_coefficients_coeff_4_2_porty(select_section_coefficients_coeff_4_2_porty), 
  .select_section_coefficients_coeff_4_1_porty(select_section_coefficients_coeff_4_1_porty), 
  .select_section_coefficients_coeff_4_0_porty(select_section_coefficients_coeff_4_0_porty), 

  //Section 3 coefficients (x > 0, |x| <= section_limit)
  .select_section_coefficients_coeff_3_10_porty(select_section_coefficients_coeff_3_10_porty), 
  .select_section_coefficients_coeff_3_9_porty(select_section_coefficients_coeff_3_9_porty), 
  .select_section_coefficients_coeff_3_8_porty(select_section_coefficients_coeff_3_8_porty), 
  .select_section_coefficients_coeff_3_7_porty(select_section_coefficients_coeff_3_7_porty), 
  .select_section_coefficients_coeff_3_6_porty(select_section_coefficients_coeff_3_6_porty), 
  .select_section_coefficients_coeff_3_5_porty(select_section_coefficients_coeff_3_5_porty), 
  .select_section_coefficients_coeff_3_4_porty(select_section_coefficients_coeff_3_4_porty), 
  .select_section_coefficients_coeff_3_3_porty(select_section_coefficients_coeff_3_3_porty), 
  .select_section_coefficients_coeff_3_2_porty(select_section_coefficients_coeff_3_2_porty), 
  .select_section_coefficients_coeff_3_1_porty(select_section_coefficients_coeff_3_1_porty), 
  .select_section_coefficients_coeff_3_0_porty(select_section_coefficients_coeff_3_0_porty), 

  //Section 2 coefficients (x <= 0, |x| <= section_limit)
  .select_section_coefficients_coeff_2_10_porty(select_section_coefficients_coeff_2_10_porty), 
  .select_section_coefficients_coeff_2_9_porty(select_section_coefficients_coeff_2_9_porty), 
  .select_section_coefficients_coeff_2_8_porty(select_section_coefficients_coeff_2_8_porty), 
  .select_section_coefficients_coeff_2_7_porty(select_section_coefficients_coeff_2_7_porty), 
  .select_section_coefficients_coeff_2_6_porty(select_section_coefficients_coeff_2_6_porty), 
  .select_section_coefficients_coeff_2_5_porty(select_section_coefficients_coeff_2_5_porty), 
  .select_section_coefficients_coeff_2_4_porty(select_section_coefficients_coeff_2_4_porty), 
  .select_section_coefficients_coeff_2_3_porty(select_section_coefficients_coeff_2_3_porty), 
  .select_section_coefficients_coeff_2_2_porty(select_section_coefficients_coeff_2_2_porty), 
  .select_section_coefficients_coeff_2_1_porty(select_section_coefficients_coeff_2_1_porty), 
  .select_section_coefficients_coeff_2_0_porty(select_section_coefficients_coeff_2_0_porty), 

  //Section 1 coefficients (x <= 0, |x| > section_limit)
  .select_section_coefficients_coeff_1_10_porty(select_section_coefficients_coeff_1_10_porty), 
  .select_section_coefficients_coeff_1_9_porty(select_section_coefficients_coeff_1_9_porty), 
  .select_section_coefficients_coeff_1_8_porty(select_section_coefficients_coeff_1_8_porty), 
  .select_section_coefficients_coeff_1_7_porty(select_section_coefficients_coeff_1_7_porty), 
  .select_section_coefficients_coeff_1_6_porty(select_section_coefficients_coeff_1_6_porty), 
  .select_section_coefficients_coeff_1_5_porty(select_section_coefficients_coeff_1_5_porty), 
  .select_section_coefficients_coeff_1_4_porty(select_section_coefficients_coeff_1_4_porty), 
  .select_section_coefficients_coeff_1_3_porty(select_section_coefficients_coeff_1_3_porty), 
  .select_section_coefficients_coeff_1_2_porty(select_section_coefficients_coeff_1_2_porty), 
  .select_section_coefficients_coeff_1_1_porty(select_section_coefficients_coeff_1_1_porty), 
  .select_section_coefficients_coeff_1_0_porty(select_section_coefficients_coeff_1_0_porty) 
);


endmodule

