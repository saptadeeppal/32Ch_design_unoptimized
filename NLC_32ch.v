`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:09:43 11/21/2015 
// Design Name: 
// Module Name:    NLC_32ch 
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
module NLC_32ch(
  input clk,
  input reset,

  //Input valid and output ready signals (one for all 32ch)  
  input srdyi, 
  output srdyo, 

  input [20:0] ch31_x_adc,//NLC output 
  output [20:0] ch31_x_lin,//ADC output 
  input [19:0] ch31_section_limit,//X-value that separates the sections 
  input [31:0] ch31_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch31_recip_stdev_3, 
  input [31:0] ch31_recip_stdev_2, 
  input [31:0] ch31_recip_stdev_1, 
  input [31:0] ch31_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch31_neg_mean_3, 
  input [31:0] ch31_neg_mean_2, 
  input [31:0] ch31_neg_mean_1,
  input [31:0] ch31_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch31_coeff_4_9,
  input [31:0] ch31_coeff_4_8,
  input [31:0] ch31_coeff_4_7,
  input [31:0] ch31_coeff_4_6,
  input [31:0] ch31_coeff_4_5,
  input [31:0] ch31_coeff_4_4,
  input [31:0] ch31_coeff_4_3,
  input [31:0] ch31_coeff_4_2,
  input [31:0] ch31_coeff_4_1,
  input [31:0] ch31_coeff_4_0,
  input [31:0] ch31_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch31_coeff_3_9,
  input [31:0] ch31_coeff_3_8,
  input [31:0] ch31_coeff_3_7,
  input [31:0] ch31_coeff_3_6,
  input [31:0] ch31_coeff_3_5,
  input [31:0] ch31_coeff_3_4,
  input [31:0] ch31_coeff_3_3,
  input [31:0] ch31_coeff_3_2,
  input [31:0] ch31_coeff_3_1,
  input [31:0] ch31_coeff_3_0,
  input [31:0] ch31_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch31_coeff_2_9,
  input [31:0] ch31_coeff_2_8,
  input [31:0] ch31_coeff_2_7,
  input [31:0] ch31_coeff_2_6,
  input [31:0] ch31_coeff_2_5,
  input [31:0] ch31_coeff_2_4,
  input [31:0] ch31_coeff_2_3,
  input [31:0] ch31_coeff_2_2,
  input [31:0] ch31_coeff_2_1,
  input [31:0] ch31_coeff_2_0,
  input [31:0] ch31_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch31_coeff_1_9,
  input [31:0] ch31_coeff_1_8,
  input [31:0] ch31_coeff_1_7,
  input [31:0] ch31_coeff_1_6,
  input [31:0] ch31_coeff_1_5,
  input [31:0] ch31_coeff_1_4,
  input [31:0] ch31_coeff_1_3,
  input [31:0] ch31_coeff_1_2,
  input [31:0] ch31_coeff_1_1,
  input [31:0] ch31_coeff_1_0, 

  input [20:0] ch30_x_adc,//NLC output 
  output [20:0] ch30_x_lin,//ADC output 
  input [19:0] ch30_section_limit,//X-value that separates the sections 
  input [31:0] ch30_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch30_recip_stdev_3, 
  input [31:0] ch30_recip_stdev_2, 
  input [31:0] ch30_recip_stdev_1, 
  input [31:0] ch30_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch30_neg_mean_3, 
  input [31:0] ch30_neg_mean_2, 
  input [31:0] ch30_neg_mean_1,
  input [31:0] ch30_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch30_coeff_4_9,
  input [31:0] ch30_coeff_4_8,
  input [31:0] ch30_coeff_4_7,
  input [31:0] ch30_coeff_4_6,
  input [31:0] ch30_coeff_4_5,
  input [31:0] ch30_coeff_4_4,
  input [31:0] ch30_coeff_4_3,
  input [31:0] ch30_coeff_4_2,
  input [31:0] ch30_coeff_4_1,
  input [31:0] ch30_coeff_4_0,
  input [31:0] ch30_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch30_coeff_3_9,
  input [31:0] ch30_coeff_3_8,
  input [31:0] ch30_coeff_3_7,
  input [31:0] ch30_coeff_3_6,
  input [31:0] ch30_coeff_3_5,
  input [31:0] ch30_coeff_3_4,
  input [31:0] ch30_coeff_3_3,
  input [31:0] ch30_coeff_3_2,
  input [31:0] ch30_coeff_3_1,
  input [31:0] ch30_coeff_3_0,
  input [31:0] ch30_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch30_coeff_2_9,
  input [31:0] ch30_coeff_2_8,
  input [31:0] ch30_coeff_2_7,
  input [31:0] ch30_coeff_2_6,
  input [31:0] ch30_coeff_2_5,
  input [31:0] ch30_coeff_2_4,
  input [31:0] ch30_coeff_2_3,
  input [31:0] ch30_coeff_2_2,
  input [31:0] ch30_coeff_2_1,
  input [31:0] ch30_coeff_2_0,
  input [31:0] ch30_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch30_coeff_1_9,
  input [31:0] ch30_coeff_1_8,
  input [31:0] ch30_coeff_1_7,
  input [31:0] ch30_coeff_1_6,
  input [31:0] ch30_coeff_1_5,
  input [31:0] ch30_coeff_1_4,
  input [31:0] ch30_coeff_1_3,
  input [31:0] ch30_coeff_1_2,
  input [31:0] ch30_coeff_1_1,
  input [31:0] ch30_coeff_1_0,
  
  
  input [20:0] ch29_x_adc,//NLC output 
  output [20:0] ch29_x_lin,//ADC output 
  input [19:0] ch29_section_limit,//X-value that separates the sections 
  input [31:0] ch29_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch29_recip_stdev_3, 
  input [31:0] ch29_recip_stdev_2, 
  input [31:0] ch29_recip_stdev_1, 
  input [31:0] ch29_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch29_neg_mean_3, 
  input [31:0] ch29_neg_mean_2, 
  input [31:0] ch29_neg_mean_1,
  input [31:0] ch29_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch29_coeff_4_9,
  input [31:0] ch29_coeff_4_8,
  input [31:0] ch29_coeff_4_7,
  input [31:0] ch29_coeff_4_6,
  input [31:0] ch29_coeff_4_5,
  input [31:0] ch29_coeff_4_4,
  input [31:0] ch29_coeff_4_3,
  input [31:0] ch29_coeff_4_2,
  input [31:0] ch29_coeff_4_1,
  input [31:0] ch29_coeff_4_0,
  input [31:0] ch29_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch29_coeff_3_9,
  input [31:0] ch29_coeff_3_8,
  input [31:0] ch29_coeff_3_7,
  input [31:0] ch29_coeff_3_6,
  input [31:0] ch29_coeff_3_5,
  input [31:0] ch29_coeff_3_4,
  input [31:0] ch29_coeff_3_3,
  input [31:0] ch29_coeff_3_2,
  input [31:0] ch29_coeff_3_1,
  input [31:0] ch29_coeff_3_0,
  input [31:0] ch29_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch29_coeff_2_9,
  input [31:0] ch29_coeff_2_8,
  input [31:0] ch29_coeff_2_7,
  input [31:0] ch29_coeff_2_6,
  input [31:0] ch29_coeff_2_5,
  input [31:0] ch29_coeff_2_4,
  input [31:0] ch29_coeff_2_3,
  input [31:0] ch29_coeff_2_2,
  input [31:0] ch29_coeff_2_1,
  input [31:0] ch29_coeff_2_0,
  input [31:0] ch29_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch29_coeff_1_9,
  input [31:0] ch29_coeff_1_8,
  input [31:0] ch29_coeff_1_7,
  input [31:0] ch29_coeff_1_6,
  input [31:0] ch29_coeff_1_5,
  input [31:0] ch29_coeff_1_4,
  input [31:0] ch29_coeff_1_3,
  input [31:0] ch29_coeff_1_2,
  input [31:0] ch29_coeff_1_1,
  input [31:0] ch29_coeff_1_0,
  
  
  input [20:0] ch28_x_adc,//NLC output 
  output [20:0] ch28_x_lin,//ADC output 
  input [19:0] ch28_section_limit,//X-value that separates the sections 
  input [31:0] ch28_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch28_recip_stdev_3, 
  input [31:0] ch28_recip_stdev_2, 
  input [31:0] ch28_recip_stdev_1, 
  input [31:0] ch28_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch28_neg_mean_3, 
  input [31:0] ch28_neg_mean_2, 
  input [31:0] ch28_neg_mean_1,
  input [31:0] ch28_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch28_coeff_4_9,
  input [31:0] ch28_coeff_4_8,
  input [31:0] ch28_coeff_4_7,
  input [31:0] ch28_coeff_4_6,
  input [31:0] ch28_coeff_4_5,
  input [31:0] ch28_coeff_4_4,
  input [31:0] ch28_coeff_4_3,
  input [31:0] ch28_coeff_4_2,
  input [31:0] ch28_coeff_4_1,
  input [31:0] ch28_coeff_4_0,
  input [31:0] ch28_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch28_coeff_3_9,
  input [31:0] ch28_coeff_3_8,
  input [31:0] ch28_coeff_3_7,
  input [31:0] ch28_coeff_3_6,
  input [31:0] ch28_coeff_3_5,
  input [31:0] ch28_coeff_3_4,
  input [31:0] ch28_coeff_3_3,
  input [31:0] ch28_coeff_3_2,
  input [31:0] ch28_coeff_3_1,
  input [31:0] ch28_coeff_3_0,
  input [31:0] ch28_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch28_coeff_2_9,
  input [31:0] ch28_coeff_2_8,
  input [31:0] ch28_coeff_2_7,
  input [31:0] ch28_coeff_2_6,
  input [31:0] ch28_coeff_2_5,
  input [31:0] ch28_coeff_2_4,
  input [31:0] ch28_coeff_2_3,
  input [31:0] ch28_coeff_2_2,
  input [31:0] ch28_coeff_2_1,
  input [31:0] ch28_coeff_2_0,
  input [31:0] ch28_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch28_coeff_1_9,
  input [31:0] ch28_coeff_1_8,
  input [31:0] ch28_coeff_1_7,
  input [31:0] ch28_coeff_1_6,
  input [31:0] ch28_coeff_1_5,
  input [31:0] ch28_coeff_1_4,
  input [31:0] ch28_coeff_1_3,
  input [31:0] ch28_coeff_1_2,
  input [31:0] ch28_coeff_1_1,
  input [31:0] ch28_coeff_1_0,

  input [20:0] ch27_x_adc,//NLC output 
  output [20:0] ch27_x_lin,//ADC output 
  input [19:0] ch27_section_limit,//X-value that separates the sections 
  input [31:0] ch27_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch27_recip_stdev_3, 
  input [31:0] ch27_recip_stdev_2, 
  input [31:0] ch27_recip_stdev_1, 
  input [31:0] ch27_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch27_neg_mean_3, 
  input [31:0] ch27_neg_mean_2, 
  input [31:0] ch27_neg_mean_1,
  input [31:0] ch27_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch27_coeff_4_9,
  input [31:0] ch27_coeff_4_8,
  input [31:0] ch27_coeff_4_7,
  input [31:0] ch27_coeff_4_6,
  input [31:0] ch27_coeff_4_5,
  input [31:0] ch27_coeff_4_4,
  input [31:0] ch27_coeff_4_3,
  input [31:0] ch27_coeff_4_2,
  input [31:0] ch27_coeff_4_1,
  input [31:0] ch27_coeff_4_0,
  input [31:0] ch27_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch27_coeff_3_9,
  input [31:0] ch27_coeff_3_8,
  input [31:0] ch27_coeff_3_7,
  input [31:0] ch27_coeff_3_6,
  input [31:0] ch27_coeff_3_5,
  input [31:0] ch27_coeff_3_4,
  input [31:0] ch27_coeff_3_3,
  input [31:0] ch27_coeff_3_2,
  input [31:0] ch27_coeff_3_1,
  input [31:0] ch27_coeff_3_0,
  input [31:0] ch27_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch27_coeff_2_9,
  input [31:0] ch27_coeff_2_8,
  input [31:0] ch27_coeff_2_7,
  input [31:0] ch27_coeff_2_6,
  input [31:0] ch27_coeff_2_5,
  input [31:0] ch27_coeff_2_4,
  input [31:0] ch27_coeff_2_3,
  input [31:0] ch27_coeff_2_2,
  input [31:0] ch27_coeff_2_1,
  input [31:0] ch27_coeff_2_0,
  input [31:0] ch27_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch27_coeff_1_9,
  input [31:0] ch27_coeff_1_8,
  input [31:0] ch27_coeff_1_7,
  input [31:0] ch27_coeff_1_6,
  input [31:0] ch27_coeff_1_5,
  input [31:0] ch27_coeff_1_4,
  input [31:0] ch27_coeff_1_3,
  input [31:0] ch27_coeff_1_2,
  input [31:0] ch27_coeff_1_1,
  input [31:0] ch27_coeff_1_0,

  input [20:0] ch26_x_adc,//NLC output 
  output [20:0] ch26_x_lin,//ADC output 
  input [19:0] ch26_section_limit,//X-value that separates the sections 
  input [31:0] ch26_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch26_recip_stdev_3, 
  input [31:0] ch26_recip_stdev_2, 
  input [31:0] ch26_recip_stdev_1, 
  input [31:0] ch26_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch26_neg_mean_3, 
  input [31:0] ch26_neg_mean_2, 
  input [31:0] ch26_neg_mean_1,
  input [31:0] ch26_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch26_coeff_4_9,
  input [31:0] ch26_coeff_4_8,
  input [31:0] ch26_coeff_4_7,
  input [31:0] ch26_coeff_4_6,
  input [31:0] ch26_coeff_4_5,
  input [31:0] ch26_coeff_4_4,
  input [31:0] ch26_coeff_4_3,
  input [31:0] ch26_coeff_4_2,
  input [31:0] ch26_coeff_4_1,
  input [31:0] ch26_coeff_4_0,
  input [31:0] ch26_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch26_coeff_3_9,
  input [31:0] ch26_coeff_3_8,
  input [31:0] ch26_coeff_3_7,
  input [31:0] ch26_coeff_3_6,
  input [31:0] ch26_coeff_3_5,
  input [31:0] ch26_coeff_3_4,
  input [31:0] ch26_coeff_3_3,
  input [31:0] ch26_coeff_3_2,
  input [31:0] ch26_coeff_3_1,
  input [31:0] ch26_coeff_3_0,
  input [31:0] ch26_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch26_coeff_2_9,
  input [31:0] ch26_coeff_2_8,
  input [31:0] ch26_coeff_2_7,
  input [31:0] ch26_coeff_2_6,
  input [31:0] ch26_coeff_2_5,
  input [31:0] ch26_coeff_2_4,
  input [31:0] ch26_coeff_2_3,
  input [31:0] ch26_coeff_2_2,
  input [31:0] ch26_coeff_2_1,
  input [31:0] ch26_coeff_2_0,
  input [31:0] ch26_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch26_coeff_1_9,
  input [31:0] ch26_coeff_1_8,
  input [31:0] ch26_coeff_1_7,
  input [31:0] ch26_coeff_1_6,
  input [31:0] ch26_coeff_1_5,
  input [31:0] ch26_coeff_1_4,
  input [31:0] ch26_coeff_1_3,
  input [31:0] ch26_coeff_1_2,
  input [31:0] ch26_coeff_1_1,
  input [31:0] ch26_coeff_1_0,
  
  
  input [20:0] ch25_x_adc,//NLC output 
  output [20:0] ch25_x_lin,//ADC output 
  input [19:0] ch25_section_limit,//X-value that separates the sections 
  input [31:0] ch25_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch25_recip_stdev_3, 
  input [31:0] ch25_recip_stdev_2, 
  input [31:0] ch25_recip_stdev_1, 
  input [31:0] ch25_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch25_neg_mean_3, 
  input [31:0] ch25_neg_mean_2, 
  input [31:0] ch25_neg_mean_1,
  input [31:0] ch25_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch25_coeff_4_9,
  input [31:0] ch25_coeff_4_8,
  input [31:0] ch25_coeff_4_7,
  input [31:0] ch25_coeff_4_6,
  input [31:0] ch25_coeff_4_5,
  input [31:0] ch25_coeff_4_4,
  input [31:0] ch25_coeff_4_3,
  input [31:0] ch25_coeff_4_2,
  input [31:0] ch25_coeff_4_1,
  input [31:0] ch25_coeff_4_0,
  input [31:0] ch25_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch25_coeff_3_9,
  input [31:0] ch25_coeff_3_8,
  input [31:0] ch25_coeff_3_7,
  input [31:0] ch25_coeff_3_6,
  input [31:0] ch25_coeff_3_5,
  input [31:0] ch25_coeff_3_4,
  input [31:0] ch25_coeff_3_3,
  input [31:0] ch25_coeff_3_2,
  input [31:0] ch25_coeff_3_1,
  input [31:0] ch25_coeff_3_0,
  input [31:0] ch25_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch25_coeff_2_9,
  input [31:0] ch25_coeff_2_8,
  input [31:0] ch25_coeff_2_7,
  input [31:0] ch25_coeff_2_6,
  input [31:0] ch25_coeff_2_5,
  input [31:0] ch25_coeff_2_4,
  input [31:0] ch25_coeff_2_3,
  input [31:0] ch25_coeff_2_2,
  input [31:0] ch25_coeff_2_1,
  input [31:0] ch25_coeff_2_0,
  input [31:0] ch25_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch25_coeff_1_9,
  input [31:0] ch25_coeff_1_8,
  input [31:0] ch25_coeff_1_7,
  input [31:0] ch25_coeff_1_6,
  input [31:0] ch25_coeff_1_5,
  input [31:0] ch25_coeff_1_4,
  input [31:0] ch25_coeff_1_3,
  input [31:0] ch25_coeff_1_2,
  input [31:0] ch25_coeff_1_1,
  input [31:0] ch25_coeff_1_0, 

  input [20:0] ch24_x_adc,//NLC output 
  output [20:0] ch24_x_lin,//ADC output 
  input [19:0] ch24_section_limit,//X-value that separates the sections 
  input [31:0] ch24_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch24_recip_stdev_3, 
  input [31:0] ch24_recip_stdev_2, 
  input [31:0] ch24_recip_stdev_1, 
  input [31:0] ch24_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch24_neg_mean_3, 
  input [31:0] ch24_neg_mean_2, 
  input [31:0] ch24_neg_mean_1,
  input [31:0] ch24_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch24_coeff_4_9,
  input [31:0] ch24_coeff_4_8,
  input [31:0] ch24_coeff_4_7,
  input [31:0] ch24_coeff_4_6,
  input [31:0] ch24_coeff_4_5,
  input [31:0] ch24_coeff_4_4,
  input [31:0] ch24_coeff_4_3,
  input [31:0] ch24_coeff_4_2,
  input [31:0] ch24_coeff_4_1,
  input [31:0] ch24_coeff_4_0,
  input [31:0] ch24_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch24_coeff_3_9,
  input [31:0] ch24_coeff_3_8,
  input [31:0] ch24_coeff_3_7,
  input [31:0] ch24_coeff_3_6,
  input [31:0] ch24_coeff_3_5,
  input [31:0] ch24_coeff_3_4,
  input [31:0] ch24_coeff_3_3,
  input [31:0] ch24_coeff_3_2,
  input [31:0] ch24_coeff_3_1,
  input [31:0] ch24_coeff_3_0,
  input [31:0] ch24_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch24_coeff_2_9,
  input [31:0] ch24_coeff_2_8,
  input [31:0] ch24_coeff_2_7,
  input [31:0] ch24_coeff_2_6,
  input [31:0] ch24_coeff_2_5,
  input [31:0] ch24_coeff_2_4,
  input [31:0] ch24_coeff_2_3,
  input [31:0] ch24_coeff_2_2,
  input [31:0] ch24_coeff_2_1,
  input [31:0] ch24_coeff_2_0,
  input [31:0] ch24_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch24_coeff_1_9,
  input [31:0] ch24_coeff_1_8,
  input [31:0] ch24_coeff_1_7,
  input [31:0] ch24_coeff_1_6,
  input [31:0] ch24_coeff_1_5,
  input [31:0] ch24_coeff_1_4,
  input [31:0] ch24_coeff_1_3,
  input [31:0] ch24_coeff_1_2,
  input [31:0] ch24_coeff_1_1,
  input [31:0] ch24_coeff_1_0, 

  input [20:0] ch23_x_adc,//NLC output 
  output [20:0] ch23_x_lin,//ADC output 
  input [19:0] ch23_section_limit,//X-value that separates the sections 
  input [31:0] ch23_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch23_recip_stdev_3, 
  input [31:0] ch23_recip_stdev_2, 
  input [31:0] ch23_recip_stdev_1, 
  input [31:0] ch23_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch23_neg_mean_3, 
  input [31:0] ch23_neg_mean_2, 
  input [31:0] ch23_neg_mean_1,
  input [31:0] ch23_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch23_coeff_4_9,
  input [31:0] ch23_coeff_4_8,
  input [31:0] ch23_coeff_4_7,
  input [31:0] ch23_coeff_4_6,
  input [31:0] ch23_coeff_4_5,
  input [31:0] ch23_coeff_4_4,
  input [31:0] ch23_coeff_4_3,
  input [31:0] ch23_coeff_4_2,
  input [31:0] ch23_coeff_4_1,
  input [31:0] ch23_coeff_4_0,
  input [31:0] ch23_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch23_coeff_3_9,
  input [31:0] ch23_coeff_3_8,
  input [31:0] ch23_coeff_3_7,
  input [31:0] ch23_coeff_3_6,
  input [31:0] ch23_coeff_3_5,
  input [31:0] ch23_coeff_3_4,
  input [31:0] ch23_coeff_3_3,
  input [31:0] ch23_coeff_3_2,
  input [31:0] ch23_coeff_3_1,
  input [31:0] ch23_coeff_3_0,
  input [31:0] ch23_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch23_coeff_2_9,
  input [31:0] ch23_coeff_2_8,
  input [31:0] ch23_coeff_2_7,
  input [31:0] ch23_coeff_2_6,
  input [31:0] ch23_coeff_2_5,
  input [31:0] ch23_coeff_2_4,
  input [31:0] ch23_coeff_2_3,
  input [31:0] ch23_coeff_2_2,
  input [31:0] ch23_coeff_2_1,
  input [31:0] ch23_coeff_2_0,
  input [31:0] ch23_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch23_coeff_1_9,
  input [31:0] ch23_coeff_1_8,
  input [31:0] ch23_coeff_1_7,
  input [31:0] ch23_coeff_1_6,
  input [31:0] ch23_coeff_1_5,
  input [31:0] ch23_coeff_1_4,
  input [31:0] ch23_coeff_1_3,
  input [31:0] ch23_coeff_1_2,
  input [31:0] ch23_coeff_1_1,
  input [31:0] ch23_coeff_1_0,
  
  input [20:0] ch22_x_adc,//NLC output 
  output [20:0] ch22_x_lin,//ADC output 
  input [19:0] ch22_section_limit,//X-value that separates the sections 
  input [31:0] ch22_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch22_recip_stdev_3, 
  input [31:0] ch22_recip_stdev_2, 
  input [31:0] ch22_recip_stdev_1, 
  input [31:0] ch22_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch22_neg_mean_3, 
  input [31:0] ch22_neg_mean_2, 
  input [31:0] ch22_neg_mean_1,
  input [31:0] ch22_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch22_coeff_4_9,
  input [31:0] ch22_coeff_4_8,
  input [31:0] ch22_coeff_4_7,
  input [31:0] ch22_coeff_4_6,
  input [31:0] ch22_coeff_4_5,
  input [31:0] ch22_coeff_4_4,
  input [31:0] ch22_coeff_4_3,
  input [31:0] ch22_coeff_4_2,
  input [31:0] ch22_coeff_4_1,
  input [31:0] ch22_coeff_4_0,
  input [31:0] ch22_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch22_coeff_3_9,
  input [31:0] ch22_coeff_3_8,
  input [31:0] ch22_coeff_3_7,
  input [31:0] ch22_coeff_3_6,
  input [31:0] ch22_coeff_3_5,
  input [31:0] ch22_coeff_3_4,
  input [31:0] ch22_coeff_3_3,
  input [31:0] ch22_coeff_3_2,
  input [31:0] ch22_coeff_3_1,
  input [31:0] ch22_coeff_3_0,
  input [31:0] ch22_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch22_coeff_2_9,
  input [31:0] ch22_coeff_2_8,
  input [31:0] ch22_coeff_2_7,
  input [31:0] ch22_coeff_2_6,
  input [31:0] ch22_coeff_2_5,
  input [31:0] ch22_coeff_2_4,
  input [31:0] ch22_coeff_2_3,
  input [31:0] ch22_coeff_2_2,
  input [31:0] ch22_coeff_2_1,
  input [31:0] ch22_coeff_2_0,
  input [31:0] ch22_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch22_coeff_1_9,
  input [31:0] ch22_coeff_1_8,
  input [31:0] ch22_coeff_1_7,
  input [31:0] ch22_coeff_1_6,
  input [31:0] ch22_coeff_1_5,
  input [31:0] ch22_coeff_1_4,
  input [31:0] ch22_coeff_1_3,
  input [31:0] ch22_coeff_1_2,
  input [31:0] ch22_coeff_1_1,
  input [31:0] ch22_coeff_1_0, 

  input [20:0] ch21_x_adc,//NLC output 
  output [20:0] ch21_x_lin,//ADC output 
  input [19:0] ch21_section_limit,//X-value that separates the sections 
  input [31:0] ch21_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch21_recip_stdev_3, 
  input [31:0] ch21_recip_stdev_2, 
  input [31:0] ch21_recip_stdev_1, 
  input [31:0] ch21_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch21_neg_mean_3, 
  input [31:0] ch21_neg_mean_2, 
  input [31:0] ch21_neg_mean_1,
  input [31:0] ch21_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch21_coeff_4_9,
  input [31:0] ch21_coeff_4_8,
  input [31:0] ch21_coeff_4_7,
  input [31:0] ch21_coeff_4_6,
  input [31:0] ch21_coeff_4_5,
  input [31:0] ch21_coeff_4_4,
  input [31:0] ch21_coeff_4_3,
  input [31:0] ch21_coeff_4_2,
  input [31:0] ch21_coeff_4_1,
  input [31:0] ch21_coeff_4_0,
  input [31:0] ch21_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch21_coeff_3_9,
  input [31:0] ch21_coeff_3_8,
  input [31:0] ch21_coeff_3_7,
  input [31:0] ch21_coeff_3_6,
  input [31:0] ch21_coeff_3_5,
  input [31:0] ch21_coeff_3_4,
  input [31:0] ch21_coeff_3_3,
  input [31:0] ch21_coeff_3_2,
  input [31:0] ch21_coeff_3_1,
  input [31:0] ch21_coeff_3_0,
  input [31:0] ch21_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch21_coeff_2_9,
  input [31:0] ch21_coeff_2_8,
  input [31:0] ch21_coeff_2_7,
  input [31:0] ch21_coeff_2_6,
  input [31:0] ch21_coeff_2_5,
  input [31:0] ch21_coeff_2_4,
  input [31:0] ch21_coeff_2_3,
  input [31:0] ch21_coeff_2_2,
  input [31:0] ch21_coeff_2_1,
  input [31:0] ch21_coeff_2_0,
  input [31:0] ch21_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch21_coeff_1_9,
  input [31:0] ch21_coeff_1_8,
  input [31:0] ch21_coeff_1_7,
  input [31:0] ch21_coeff_1_6,
  input [31:0] ch21_coeff_1_5,
  input [31:0] ch21_coeff_1_4,
  input [31:0] ch21_coeff_1_3,
  input [31:0] ch21_coeff_1_2,
  input [31:0] ch21_coeff_1_1,
  input [31:0] ch21_coeff_1_0,

  input [20:0] ch20_x_adc,//NLC output 
  output [20:0] ch20_x_lin,//ADC output 
  input [19:0] ch20_section_limit,//X-value that separates the sections 
  input [31:0] ch20_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch20_recip_stdev_3, 
  input [31:0] ch20_recip_stdev_2, 
  input [31:0] ch20_recip_stdev_1, 
  input [31:0] ch20_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch20_neg_mean_3, 
  input [31:0] ch20_neg_mean_2, 
  input [31:0] ch20_neg_mean_1,
  input [31:0] ch20_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch20_coeff_4_9,
  input [31:0] ch20_coeff_4_8,
  input [31:0] ch20_coeff_4_7,
  input [31:0] ch20_coeff_4_6,
  input [31:0] ch20_coeff_4_5,
  input [31:0] ch20_coeff_4_4,
  input [31:0] ch20_coeff_4_3,
  input [31:0] ch20_coeff_4_2,
  input [31:0] ch20_coeff_4_1,
  input [31:0] ch20_coeff_4_0,
  input [31:0] ch20_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch20_coeff_3_9,
  input [31:0] ch20_coeff_3_8,
  input [31:0] ch20_coeff_3_7,
  input [31:0] ch20_coeff_3_6,
  input [31:0] ch20_coeff_3_5,
  input [31:0] ch20_coeff_3_4,
  input [31:0] ch20_coeff_3_3,
  input [31:0] ch20_coeff_3_2,
  input [31:0] ch20_coeff_3_1,
  input [31:0] ch20_coeff_3_0,
  input [31:0] ch20_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch20_coeff_2_9,
  input [31:0] ch20_coeff_2_8,
  input [31:0] ch20_coeff_2_7,
  input [31:0] ch20_coeff_2_6,
  input [31:0] ch20_coeff_2_5,
  input [31:0] ch20_coeff_2_4,
  input [31:0] ch20_coeff_2_3,
  input [31:0] ch20_coeff_2_2,
  input [31:0] ch20_coeff_2_1,
  input [31:0] ch20_coeff_2_0,
  input [31:0] ch20_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch20_coeff_1_9,
  input [31:0] ch20_coeff_1_8,
  input [31:0] ch20_coeff_1_7,
  input [31:0] ch20_coeff_1_6,
  input [31:0] ch20_coeff_1_5,
  input [31:0] ch20_coeff_1_4,
  input [31:0] ch20_coeff_1_3,
  input [31:0] ch20_coeff_1_2,
  input [31:0] ch20_coeff_1_1,
  input [31:0] ch20_coeff_1_0, 

  input [20:0] ch19_x_adc,//NLC output 
  output [20:0] ch19_x_lin,//ADC output 
  input [19:0] ch19_section_limit,//X-value that separates the sections 
  input [31:0] ch19_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch19_recip_stdev_3, 
  input [31:0] ch19_recip_stdev_2, 
  input [31:0] ch19_recip_stdev_1, 
  input [31:0] ch19_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch19_neg_mean_3, 
  input [31:0] ch19_neg_mean_2, 
  input [31:0] ch19_neg_mean_1,
  input [31:0] ch19_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch19_coeff_4_9,
  input [31:0] ch19_coeff_4_8,
  input [31:0] ch19_coeff_4_7,
  input [31:0] ch19_coeff_4_6,
  input [31:0] ch19_coeff_4_5,
  input [31:0] ch19_coeff_4_4,
  input [31:0] ch19_coeff_4_3,
  input [31:0] ch19_coeff_4_2,
  input [31:0] ch19_coeff_4_1,
  input [31:0] ch19_coeff_4_0,
  input [31:0] ch19_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch19_coeff_3_9,
  input [31:0] ch19_coeff_3_8,
  input [31:0] ch19_coeff_3_7,
  input [31:0] ch19_coeff_3_6,
  input [31:0] ch19_coeff_3_5,
  input [31:0] ch19_coeff_3_4,
  input [31:0] ch19_coeff_3_3,
  input [31:0] ch19_coeff_3_2,
  input [31:0] ch19_coeff_3_1,
  input [31:0] ch19_coeff_3_0,
  input [31:0] ch19_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch19_coeff_2_9,
  input [31:0] ch19_coeff_2_8,
  input [31:0] ch19_coeff_2_7,
  input [31:0] ch19_coeff_2_6,
  input [31:0] ch19_coeff_2_5,
  input [31:0] ch19_coeff_2_4,
  input [31:0] ch19_coeff_2_3,
  input [31:0] ch19_coeff_2_2,
  input [31:0] ch19_coeff_2_1,
  input [31:0] ch19_coeff_2_0,
  input [31:0] ch19_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch19_coeff_1_9,
  input [31:0] ch19_coeff_1_8,
  input [31:0] ch19_coeff_1_7,
  input [31:0] ch19_coeff_1_6,
  input [31:0] ch19_coeff_1_5,
  input [31:0] ch19_coeff_1_4,
  input [31:0] ch19_coeff_1_3,
  input [31:0] ch19_coeff_1_2,
  input [31:0] ch19_coeff_1_1,
  input [31:0] ch19_coeff_1_0,

  input [20:0] ch18_x_adc,//NLC output 
  output [20:0] ch18_x_lin,//ADC output 
  input [19:0] ch18_section_limit,//X-value that separates the sections 
  input [31:0] ch18_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch18_recip_stdev_3, 
  input [31:0] ch18_recip_stdev_2, 
  input [31:0] ch18_recip_stdev_1, 
  input [31:0] ch18_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch18_neg_mean_3, 
  input [31:0] ch18_neg_mean_2, 
  input [31:0] ch18_neg_mean_1,
  input [31:0] ch18_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch18_coeff_4_9,
  input [31:0] ch18_coeff_4_8,
  input [31:0] ch18_coeff_4_7,
  input [31:0] ch18_coeff_4_6,
  input [31:0] ch18_coeff_4_5,
  input [31:0] ch18_coeff_4_4,
  input [31:0] ch18_coeff_4_3,
  input [31:0] ch18_coeff_4_2,
  input [31:0] ch18_coeff_4_1,
  input [31:0] ch18_coeff_4_0,
  input [31:0] ch18_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch18_coeff_3_9,
  input [31:0] ch18_coeff_3_8,
  input [31:0] ch18_coeff_3_7,
  input [31:0] ch18_coeff_3_6,
  input [31:0] ch18_coeff_3_5,
  input [31:0] ch18_coeff_3_4,
  input [31:0] ch18_coeff_3_3,
  input [31:0] ch18_coeff_3_2,
  input [31:0] ch18_coeff_3_1,
  input [31:0] ch18_coeff_3_0,
  input [31:0] ch18_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch18_coeff_2_9,
  input [31:0] ch18_coeff_2_8,
  input [31:0] ch18_coeff_2_7,
  input [31:0] ch18_coeff_2_6,
  input [31:0] ch18_coeff_2_5,
  input [31:0] ch18_coeff_2_4,
  input [31:0] ch18_coeff_2_3,
  input [31:0] ch18_coeff_2_2,
  input [31:0] ch18_coeff_2_1,
  input [31:0] ch18_coeff_2_0,
  input [31:0] ch18_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch18_coeff_1_9,
  input [31:0] ch18_coeff_1_8,
  input [31:0] ch18_coeff_1_7,
  input [31:0] ch18_coeff_1_6,
  input [31:0] ch18_coeff_1_5,
  input [31:0] ch18_coeff_1_4,
  input [31:0] ch18_coeff_1_3,
  input [31:0] ch18_coeff_1_2,
  input [31:0] ch18_coeff_1_1,
  input [31:0] ch18_coeff_1_0, 

  input [20:0] ch17_x_adc,//NLC output 
  output [20:0] ch17_x_lin,//ADC output 
  input [19:0] ch17_section_limit,//X-value that separates the sections 
  input [31:0] ch17_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch17_recip_stdev_3, 
  input [31:0] ch17_recip_stdev_2, 
  input [31:0] ch17_recip_stdev_1, 
  input [31:0] ch17_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch17_neg_mean_3, 
  input [31:0] ch17_neg_mean_2, 
  input [31:0] ch17_neg_mean_1,
  input [31:0] ch17_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch17_coeff_4_9,
  input [31:0] ch17_coeff_4_8,
  input [31:0] ch17_coeff_4_7,
  input [31:0] ch17_coeff_4_6,
  input [31:0] ch17_coeff_4_5,
  input [31:0] ch17_coeff_4_4,
  input [31:0] ch17_coeff_4_3,
  input [31:0] ch17_coeff_4_2,
  input [31:0] ch17_coeff_4_1,
  input [31:0] ch17_coeff_4_0,
  input [31:0] ch17_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch17_coeff_3_9,
  input [31:0] ch17_coeff_3_8,
  input [31:0] ch17_coeff_3_7,
  input [31:0] ch17_coeff_3_6,
  input [31:0] ch17_coeff_3_5,
  input [31:0] ch17_coeff_3_4,
  input [31:0] ch17_coeff_3_3,
  input [31:0] ch17_coeff_3_2,
  input [31:0] ch17_coeff_3_1,
  input [31:0] ch17_coeff_3_0,
  input [31:0] ch17_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch17_coeff_2_9,
  input [31:0] ch17_coeff_2_8,
  input [31:0] ch17_coeff_2_7,
  input [31:0] ch17_coeff_2_6,
  input [31:0] ch17_coeff_2_5,
  input [31:0] ch17_coeff_2_4,
  input [31:0] ch17_coeff_2_3,
  input [31:0] ch17_coeff_2_2,
  input [31:0] ch17_coeff_2_1,
  input [31:0] ch17_coeff_2_0,
  input [31:0] ch17_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch17_coeff_1_9,
  input [31:0] ch17_coeff_1_8,
  input [31:0] ch17_coeff_1_7,
  input [31:0] ch17_coeff_1_6,
  input [31:0] ch17_coeff_1_5,
  input [31:0] ch17_coeff_1_4,
  input [31:0] ch17_coeff_1_3,
  input [31:0] ch17_coeff_1_2,
  input [31:0] ch17_coeff_1_1,
  input [31:0] ch17_coeff_1_0, 

  input [20:0] ch16_x_adc,//NLC output 
  output [20:0] ch16_x_lin,//ADC output 
  input [19:0] ch16_section_limit,//X-value that separates the sections 
  input [31:0] ch16_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch16_recip_stdev_3, 
  input [31:0] ch16_recip_stdev_2, 
  input [31:0] ch16_recip_stdev_1, 
  input [31:0] ch16_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch16_neg_mean_3, 
  input [31:0] ch16_neg_mean_2, 
  input [31:0] ch16_neg_mean_1,
  input [31:0] ch16_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch16_coeff_4_9,
  input [31:0] ch16_coeff_4_8,
  input [31:0] ch16_coeff_4_7,
  input [31:0] ch16_coeff_4_6,
  input [31:0] ch16_coeff_4_5,
  input [31:0] ch16_coeff_4_4,
  input [31:0] ch16_coeff_4_3,
  input [31:0] ch16_coeff_4_2,
  input [31:0] ch16_coeff_4_1,
  input [31:0] ch16_coeff_4_0,
  input [31:0] ch16_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch16_coeff_3_9,
  input [31:0] ch16_coeff_3_8,
  input [31:0] ch16_coeff_3_7,
  input [31:0] ch16_coeff_3_6,
  input [31:0] ch16_coeff_3_5,
  input [31:0] ch16_coeff_3_4,
  input [31:0] ch16_coeff_3_3,
  input [31:0] ch16_coeff_3_2,
  input [31:0] ch16_coeff_3_1,
  input [31:0] ch16_coeff_3_0,
  input [31:0] ch16_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch16_coeff_2_9,
  input [31:0] ch16_coeff_2_8,
  input [31:0] ch16_coeff_2_7,
  input [31:0] ch16_coeff_2_6,
  input [31:0] ch16_coeff_2_5,
  input [31:0] ch16_coeff_2_4,
  input [31:0] ch16_coeff_2_3,
  input [31:0] ch16_coeff_2_2,
  input [31:0] ch16_coeff_2_1,
  input [31:0] ch16_coeff_2_0,
  input [31:0] ch16_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch16_coeff_1_9,
  input [31:0] ch16_coeff_1_8,
  input [31:0] ch16_coeff_1_7,
  input [31:0] ch16_coeff_1_6,
  input [31:0] ch16_coeff_1_5,
  input [31:0] ch16_coeff_1_4,
  input [31:0] ch16_coeff_1_3,
  input [31:0] ch16_coeff_1_2,
  input [31:0] ch16_coeff_1_1,
  input [31:0] ch16_coeff_1_0,

  input [20:0] ch15_x_adc,//NLC output 
  output [20:0] ch15_x_lin,//ADC output 
  input [19:0] ch15_section_limit,//X-value that separates the sections 
  input [31:0] ch15_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch15_recip_stdev_3, 
  input [31:0] ch15_recip_stdev_2, 
  input [31:0] ch15_recip_stdev_1, 
  input [31:0] ch15_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch15_neg_mean_3, 
  input [31:0] ch15_neg_mean_2, 
  input [31:0] ch15_neg_mean_1,
  input [31:0] ch15_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch15_coeff_4_9,
  input [31:0] ch15_coeff_4_8,
  input [31:0] ch15_coeff_4_7,
  input [31:0] ch15_coeff_4_6,
  input [31:0] ch15_coeff_4_5,
  input [31:0] ch15_coeff_4_4,
  input [31:0] ch15_coeff_4_3,
  input [31:0] ch15_coeff_4_2,
  input [31:0] ch15_coeff_4_1,
  input [31:0] ch15_coeff_4_0,
  input [31:0] ch15_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch15_coeff_3_9,
  input [31:0] ch15_coeff_3_8,
  input [31:0] ch15_coeff_3_7,
  input [31:0] ch15_coeff_3_6,
  input [31:0] ch15_coeff_3_5,
  input [31:0] ch15_coeff_3_4,
  input [31:0] ch15_coeff_3_3,
  input [31:0] ch15_coeff_3_2,
  input [31:0] ch15_coeff_3_1,
  input [31:0] ch15_coeff_3_0,
  input [31:0] ch15_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch15_coeff_2_9,
  input [31:0] ch15_coeff_2_8,
  input [31:0] ch15_coeff_2_7,
  input [31:0] ch15_coeff_2_6,
  input [31:0] ch15_coeff_2_5,
  input [31:0] ch15_coeff_2_4,
  input [31:0] ch15_coeff_2_3,
  input [31:0] ch15_coeff_2_2,
  input [31:0] ch15_coeff_2_1,
  input [31:0] ch15_coeff_2_0,
  input [31:0] ch15_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch15_coeff_1_9,
  input [31:0] ch15_coeff_1_8,
  input [31:0] ch15_coeff_1_7,
  input [31:0] ch15_coeff_1_6,
  input [31:0] ch15_coeff_1_5,
  input [31:0] ch15_coeff_1_4,
  input [31:0] ch15_coeff_1_3,
  input [31:0] ch15_coeff_1_2,
  input [31:0] ch15_coeff_1_1,
  input [31:0] ch15_coeff_1_0, 

  input [20:0] ch14_x_adc,//NLC output 
  output [20:0] ch14_x_lin,//ADC output 
  input [19:0] ch14_section_limit,//X-value that separates the sections 
  input [31:0] ch14_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch14_recip_stdev_3, 
  input [31:0] ch14_recip_stdev_2, 
  input [31:0] ch14_recip_stdev_1, 
  input [31:0] ch14_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch14_neg_mean_3, 
  input [31:0] ch14_neg_mean_2, 
  input [31:0] ch14_neg_mean_1,
  input [31:0] ch14_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch14_coeff_4_9,
  input [31:0] ch14_coeff_4_8,
  input [31:0] ch14_coeff_4_7,
  input [31:0] ch14_coeff_4_6,
  input [31:0] ch14_coeff_4_5,
  input [31:0] ch14_coeff_4_4,
  input [31:0] ch14_coeff_4_3,
  input [31:0] ch14_coeff_4_2,
  input [31:0] ch14_coeff_4_1,
  input [31:0] ch14_coeff_4_0,
  input [31:0] ch14_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch14_coeff_3_9,
  input [31:0] ch14_coeff_3_8,
  input [31:0] ch14_coeff_3_7,
  input [31:0] ch14_coeff_3_6,
  input [31:0] ch14_coeff_3_5,
  input [31:0] ch14_coeff_3_4,
  input [31:0] ch14_coeff_3_3,
  input [31:0] ch14_coeff_3_2,
  input [31:0] ch14_coeff_3_1,
  input [31:0] ch14_coeff_3_0,
  input [31:0] ch14_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch14_coeff_2_9,
  input [31:0] ch14_coeff_2_8,
  input [31:0] ch14_coeff_2_7,
  input [31:0] ch14_coeff_2_6,
  input [31:0] ch14_coeff_2_5,
  input [31:0] ch14_coeff_2_4,
  input [31:0] ch14_coeff_2_3,
  input [31:0] ch14_coeff_2_2,
  input [31:0] ch14_coeff_2_1,
  input [31:0] ch14_coeff_2_0,
  input [31:0] ch14_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch14_coeff_1_9,
  input [31:0] ch14_coeff_1_8,
  input [31:0] ch14_coeff_1_7,
  input [31:0] ch14_coeff_1_6,
  input [31:0] ch14_coeff_1_5,
  input [31:0] ch14_coeff_1_4,
  input [31:0] ch14_coeff_1_3,
  input [31:0] ch14_coeff_1_2,
  input [31:0] ch14_coeff_1_1,
  input [31:0] ch14_coeff_1_0,

  input [20:0] ch13_x_adc,//NLC output 
  output [20:0] ch13_x_lin,//ADC output 
  input [19:0] ch13_section_limit,//X-value that separates the sections 
  input [31:0] ch13_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch13_recip_stdev_3, 
  input [31:0] ch13_recip_stdev_2, 
  input [31:0] ch13_recip_stdev_1, 
  input [31:0] ch13_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch13_neg_mean_3, 
  input [31:0] ch13_neg_mean_2, 
  input [31:0] ch13_neg_mean_1,
  input [31:0] ch13_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch13_coeff_4_9,
  input [31:0] ch13_coeff_4_8,
  input [31:0] ch13_coeff_4_7,
  input [31:0] ch13_coeff_4_6,
  input [31:0] ch13_coeff_4_5,
  input [31:0] ch13_coeff_4_4,
  input [31:0] ch13_coeff_4_3,
  input [31:0] ch13_coeff_4_2,
  input [31:0] ch13_coeff_4_1,
  input [31:0] ch13_coeff_4_0,
  input [31:0] ch13_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch13_coeff_3_9,
  input [31:0] ch13_coeff_3_8,
  input [31:0] ch13_coeff_3_7,
  input [31:0] ch13_coeff_3_6,
  input [31:0] ch13_coeff_3_5,
  input [31:0] ch13_coeff_3_4,
  input [31:0] ch13_coeff_3_3,
  input [31:0] ch13_coeff_3_2,
  input [31:0] ch13_coeff_3_1,
  input [31:0] ch13_coeff_3_0,
  input [31:0] ch13_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch13_coeff_2_9,
  input [31:0] ch13_coeff_2_8,
  input [31:0] ch13_coeff_2_7,
  input [31:0] ch13_coeff_2_6,
  input [31:0] ch13_coeff_2_5,
  input [31:0] ch13_coeff_2_4,
  input [31:0] ch13_coeff_2_3,
  input [31:0] ch13_coeff_2_2,
  input [31:0] ch13_coeff_2_1,
  input [31:0] ch13_coeff_2_0,
  input [31:0] ch13_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch13_coeff_1_9,
  input [31:0] ch13_coeff_1_8,
  input [31:0] ch13_coeff_1_7,
  input [31:0] ch13_coeff_1_6,
  input [31:0] ch13_coeff_1_5,
  input [31:0] ch13_coeff_1_4,
  input [31:0] ch13_coeff_1_3,
  input [31:0] ch13_coeff_1_2,
  input [31:0] ch13_coeff_1_1,
  input [31:0] ch13_coeff_1_0,
  
  
  input [20:0] ch12_x_adc,//NLC output 
  output [20:0] ch12_x_lin,//ADC output 
  input [19:0] ch12_section_limit,//X-value that separates the sections 
  input [31:0] ch12_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch12_recip_stdev_3, 
  input [31:0] ch12_recip_stdev_2, 
  input [31:0] ch12_recip_stdev_1, 
  input [31:0] ch12_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch12_neg_mean_3, 
  input [31:0] ch12_neg_mean_2, 
  input [31:0] ch12_neg_mean_1,
  input [31:0] ch12_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch12_coeff_4_9,
  input [31:0] ch12_coeff_4_8,
  input [31:0] ch12_coeff_4_7,
  input [31:0] ch12_coeff_4_6,
  input [31:0] ch12_coeff_4_5,
  input [31:0] ch12_coeff_4_4,
  input [31:0] ch12_coeff_4_3,
  input [31:0] ch12_coeff_4_2,
  input [31:0] ch12_coeff_4_1,
  input [31:0] ch12_coeff_4_0,
  input [31:0] ch12_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch12_coeff_3_9,
  input [31:0] ch12_coeff_3_8,
  input [31:0] ch12_coeff_3_7,
  input [31:0] ch12_coeff_3_6,
  input [31:0] ch12_coeff_3_5,
  input [31:0] ch12_coeff_3_4,
  input [31:0] ch12_coeff_3_3,
  input [31:0] ch12_coeff_3_2,
  input [31:0] ch12_coeff_3_1,
  input [31:0] ch12_coeff_3_0,
  input [31:0] ch12_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch12_coeff_2_9,
  input [31:0] ch12_coeff_2_8,
  input [31:0] ch12_coeff_2_7,
  input [31:0] ch12_coeff_2_6,
  input [31:0] ch12_coeff_2_5,
  input [31:0] ch12_coeff_2_4,
  input [31:0] ch12_coeff_2_3,
  input [31:0] ch12_coeff_2_2,
  input [31:0] ch12_coeff_2_1,
  input [31:0] ch12_coeff_2_0,
  input [31:0] ch12_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch12_coeff_1_9,
  input [31:0] ch12_coeff_1_8,
  input [31:0] ch12_coeff_1_7,
  input [31:0] ch12_coeff_1_6,
  input [31:0] ch12_coeff_1_5,
  input [31:0] ch12_coeff_1_4,
  input [31:0] ch12_coeff_1_3,
  input [31:0] ch12_coeff_1_2,
  input [31:0] ch12_coeff_1_1,
  input [31:0] ch12_coeff_1_0,

  input [20:0] ch11_x_adc,//NLC output 
  output [20:0] ch11_x_lin,//ADC output 
  input [19:0] ch11_section_limit,//X-value that separates the sections 
  input [31:0] ch11_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch11_recip_stdev_3, 
  input [31:0] ch11_recip_stdev_2, 
  input [31:0] ch11_recip_stdev_1, 
  input [31:0] ch11_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch11_neg_mean_3, 
  input [31:0] ch11_neg_mean_2, 
  input [31:0] ch11_neg_mean_1,
  input [31:0] ch11_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch11_coeff_4_9,
  input [31:0] ch11_coeff_4_8,
  input [31:0] ch11_coeff_4_7,
  input [31:0] ch11_coeff_4_6,
  input [31:0] ch11_coeff_4_5,
  input [31:0] ch11_coeff_4_4,
  input [31:0] ch11_coeff_4_3,
  input [31:0] ch11_coeff_4_2,
  input [31:0] ch11_coeff_4_1,
  input [31:0] ch11_coeff_4_0,
  input [31:0] ch11_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch11_coeff_3_9,
  input [31:0] ch11_coeff_3_8,
  input [31:0] ch11_coeff_3_7,
  input [31:0] ch11_coeff_3_6,
  input [31:0] ch11_coeff_3_5,
  input [31:0] ch11_coeff_3_4,
  input [31:0] ch11_coeff_3_3,
  input [31:0] ch11_coeff_3_2,
  input [31:0] ch11_coeff_3_1,
  input [31:0] ch11_coeff_3_0,
  input [31:0] ch11_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch11_coeff_2_9,
  input [31:0] ch11_coeff_2_8,
  input [31:0] ch11_coeff_2_7,
  input [31:0] ch11_coeff_2_6,
  input [31:0] ch11_coeff_2_5,
  input [31:0] ch11_coeff_2_4,
  input [31:0] ch11_coeff_2_3,
  input [31:0] ch11_coeff_2_2,
  input [31:0] ch11_coeff_2_1,
  input [31:0] ch11_coeff_2_0,
  input [31:0] ch11_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch11_coeff_1_9,
  input [31:0] ch11_coeff_1_8,
  input [31:0] ch11_coeff_1_7,
  input [31:0] ch11_coeff_1_6,
  input [31:0] ch11_coeff_1_5,
  input [31:0] ch11_coeff_1_4,
  input [31:0] ch11_coeff_1_3,
  input [31:0] ch11_coeff_1_2,
  input [31:0] ch11_coeff_1_1,
  input [31:0] ch11_coeff_1_0, 

  input [20:0] ch10_x_adc,//NLC output 
  output [20:0] ch10_x_lin,//ADC output 
  input [19:0] ch10_section_limit,//X-value that separates the sections 
  input [31:0] ch10_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch10_recip_stdev_3, 
  input [31:0] ch10_recip_stdev_2, 
  input [31:0] ch10_recip_stdev_1, 
  input [31:0] ch10_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch10_neg_mean_3, 
  input [31:0] ch10_neg_mean_2, 
  input [31:0] ch10_neg_mean_1,
  input [31:0] ch10_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch10_coeff_4_9,
  input [31:0] ch10_coeff_4_8,
  input [31:0] ch10_coeff_4_7,
  input [31:0] ch10_coeff_4_6,
  input [31:0] ch10_coeff_4_5,
  input [31:0] ch10_coeff_4_4,
  input [31:0] ch10_coeff_4_3,
  input [31:0] ch10_coeff_4_2,
  input [31:0] ch10_coeff_4_1,
  input [31:0] ch10_coeff_4_0,
  input [31:0] ch10_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch10_coeff_3_9,
  input [31:0] ch10_coeff_3_8,
  input [31:0] ch10_coeff_3_7,
  input [31:0] ch10_coeff_3_6,
  input [31:0] ch10_coeff_3_5,
  input [31:0] ch10_coeff_3_4,
  input [31:0] ch10_coeff_3_3,
  input [31:0] ch10_coeff_3_2,
  input [31:0] ch10_coeff_3_1,
  input [31:0] ch10_coeff_3_0,
  input [31:0] ch10_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch10_coeff_2_9,
  input [31:0] ch10_coeff_2_8,
  input [31:0] ch10_coeff_2_7,
  input [31:0] ch10_coeff_2_6,
  input [31:0] ch10_coeff_2_5,
  input [31:0] ch10_coeff_2_4,
  input [31:0] ch10_coeff_2_3,
  input [31:0] ch10_coeff_2_2,
  input [31:0] ch10_coeff_2_1,
  input [31:0] ch10_coeff_2_0,
  input [31:0] ch10_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch10_coeff_1_9,
  input [31:0] ch10_coeff_1_8,
  input [31:0] ch10_coeff_1_7,
  input [31:0] ch10_coeff_1_6,
  input [31:0] ch10_coeff_1_5,
  input [31:0] ch10_coeff_1_4,
  input [31:0] ch10_coeff_1_3,
  input [31:0] ch10_coeff_1_2,
  input [31:0] ch10_coeff_1_1,
  input [31:0] ch10_coeff_1_0, 

  input [20:0] ch9_x_adc,//NLC output 
  output [20:0] ch9_x_lin,//ADC output 
  input [19:0] ch9_section_limit,//X-value that separates the sections 
  input [31:0] ch9_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch9_recip_stdev_3, 
  input [31:0] ch9_recip_stdev_2, 
  input [31:0] ch9_recip_stdev_1, 
  input [31:0] ch9_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch9_neg_mean_3, 
  input [31:0] ch9_neg_mean_2, 
  input [31:0] ch9_neg_mean_1,
  input [31:0] ch9_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch9_coeff_4_9,
  input [31:0] ch9_coeff_4_8,
  input [31:0] ch9_coeff_4_7,
  input [31:0] ch9_coeff_4_6,
  input [31:0] ch9_coeff_4_5,
  input [31:0] ch9_coeff_4_4,
  input [31:0] ch9_coeff_4_3,
  input [31:0] ch9_coeff_4_2,
  input [31:0] ch9_coeff_4_1,
  input [31:0] ch9_coeff_4_0,
  input [31:0] ch9_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch9_coeff_3_9,
  input [31:0] ch9_coeff_3_8,
  input [31:0] ch9_coeff_3_7,
  input [31:0] ch9_coeff_3_6,
  input [31:0] ch9_coeff_3_5,
  input [31:0] ch9_coeff_3_4,
  input [31:0] ch9_coeff_3_3,
  input [31:0] ch9_coeff_3_2,
  input [31:0] ch9_coeff_3_1,
  input [31:0] ch9_coeff_3_0,
  input [31:0] ch9_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch9_coeff_2_9,
  input [31:0] ch9_coeff_2_8,
  input [31:0] ch9_coeff_2_7,
  input [31:0] ch9_coeff_2_6,
  input [31:0] ch9_coeff_2_5,
  input [31:0] ch9_coeff_2_4,
  input [31:0] ch9_coeff_2_3,
  input [31:0] ch9_coeff_2_2,
  input [31:0] ch9_coeff_2_1,
  input [31:0] ch9_coeff_2_0,
  input [31:0] ch9_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch9_coeff_1_9,
  input [31:0] ch9_coeff_1_8,
  input [31:0] ch9_coeff_1_7,
  input [31:0] ch9_coeff_1_6,
  input [31:0] ch9_coeff_1_5,
  input [31:0] ch9_coeff_1_4,
  input [31:0] ch9_coeff_1_3,
  input [31:0] ch9_coeff_1_2,
  input [31:0] ch9_coeff_1_1,
  input [31:0] ch9_coeff_1_0,

  input [20:0] ch8_x_adc,//NLC output 
  output [20:0] ch8_x_lin,//ADC output 
  input [19:0] ch8_section_limit,//X-value that separates the sections 
  input [31:0] ch8_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch8_recip_stdev_3, 
  input [31:0] ch8_recip_stdev_2, 
  input [31:0] ch8_recip_stdev_1, 
  input [31:0] ch8_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch8_neg_mean_3, 
  input [31:0] ch8_neg_mean_2, 
  input [31:0] ch8_neg_mean_1,
  input [31:0] ch8_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch8_coeff_4_9,
  input [31:0] ch8_coeff_4_8,
  input [31:0] ch8_coeff_4_7,
  input [31:0] ch8_coeff_4_6,
  input [31:0] ch8_coeff_4_5,
  input [31:0] ch8_coeff_4_4,
  input [31:0] ch8_coeff_4_3,
  input [31:0] ch8_coeff_4_2,
  input [31:0] ch8_coeff_4_1,
  input [31:0] ch8_coeff_4_0,
  input [31:0] ch8_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch8_coeff_3_9,
  input [31:0] ch8_coeff_3_8,
  input [31:0] ch8_coeff_3_7,
  input [31:0] ch8_coeff_3_6,
  input [31:0] ch8_coeff_3_5,
  input [31:0] ch8_coeff_3_4,
  input [31:0] ch8_coeff_3_3,
  input [31:0] ch8_coeff_3_2,
  input [31:0] ch8_coeff_3_1,
  input [31:0] ch8_coeff_3_0,
  input [31:0] ch8_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch8_coeff_2_9,
  input [31:0] ch8_coeff_2_8,
  input [31:0] ch8_coeff_2_7,
  input [31:0] ch8_coeff_2_6,
  input [31:0] ch8_coeff_2_5,
  input [31:0] ch8_coeff_2_4,
  input [31:0] ch8_coeff_2_3,
  input [31:0] ch8_coeff_2_2,
  input [31:0] ch8_coeff_2_1,
  input [31:0] ch8_coeff_2_0,
  input [31:0] ch8_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch8_coeff_1_9,
  input [31:0] ch8_coeff_1_8,
  input [31:0] ch8_coeff_1_7,
  input [31:0] ch8_coeff_1_6,
  input [31:0] ch8_coeff_1_5,
  input [31:0] ch8_coeff_1_4,
  input [31:0] ch8_coeff_1_3,
  input [31:0] ch8_coeff_1_2,
  input [31:0] ch8_coeff_1_1,
  input [31:0] ch8_coeff_1_0,

  input [20:0] ch7_x_adc,//NLC output 
  output [20:0] ch7_x_lin,//ADC output 
  input [19:0] ch7_section_limit,//X-value that separates the sections 
  input [31:0] ch7_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch7_recip_stdev_3, 
  input [31:0] ch7_recip_stdev_2, 
  input [31:0] ch7_recip_stdev_1, 
  input [31:0] ch7_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch7_neg_mean_3, 
  input [31:0] ch7_neg_mean_2, 
  input [31:0] ch7_neg_mean_1,
  input [31:0] ch7_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch7_coeff_4_9,
  input [31:0] ch7_coeff_4_8,
  input [31:0] ch7_coeff_4_7,
  input [31:0] ch7_coeff_4_6,
  input [31:0] ch7_coeff_4_5,
  input [31:0] ch7_coeff_4_4,
  input [31:0] ch7_coeff_4_3,
  input [31:0] ch7_coeff_4_2,
  input [31:0] ch7_coeff_4_1,
  input [31:0] ch7_coeff_4_0,
  input [31:0] ch7_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch7_coeff_3_9,
  input [31:0] ch7_coeff_3_8,
  input [31:0] ch7_coeff_3_7,
  input [31:0] ch7_coeff_3_6,
  input [31:0] ch7_coeff_3_5,
  input [31:0] ch7_coeff_3_4,
  input [31:0] ch7_coeff_3_3,
  input [31:0] ch7_coeff_3_2,
  input [31:0] ch7_coeff_3_1,
  input [31:0] ch7_coeff_3_0,
  input [31:0] ch7_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch7_coeff_2_9,
  input [31:0] ch7_coeff_2_8,
  input [31:0] ch7_coeff_2_7,
  input [31:0] ch7_coeff_2_6,
  input [31:0] ch7_coeff_2_5,
  input [31:0] ch7_coeff_2_4,
  input [31:0] ch7_coeff_2_3,
  input [31:0] ch7_coeff_2_2,
  input [31:0] ch7_coeff_2_1,
  input [31:0] ch7_coeff_2_0,
  input [31:0] ch7_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch7_coeff_1_9,
  input [31:0] ch7_coeff_1_8,
  input [31:0] ch7_coeff_1_7,
  input [31:0] ch7_coeff_1_6,
  input [31:0] ch7_coeff_1_5,
  input [31:0] ch7_coeff_1_4,
  input [31:0] ch7_coeff_1_3,
  input [31:0] ch7_coeff_1_2,
  input [31:0] ch7_coeff_1_1,
  input [31:0] ch7_coeff_1_0, 

  input [20:0] ch6_x_adc,//NLC output 
  output [20:0] ch6_x_lin,//ADC output 
  input [19:0] ch6_section_limit,//X-value that separates the sections 
  input [31:0] ch6_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch6_recip_stdev_3, 
  input [31:0] ch6_recip_stdev_2, 
  input [31:0] ch6_recip_stdev_1, 
  input [31:0] ch6_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch6_neg_mean_3, 
  input [31:0] ch6_neg_mean_2, 
  input [31:0] ch6_neg_mean_1,
  input [31:0] ch6_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch6_coeff_4_9,
  input [31:0] ch6_coeff_4_8,
  input [31:0] ch6_coeff_4_7,
  input [31:0] ch6_coeff_4_6,
  input [31:0] ch6_coeff_4_5,
  input [31:0] ch6_coeff_4_4,
  input [31:0] ch6_coeff_4_3,
  input [31:0] ch6_coeff_4_2,
  input [31:0] ch6_coeff_4_1,
  input [31:0] ch6_coeff_4_0,
  input [31:0] ch6_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch6_coeff_3_9,
  input [31:0] ch6_coeff_3_8,
  input [31:0] ch6_coeff_3_7,
  input [31:0] ch6_coeff_3_6,
  input [31:0] ch6_coeff_3_5,
  input [31:0] ch6_coeff_3_4,
  input [31:0] ch6_coeff_3_3,
  input [31:0] ch6_coeff_3_2,
  input [31:0] ch6_coeff_3_1,
  input [31:0] ch6_coeff_3_0,
  input [31:0] ch6_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch6_coeff_2_9,
  input [31:0] ch6_coeff_2_8,
  input [31:0] ch6_coeff_2_7,
  input [31:0] ch6_coeff_2_6,
  input [31:0] ch6_coeff_2_5,
  input [31:0] ch6_coeff_2_4,
  input [31:0] ch6_coeff_2_3,
  input [31:0] ch6_coeff_2_2,
  input [31:0] ch6_coeff_2_1,
  input [31:0] ch6_coeff_2_0,
  input [31:0] ch6_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch6_coeff_1_9,
  input [31:0] ch6_coeff_1_8,
  input [31:0] ch6_coeff_1_7,
  input [31:0] ch6_coeff_1_6,
  input [31:0] ch6_coeff_1_5,
  input [31:0] ch6_coeff_1_4,
  input [31:0] ch6_coeff_1_3,
  input [31:0] ch6_coeff_1_2,
  input [31:0] ch6_coeff_1_1,
  input [31:0] ch6_coeff_1_0,

  input [20:0] ch5_x_adc,//NLC output 
  output [20:0] ch5_x_lin,//ADC output 
  input [19:0] ch5_section_limit,//X-value that separates the sections 
  input [31:0] ch5_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch5_recip_stdev_3, 
  input [31:0] ch5_recip_stdev_2, 
  input [31:0] ch5_recip_stdev_1, 
  input [31:0] ch5_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch5_neg_mean_3, 
  input [31:0] ch5_neg_mean_2, 
  input [31:0] ch5_neg_mean_1,
  input [31:0] ch5_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch5_coeff_4_9,
  input [31:0] ch5_coeff_4_8,
  input [31:0] ch5_coeff_4_7,
  input [31:0] ch5_coeff_4_6,
  input [31:0] ch5_coeff_4_5,
  input [31:0] ch5_coeff_4_4,
  input [31:0] ch5_coeff_4_3,
  input [31:0] ch5_coeff_4_2,
  input [31:0] ch5_coeff_4_1,
  input [31:0] ch5_coeff_4_0,
  input [31:0] ch5_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch5_coeff_3_9,
  input [31:0] ch5_coeff_3_8,
  input [31:0] ch5_coeff_3_7,
  input [31:0] ch5_coeff_3_6,
  input [31:0] ch5_coeff_3_5,
  input [31:0] ch5_coeff_3_4,
  input [31:0] ch5_coeff_3_3,
  input [31:0] ch5_coeff_3_2,
  input [31:0] ch5_coeff_3_1,
  input [31:0] ch5_coeff_3_0,
  input [31:0] ch5_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch5_coeff_2_9,
  input [31:0] ch5_coeff_2_8,
  input [31:0] ch5_coeff_2_7,
  input [31:0] ch5_coeff_2_6,
  input [31:0] ch5_coeff_2_5,
  input [31:0] ch5_coeff_2_4,
  input [31:0] ch5_coeff_2_3,
  input [31:0] ch5_coeff_2_2,
  input [31:0] ch5_coeff_2_1,
  input [31:0] ch5_coeff_2_0,
  input [31:0] ch5_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch5_coeff_1_9,
  input [31:0] ch5_coeff_1_8,
  input [31:0] ch5_coeff_1_7,
  input [31:0] ch5_coeff_1_6,
  input [31:0] ch5_coeff_1_5,
  input [31:0] ch5_coeff_1_4,
  input [31:0] ch5_coeff_1_3,
  input [31:0] ch5_coeff_1_2,
  input [31:0] ch5_coeff_1_1,
  input [31:0] ch5_coeff_1_0,
  
  input [20:0] ch4_x_adc,//NLC output 
  output [20:0] ch4_x_lin,//ADC output 
  input [19:0] ch4_section_limit,//X-value that separates the sections 
  input [31:0] ch4_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch4_recip_stdev_3, 
  input [31:0] ch4_recip_stdev_2, 
  input [31:0] ch4_recip_stdev_1, 
  input [31:0] ch4_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch4_neg_mean_3, 
  input [31:0] ch4_neg_mean_2, 
  input [31:0] ch4_neg_mean_1,
  input [31:0] ch4_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch4_coeff_4_9,
  input [31:0] ch4_coeff_4_8,
  input [31:0] ch4_coeff_4_7,
  input [31:0] ch4_coeff_4_6,
  input [31:0] ch4_coeff_4_5,
  input [31:0] ch4_coeff_4_4,
  input [31:0] ch4_coeff_4_3,
  input [31:0] ch4_coeff_4_2,
  input [31:0] ch4_coeff_4_1,
  input [31:0] ch4_coeff_4_0,
  input [31:0] ch4_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch4_coeff_3_9,
  input [31:0] ch4_coeff_3_8,
  input [31:0] ch4_coeff_3_7,
  input [31:0] ch4_coeff_3_6,
  input [31:0] ch4_coeff_3_5,
  input [31:0] ch4_coeff_3_4,
  input [31:0] ch4_coeff_3_3,
  input [31:0] ch4_coeff_3_2,
  input [31:0] ch4_coeff_3_1,
  input [31:0] ch4_coeff_3_0,
  input [31:0] ch4_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch4_coeff_2_9,
  input [31:0] ch4_coeff_2_8,
  input [31:0] ch4_coeff_2_7,
  input [31:0] ch4_coeff_2_6,
  input [31:0] ch4_coeff_2_5,
  input [31:0] ch4_coeff_2_4,
  input [31:0] ch4_coeff_2_3,
  input [31:0] ch4_coeff_2_2,
  input [31:0] ch4_coeff_2_1,
  input [31:0] ch4_coeff_2_0,
  input [31:0] ch4_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch4_coeff_1_9,
  input [31:0] ch4_coeff_1_8,
  input [31:0] ch4_coeff_1_7,
  input [31:0] ch4_coeff_1_6,
  input [31:0] ch4_coeff_1_5,
  input [31:0] ch4_coeff_1_4,
  input [31:0] ch4_coeff_1_3,
  input [31:0] ch4_coeff_1_2,
  input [31:0] ch4_coeff_1_1,
  input [31:0] ch4_coeff_1_0,

  input [20:0] ch3_x_adc,//NLC output 
  output [20:0] ch3_x_lin,//ADC output 
  input [19:0] ch3_section_limit,//X-value that separates the sections 
  input [31:0] ch3_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch3_recip_stdev_3, 
  input [31:0] ch3_recip_stdev_2, 
  input [31:0] ch3_recip_stdev_1, 
  input [31:0] ch3_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch3_neg_mean_3, 
  input [31:0] ch3_neg_mean_2, 
  input [31:0] ch3_neg_mean_1,
  input [31:0] ch3_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch3_coeff_4_9,
  input [31:0] ch3_coeff_4_8,
  input [31:0] ch3_coeff_4_7,
  input [31:0] ch3_coeff_4_6,
  input [31:0] ch3_coeff_4_5,
  input [31:0] ch3_coeff_4_4,
  input [31:0] ch3_coeff_4_3,
  input [31:0] ch3_coeff_4_2,
  input [31:0] ch3_coeff_4_1,
  input [31:0] ch3_coeff_4_0,
  input [31:0] ch3_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch3_coeff_3_9,
  input [31:0] ch3_coeff_3_8,
  input [31:0] ch3_coeff_3_7,
  input [31:0] ch3_coeff_3_6,
  input [31:0] ch3_coeff_3_5,
  input [31:0] ch3_coeff_3_4,
  input [31:0] ch3_coeff_3_3,
  input [31:0] ch3_coeff_3_2,
  input [31:0] ch3_coeff_3_1,
  input [31:0] ch3_coeff_3_0,
  input [31:0] ch3_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch3_coeff_2_9,
  input [31:0] ch3_coeff_2_8,
  input [31:0] ch3_coeff_2_7,
  input [31:0] ch3_coeff_2_6,
  input [31:0] ch3_coeff_2_5,
  input [31:0] ch3_coeff_2_4,
  input [31:0] ch3_coeff_2_3,
  input [31:0] ch3_coeff_2_2,
  input [31:0] ch3_coeff_2_1,
  input [31:0] ch3_coeff_2_0,
  input [31:0] ch3_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch3_coeff_1_9,
  input [31:0] ch3_coeff_1_8,
  input [31:0] ch3_coeff_1_7,
  input [31:0] ch3_coeff_1_6,
  input [31:0] ch3_coeff_1_5,
  input [31:0] ch3_coeff_1_4,
  input [31:0] ch3_coeff_1_3,
  input [31:0] ch3_coeff_1_2,
  input [31:0] ch3_coeff_1_1,
  input [31:0] ch3_coeff_1_0,
  

  input [20:0] ch2_x_adc,//NLC output 
  output [20:0] ch2_x_lin,//ADC output 
  input [19:0] ch2_section_limit,//X-value that separates the sections 
  input [31:0] ch2_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch2_recip_stdev_3, 
  input [31:0] ch2_recip_stdev_2, 
  input [31:0] ch2_recip_stdev_1, 
  input [31:0] ch2_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch2_neg_mean_3, 
  input [31:0] ch2_neg_mean_2, 
  input [31:0] ch2_neg_mean_1,
  input [31:0] ch2_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch2_coeff_4_9,
  input [31:0] ch2_coeff_4_8,
  input [31:0] ch2_coeff_4_7,
  input [31:0] ch2_coeff_4_6,
  input [31:0] ch2_coeff_4_5,
  input [31:0] ch2_coeff_4_4,
  input [31:0] ch2_coeff_4_3,
  input [31:0] ch2_coeff_4_2,
  input [31:0] ch2_coeff_4_1,
  input [31:0] ch2_coeff_4_0,
  input [31:0] ch2_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch2_coeff_3_9,
  input [31:0] ch2_coeff_3_8,
  input [31:0] ch2_coeff_3_7,
  input [31:0] ch2_coeff_3_6,
  input [31:0] ch2_coeff_3_5,
  input [31:0] ch2_coeff_3_4,
  input [31:0] ch2_coeff_3_3,
  input [31:0] ch2_coeff_3_2,
  input [31:0] ch2_coeff_3_1,
  input [31:0] ch2_coeff_3_0,
  input [31:0] ch2_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch2_coeff_2_9,
  input [31:0] ch2_coeff_2_8,
  input [31:0] ch2_coeff_2_7,
  input [31:0] ch2_coeff_2_6,
  input [31:0] ch2_coeff_2_5,
  input [31:0] ch2_coeff_2_4,
  input [31:0] ch2_coeff_2_3,
  input [31:0] ch2_coeff_2_2,
  input [31:0] ch2_coeff_2_1,
  input [31:0] ch2_coeff_2_0,
  input [31:0] ch2_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch2_coeff_1_9,
  input [31:0] ch2_coeff_1_8,
  input [31:0] ch2_coeff_1_7,
  input [31:0] ch2_coeff_1_6,
  input [31:0] ch2_coeff_1_5,
  input [31:0] ch2_coeff_1_4,
  input [31:0] ch2_coeff_1_3,
  input [31:0] ch2_coeff_1_2,
  input [31:0] ch2_coeff_1_1,
  input [31:0] ch2_coeff_1_0, 

  input [20:0] ch1_x_adc,//NLC output 
  output [20:0] ch1_x_lin,//ADC output 
  input [19:0] ch1_section_limit,//X-value that separates the sections 
  input [31:0] ch1_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch1_recip_stdev_3, 
  input [31:0] ch1_recip_stdev_2, 
  input [31:0] ch1_recip_stdev_1, 
  input [31:0] ch1_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch1_neg_mean_3, 
  input [31:0] ch1_neg_mean_2, 
  input [31:0] ch1_neg_mean_1,
  input [31:0] ch1_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch1_coeff_4_9,
  input [31:0] ch1_coeff_4_8,
  input [31:0] ch1_coeff_4_7,
  input [31:0] ch1_coeff_4_6,
  input [31:0] ch1_coeff_4_5,
  input [31:0] ch1_coeff_4_4,
  input [31:0] ch1_coeff_4_3,
  input [31:0] ch1_coeff_4_2,
  input [31:0] ch1_coeff_4_1,
  input [31:0] ch1_coeff_4_0,
  input [31:0] ch1_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch1_coeff_3_9,
  input [31:0] ch1_coeff_3_8,
  input [31:0] ch1_coeff_3_7,
  input [31:0] ch1_coeff_3_6,
  input [31:0] ch1_coeff_3_5,
  input [31:0] ch1_coeff_3_4,
  input [31:0] ch1_coeff_3_3,
  input [31:0] ch1_coeff_3_2,
  input [31:0] ch1_coeff_3_1,
  input [31:0] ch1_coeff_3_0,
  input [31:0] ch1_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch1_coeff_2_9,
  input [31:0] ch1_coeff_2_8,
  input [31:0] ch1_coeff_2_7,
  input [31:0] ch1_coeff_2_6,
  input [31:0] ch1_coeff_2_5,
  input [31:0] ch1_coeff_2_4,
  input [31:0] ch1_coeff_2_3,
  input [31:0] ch1_coeff_2_2,
  input [31:0] ch1_coeff_2_1,
  input [31:0] ch1_coeff_2_0,
  input [31:0] ch1_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch1_coeff_1_9,
  input [31:0] ch1_coeff_1_8,
  input [31:0] ch1_coeff_1_7,
  input [31:0] ch1_coeff_1_6,
  input [31:0] ch1_coeff_1_5,
  input [31:0] ch1_coeff_1_4,
  input [31:0] ch1_coeff_1_3,
  input [31:0] ch1_coeff_1_2,
  input [31:0] ch1_coeff_1_1,
  input [31:0] ch1_coeff_1_0,

  input [20:0] ch0_x_adc,//NLC output 
  output [20:0] ch0_x_lin,//ADC output 
  input [19:0] ch0_section_limit,//X-value that separates the sections 
  input [31:0] ch0_recip_stdev_4,//Reciprocal standard deviation for the centered and scaled fit  
  input [31:0] ch0_recip_stdev_3, 
  input [31:0] ch0_recip_stdev_2, 
  input [31:0] ch0_recip_stdev_1, 
  input [31:0] ch0_neg_mean_4,//Negative meand for the centered and scaled fit  
  input [31:0] ch0_neg_mean_3, 
  input [31:0] ch0_neg_mean_2, 
  input [31:0] ch0_neg_mean_1,
  input [31:0] ch0_coeff_4_10, //Section 4 coefficients (x > 0, |x| > section_limit) 
  input [31:0] ch0_coeff_4_9,
  input [31:0] ch0_coeff_4_8,
  input [31:0] ch0_coeff_4_7,
  input [31:0] ch0_coeff_4_6,
  input [31:0] ch0_coeff_4_5,
  input [31:0] ch0_coeff_4_4,
  input [31:0] ch0_coeff_4_3,
  input [31:0] ch0_coeff_4_2,
  input [31:0] ch0_coeff_4_1,
  input [31:0] ch0_coeff_4_0,
  input [31:0] ch0_coeff_3_10,//Section 3 coefficients (x > 0, |x| <= section_limit)  
  input [31:0] ch0_coeff_3_9,
  input [31:0] ch0_coeff_3_8,
  input [31:0] ch0_coeff_3_7,
  input [31:0] ch0_coeff_3_6,
  input [31:0] ch0_coeff_3_5,
  input [31:0] ch0_coeff_3_4,
  input [31:0] ch0_coeff_3_3,
  input [31:0] ch0_coeff_3_2,
  input [31:0] ch0_coeff_3_1,
  input [31:0] ch0_coeff_3_0,
  input [31:0] ch0_coeff_2_10,//Section 2 coefficients (x <= 0, |x| <= section_limit)  
  input [31:0] ch0_coeff_2_9,
  input [31:0] ch0_coeff_2_8,
  input [31:0] ch0_coeff_2_7,
  input [31:0] ch0_coeff_2_6,
  input [31:0] ch0_coeff_2_5,
  input [31:0] ch0_coeff_2_4,
  input [31:0] ch0_coeff_2_3,
  input [31:0] ch0_coeff_2_2,
  input [31:0] ch0_coeff_2_1,
  input [31:0] ch0_coeff_2_0,
  input [31:0] ch0_coeff_1_10,//Section 1 coefficients (x <= 0, |x| > section_limit)  
  input [31:0] ch0_coeff_1_9,
  input [31:0] ch0_coeff_1_8,
  input [31:0] ch0_coeff_1_7,
  input [31:0] ch0_coeff_1_6,
  input [31:0] ch0_coeff_1_5,
  input [31:0] ch0_coeff_1_4,
  input [31:0] ch0_coeff_1_3,
  input [31:0] ch0_coeff_1_2,
  input [31:0] ch0_coeff_1_1,
  input [31:0] ch0_coeff_1_0 

    );
  
wire ch0_srdyo;
wire ch1_srdyo;
wire ch2_srdyo;
wire ch3_srdyo;
wire ch4_srdyo;
wire ch5_srdyo;
wire ch6_srdyo;
wire ch7_srdyo;
wire ch8_srdyo;
wire ch9_srdyo;
wire ch10_srdyo;
wire ch11_srdyo;
wire ch12_srdyo;
wire ch13_srdyo;
wire ch14_srdyo;
wire ch15_srdyo;
wire ch16_srdyo;
wire ch17_srdyo;
wire ch18_srdyo;
wire ch19_srdyo;
wire ch20_srdyo;
wire ch21_srdyo;
wire ch22_srdyo;
wire ch23_srdyo;
wire ch24_srdyo;
wire ch25_srdyo;
wire ch26_srdyo;
wire ch27_srdyo;
wire ch28_srdyo;
wire ch29_srdyo;
wire ch30_srdyo;
wire ch31_srdyo;

assign srdyo = ch0_srdyo & ch1_srdyo & ch2_srdyo & ch3_srdyo & ch4_srdyo & ch5_srdyo & ch6_srdyo & ch7_srdyo & ch8_srdyo & ch9_srdyo & ch10_srdyo & ch11_srdyo & ch12_srdyo & ch13_srdyo & ch14_srdyo & ch15_srdyo & ch16_srdyo & ch17_srdyo & ch18_srdyo & ch19_srdyo & ch20_srdyo & ch21_srdyo & ch22_srdyo & ch23_srdyo & ch24_srdyo & ch25_srdyo & ch26_srdyo & ch27_srdyo & ch28_srdyo & ch29_srdyo & ch30_srdyo & ch31_srdyo;


adc_correction_engine ch31_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch31_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch31_x_lin),
	 // ADC output srdyo
	 .srdyo(ch31_srdyo),
    // section limit
	 .section_limit(ch31_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch31_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch31_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch31_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch31_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch31_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch31_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch31_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch31_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch31_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch31_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch31_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch31_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch31_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch31_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch31_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch31_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch31_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch31_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch31_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch31_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch31_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch31_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch31_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch31_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch31_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch31_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch31_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch31_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch31_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch31_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch31_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch31_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch31_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch31_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch31_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch31_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch31_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch31_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch31_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch31_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch31_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch31_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch31_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch31_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch31_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch31_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch31_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch31_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch31_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch31_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch31_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch31_coeff_1_0)	 // ufix32
	 );
	 
adc_correction_engine ch30_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch30_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch30_x_lin),
	 // ADC output srdyo
	 .srdyo(ch30_srdyo),
    // section limit
	 .section_limit(ch30_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch30_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch30_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch30_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch30_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch30_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch30_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch30_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch30_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch30_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch30_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch30_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch30_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch30_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch30_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch30_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch30_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch30_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch30_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch30_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch30_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch30_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch30_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch30_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch30_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch30_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch30_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch30_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch30_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch30_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch30_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch30_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch30_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch30_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch30_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch30_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch30_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch30_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch30_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch30_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch30_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch30_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch30_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch30_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch30_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch30_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch30_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch30_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch30_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch30_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch30_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch30_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch30_coeff_1_0)	 // ufix32
	 );
	 
adc_correction_engine ch29_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch29_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch29_x_lin),
	 // ADC output srdyo
	 .srdyo(ch29_srdyo),
    // section limit
	 .section_limit(ch29_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch29_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch29_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch29_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch29_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch29_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch29_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch29_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch29_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch29_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch29_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch29_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch29_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch29_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch29_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch29_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch29_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch29_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch29_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch29_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch29_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch29_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch29_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch29_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch29_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch29_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch29_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch29_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch29_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch29_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch29_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch29_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch29_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch29_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch29_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch29_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch29_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch29_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch29_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch29_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch29_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch29_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch29_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch29_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch29_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch29_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch29_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch29_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch29_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch29_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch29_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch29_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch29_coeff_1_0)	 // ufix32
	 );
	 
adc_correction_engine ch28_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch28_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch28_x_lin),
	 // ADC output srdyo
	 .srdyo(ch28_srdyo),
    // section limit
	 .section_limit(ch28_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch28_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch28_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch28_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch28_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch28_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch28_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch28_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch28_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch28_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch28_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch28_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch28_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch28_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch28_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch28_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch28_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch28_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch28_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch28_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch28_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch28_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch28_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch28_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch28_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch28_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch28_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch28_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch28_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch28_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch28_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch28_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch28_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch28_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch28_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch28_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch28_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch28_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch28_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch28_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch28_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch28_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch28_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch28_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch28_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch28_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch28_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch28_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch28_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch28_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch28_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch28_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch28_coeff_1_0)	 // ufix32
	 );
	 
adc_correction_engine ch27_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch27_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch27_x_lin),
	 // ADC output srdyo
	 .srdyo(ch27_srdyo),
    // section limit
	 .section_limit(ch27_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch27_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch27_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch27_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch27_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch27_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch27_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch27_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch27_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch27_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch27_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch27_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch27_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch27_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch27_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch27_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch27_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch27_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch27_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch27_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch27_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch27_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch27_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch27_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch27_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch27_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch27_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch27_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch27_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch27_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch27_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch27_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch27_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch27_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch27_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch27_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch27_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch27_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch27_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch27_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch27_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch27_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch27_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch27_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch27_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch27_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch27_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch27_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch27_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch27_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch27_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch27_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch27_coeff_1_0)	 // ufix32
	 );
	 
adc_correction_engine ch26_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch26_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch26_x_lin),
	 // ADC output srdyo
	 .srdyo(ch26_srdyo),
    // section limit
	 .section_limit(ch26_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch26_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch26_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch26_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch26_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch26_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch26_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch26_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch26_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch26_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch26_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch26_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch26_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch26_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch26_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch26_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch26_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch26_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch26_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch26_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch26_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch26_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch26_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch26_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch26_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch26_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch26_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch26_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch26_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch26_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch26_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch26_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch26_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch26_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch26_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch26_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch26_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch26_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch26_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch26_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch26_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch26_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch26_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch26_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch26_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch26_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch26_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch26_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch26_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch26_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch26_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch26_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch26_coeff_1_0)	 // ufix32
	 );

adc_correction_engine ch25_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch25_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch25_x_lin),
	 // ADC output srdyo
	 .srdyo(ch25_srdyo),
    // section limit
	 .section_limit(ch25_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch25_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch25_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch25_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch25_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch25_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch25_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch25_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch25_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch25_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch25_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch25_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch25_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch25_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch25_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch25_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch25_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch25_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch25_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch25_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch25_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch25_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch25_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch25_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch25_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch25_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch25_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch25_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch25_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch25_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch25_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch25_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch25_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch25_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch25_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch25_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch25_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch25_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch25_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch25_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch25_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch25_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch25_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch25_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch25_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch25_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch25_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch25_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch25_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch25_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch25_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch25_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch25_coeff_1_0)	 // ufix32
	 );
	 
	 adc_correction_engine ch24_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch24_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch24_x_lin),
	 // ADC output srdyo
	 .srdyo(ch24_srdyo),
    // section limit
	 .section_limit(ch24_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch24_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch24_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch24_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch24_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch24_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch24_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch24_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch24_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch24_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch24_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch24_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch24_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch24_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch24_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch24_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch24_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch24_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch24_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch24_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch24_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch24_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch24_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch24_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch24_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch24_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch24_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch24_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch24_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch24_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch24_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch24_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch24_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch24_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch24_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch24_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch24_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch24_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch24_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch24_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch24_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch24_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch24_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch24_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch24_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch24_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch24_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch24_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch24_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch24_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch24_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch24_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch24_coeff_1_0)	 // ufix32
	 );
	 
	 
	 adc_correction_engine ch23_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch23_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch23_x_lin),
	 // ADC output srdyo
	 .srdyo(ch23_srdyo),
    // section limit
	 .section_limit(ch23_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch23_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch23_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch23_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch23_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch23_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch23_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch23_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch23_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch23_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch23_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch23_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch23_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch23_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch23_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch23_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch23_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch23_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch23_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch23_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch23_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch23_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch23_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch23_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch23_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch23_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch23_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch23_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch23_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch23_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch23_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch23_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch23_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch23_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch23_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch23_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch23_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch23_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch23_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch23_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch23_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch23_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch23_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch23_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch23_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch23_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch23_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch23_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch23_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch23_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch23_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch23_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch23_coeff_1_0)	 // ufix32
	 );
	 
	 adc_correction_engine ch22_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch22_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch22_x_lin),
	 // ADC output srdyo
	 .srdyo(ch22_srdyo),
    // section limit
	 .section_limit(ch22_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch22_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch22_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch22_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch22_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch22_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch22_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch22_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch22_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch22_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch22_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch22_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch22_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch22_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch22_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch22_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch22_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch22_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch22_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch22_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch22_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch22_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch22_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch22_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch22_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch22_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch22_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch22_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch22_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch22_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch22_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch22_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch22_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch22_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch22_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch22_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch22_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch22_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch22_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch22_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch22_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch22_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch22_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch22_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch22_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch22_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch22_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch22_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch22_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch22_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch22_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch22_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch22_coeff_1_0)	 // ufix32
	 );
	 
	 adc_correction_engine ch21_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch21_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch21_x_lin),
	 // ADC output srdyo
	 .srdyo(ch21_srdyo),
    // section limit
	 .section_limit(ch21_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch21_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch21_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch21_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch21_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch21_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch21_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch21_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch21_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch21_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch21_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch21_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch21_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch21_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch21_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch21_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch21_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch21_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch21_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch21_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch21_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch21_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch21_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch21_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch21_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch21_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch21_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch21_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch21_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch21_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch21_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch21_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch21_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch21_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch21_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch21_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch21_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch21_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch21_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch21_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch21_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch21_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch21_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch21_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch21_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch21_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch21_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch21_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch21_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch21_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch21_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch21_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch21_coeff_1_0)	 // ufix32
	 );
	 
	 adc_correction_engine ch20_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch20_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch20_x_lin),
	 // ADC output srdyo
	 .srdyo(ch20_srdyo),
    // section limit
	 .section_limit(ch20_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch20_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch20_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch20_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch20_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch20_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch20_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch20_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch20_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch20_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch20_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch20_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch20_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch20_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch20_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch20_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch20_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch20_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch20_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch20_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch20_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch20_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch20_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch20_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch20_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch20_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch20_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch20_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch20_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch20_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch20_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch20_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch20_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch20_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch20_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch20_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch20_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch20_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch20_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch20_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch20_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch20_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch20_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch20_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch20_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch20_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch20_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch20_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch20_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch20_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch20_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch20_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch20_coeff_1_0)	 // ufix32
	 );
	 
	 adc_correction_engine ch19_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch19_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch19_x_lin),
	 // ADC output srdyo
	 .srdyo(ch19_srdyo),
    // section limit
	 .section_limit(ch19_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch19_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch19_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch19_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch19_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch19_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch19_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch19_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch19_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch19_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch19_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch19_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch19_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch19_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch19_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch19_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch19_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch19_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch19_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch19_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch19_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch19_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch19_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch19_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch19_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch19_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch19_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch19_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch19_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch19_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch19_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch19_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch19_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch19_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch19_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch19_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch19_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch19_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch19_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch19_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch19_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch19_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch19_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch19_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch19_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch19_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch19_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch19_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch19_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch19_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch19_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch19_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch19_coeff_1_0)	 // ufix32
	 );
	 
	 adc_correction_engine ch18_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch18_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch18_x_lin),
	 // ADC output srdyo
	 .srdyo(ch18_srdyo),
    // section limit
	 .section_limit(ch18_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch18_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch18_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch18_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch18_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch18_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch18_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch18_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch18_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch18_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch18_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch18_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch18_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch18_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch18_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch18_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch18_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch18_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch18_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch18_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch18_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch18_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch18_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch18_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch18_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch18_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch18_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch18_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch18_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch18_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch18_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch18_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch18_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch18_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch18_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch18_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch18_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch18_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch18_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch18_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch18_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch18_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch18_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch18_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch18_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch18_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch18_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch18_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch18_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch18_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch18_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch18_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch18_coeff_1_0)	 // ufix32
	 );
	 
	 adc_correction_engine ch17_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch17_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch17_x_lin),
	 // ADC output srdyo
	 .srdyo(ch17_srdyo),
    // section limit
	 .section_limit(ch17_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch17_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch17_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch17_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch17_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch17_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch17_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch17_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch17_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch17_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch17_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch17_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch17_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch17_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch17_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch17_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch17_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch17_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch17_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch17_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch17_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch17_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch17_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch17_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch17_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch17_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch17_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch17_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch17_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch17_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch17_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch17_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch17_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch17_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch17_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch17_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch17_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch17_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch17_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch17_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch17_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch17_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch17_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch17_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch17_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch17_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch17_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch17_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch17_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch17_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch17_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch17_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch17_coeff_1_0)	 // ufix32
	 );
	 
	 adc_correction_engine ch16_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch16_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch16_x_lin),
	 // ADC output srdyo
	 .srdyo(ch16_srdyo),
    // section limit
	 .section_limit(ch16_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch16_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch16_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch16_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch16_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch16_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch16_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch16_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch16_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch16_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch16_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch16_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch16_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch16_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch16_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch16_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch16_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch16_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch16_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch16_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch16_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch16_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch16_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch16_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch16_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch16_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch16_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch16_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch16_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch16_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch16_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch16_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch16_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch16_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch16_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch16_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch16_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch16_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch16_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch16_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch16_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch16_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch16_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch16_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch16_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch16_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch16_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch16_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch16_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch16_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch16_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch16_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch16_coeff_1_0)	 // ufix32
	 );
	 
	 adc_correction_engine ch15_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch15_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch15_x_lin),
	 // ADC output srdyo
	 .srdyo(ch15_srdyo),
    // section limit
	 .section_limit(ch15_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch15_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch15_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch15_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch15_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch15_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch15_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch15_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch15_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch15_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch15_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch15_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch15_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch15_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch15_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch15_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch15_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch15_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch15_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch15_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch15_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch15_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch15_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch15_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch15_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch15_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch15_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch15_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch15_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch15_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch15_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch15_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch15_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch15_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch15_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch15_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch15_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch15_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch15_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch15_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch15_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch15_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch15_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch15_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch15_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch15_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch15_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch15_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch15_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch15_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch15_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch15_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch15_coeff_1_0)	 // ufix32
	 );
	 
	 adc_correction_engine ch14_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch14_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch14_x_lin),
	 // ADC output srdyo
	 .srdyo(ch14_srdyo),
    // section limit
	 .section_limit(ch14_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch14_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch14_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch14_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch14_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch14_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch14_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch14_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch14_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch14_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch14_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch14_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch14_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch14_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch14_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch14_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch14_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch14_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch14_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch14_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch14_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch14_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch14_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch14_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch14_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch14_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch14_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch14_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch14_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch14_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch14_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch14_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch14_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch14_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch14_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch14_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch14_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch14_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch14_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch14_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch14_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch14_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch14_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch14_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch14_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch14_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch14_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch14_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch14_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch14_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch14_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch14_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch14_coeff_1_0)	 // ufix32
	 );
	 
	 adc_correction_engine ch13_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch13_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch13_x_lin),
	 // ADC output srdyo
	 .srdyo(ch13_srdyo),
    // section limit
	 .section_limit(ch13_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch13_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch13_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch13_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch13_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch13_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch13_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch13_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch13_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch13_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch13_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch13_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch13_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch13_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch13_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch13_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch13_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch13_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch13_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch13_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch13_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch13_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch13_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch13_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch13_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch13_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch13_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch13_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch13_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch13_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch13_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch13_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch13_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch13_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch13_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch13_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch13_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch13_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch13_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch13_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch13_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch13_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch13_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch13_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch13_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch13_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch13_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch13_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch13_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch13_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch13_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch13_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch13_coeff_1_0)	 // ufix32
	 );
	 
	 adc_correction_engine ch12_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch12_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch12_x_lin),
	 // ADC output srdyo
	 .srdyo(ch12_srdyo),
    // section limit
	 .section_limit(ch12_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch12_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch12_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch12_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch12_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch12_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch12_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch12_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch12_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch12_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch12_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch12_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch12_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch12_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch12_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch12_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch12_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch12_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch12_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch12_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch12_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch12_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch12_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch12_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch12_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch12_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch12_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch12_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch12_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch12_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch12_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch12_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch12_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch12_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch12_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch12_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch12_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch12_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch12_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch12_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch12_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch12_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch12_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch12_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch12_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch12_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch12_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch12_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch12_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch12_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch12_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch12_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch12_coeff_1_0)	 // ufix32
	 );
	 
	 adc_correction_engine ch11_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch11_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch11_x_lin),
	 // ADC output srdyo
	 .srdyo(ch11_srdyo),
    // section limit
	 .section_limit(ch11_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch11_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch11_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch11_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch11_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch11_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch11_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch11_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch11_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch11_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch11_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch11_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch11_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch11_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch11_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch11_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch11_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch11_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch11_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch11_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch11_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch11_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch11_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch11_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch11_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch11_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch11_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch11_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch11_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch11_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch11_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch11_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch11_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch11_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch11_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch11_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch11_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch11_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch11_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch11_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch11_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch11_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch11_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch11_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch11_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch11_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch11_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch11_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch11_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch11_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch11_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch11_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch11_coeff_1_0)	 // ufix32
	 );
	 
	 adc_correction_engine ch10_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch10_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch10_x_lin),
	 // ADC output srdyo
	 .srdyo(ch10_srdyo),
    // section limit
	 .section_limit(ch10_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch10_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch10_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch10_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch10_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch10_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch10_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch10_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch10_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch10_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch10_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch10_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch10_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch10_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch10_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch10_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch10_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch10_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch10_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch10_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch10_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch10_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch10_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch10_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch10_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch10_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch10_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch10_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch10_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch10_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch10_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch10_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch10_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch10_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch10_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch10_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch10_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch10_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch10_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch10_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch10_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch10_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch10_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch10_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch10_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch10_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch10_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch10_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch10_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch10_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch10_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch10_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch10_coeff_1_0)	 // ufix32
	 );
	 
	 adc_correction_engine ch9_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch9_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch9_x_lin),
	 // ADC output srdyo
	 .srdyo(ch9_srdyo),
    // section limit
	 .section_limit(ch9_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch9_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch9_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch9_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch9_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch9_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch9_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch9_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch9_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch9_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch9_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch9_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch9_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch9_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch9_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch9_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch9_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch9_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch9_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch9_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch9_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch9_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch9_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch9_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch9_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch9_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch9_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch9_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch9_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch9_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch9_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch9_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch9_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch9_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch9_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch9_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch9_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch9_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch9_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch9_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch9_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch9_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch9_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch9_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch9_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch9_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch9_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch9_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch9_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch9_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch9_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch9_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch9_coeff_1_0)	 // ufix32
	 );
	 
	 adc_correction_engine ch8_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch8_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch8_x_lin),
	 // ADC output srdyo
	 .srdyo(ch8_srdyo),
    // section limit
	 .section_limit(ch8_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch8_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch8_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch8_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch8_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch8_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch8_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch8_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch8_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch8_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch8_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch8_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch8_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch8_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch8_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch8_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch8_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch8_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch8_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch8_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch8_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch8_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch8_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch8_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch8_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch8_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch8_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch8_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch8_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch8_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch8_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch8_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch8_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch8_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch8_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch8_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch8_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch8_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch8_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch8_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch8_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch8_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch8_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch8_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch8_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch8_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch8_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch8_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch8_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch8_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch8_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch8_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch8_coeff_1_0)	 // ufix32
	 );
	 
	 adc_correction_engine ch7_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch7_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch7_x_lin),
	 // ADC output srdyo
	 .srdyo(ch7_srdyo),
    // section limit
	 .section_limit(ch7_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch7_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch7_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch7_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch7_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch7_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch7_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch7_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch7_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch7_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch7_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch7_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch7_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch7_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch7_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch7_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch7_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch7_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch7_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch7_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch7_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch7_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch7_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch7_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch7_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch7_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch7_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch7_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch7_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch7_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch7_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch7_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch7_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch7_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch7_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch7_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch7_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch7_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch7_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch7_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch7_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch7_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch7_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch7_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch7_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch7_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch7_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch7_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch7_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch7_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch7_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch7_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch7_coeff_1_0)	 // ufix32
	 );
	 
	 adc_correction_engine ch6_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch6_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch6_x_lin),
	 // ADC output srdyo
	 .srdyo(ch6_srdyo),
    // section limit
	 .section_limit(ch6_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch6_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch6_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch6_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch6_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch6_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch6_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch6_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch6_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch6_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch6_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch6_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch6_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch6_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch6_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch6_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch6_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch6_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch6_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch6_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch6_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch6_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch6_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch6_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch6_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch6_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch6_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch6_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch6_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch6_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch6_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch6_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch6_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch6_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch6_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch6_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch6_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch6_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch6_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch6_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch6_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch6_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch6_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch6_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch6_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch6_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch6_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch6_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch6_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch6_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch6_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch6_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch6_coeff_1_0)	 // ufix32
	 );
	 
	 adc_correction_engine ch5_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch5_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch5_x_lin),
	 // ADC output srdyo
	 .srdyo(ch5_srdyo),
    // section limit
	 .section_limit(ch5_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch5_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch5_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch5_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch5_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch5_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch5_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch5_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch5_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch5_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch5_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch5_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch5_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch5_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch5_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch5_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch5_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch5_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch5_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch5_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch5_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch5_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch5_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch5_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch5_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch5_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch5_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch5_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch5_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch5_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch5_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch5_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch5_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch5_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch5_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch5_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch5_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch5_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch5_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch5_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch5_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch5_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch5_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch5_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch5_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch5_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch5_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch5_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch5_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch5_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch5_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch5_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch5_coeff_1_0)	 // ufix32
	 );
	 
	 adc_correction_engine ch4_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch4_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch4_x_lin),
	 // ADC output srdyo
	 .srdyo(ch4_srdyo),
    // section limit
	 .section_limit(ch4_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch4_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch4_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch4_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch4_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch4_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch4_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch4_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch4_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch4_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch4_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch4_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch4_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch4_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch4_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch4_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch4_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch4_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch4_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch4_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch4_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch4_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch4_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch4_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch4_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch4_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch4_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch4_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch4_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch4_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch4_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch4_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch4_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch4_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch4_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch4_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch4_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch4_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch4_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch4_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch4_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch4_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch4_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch4_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch4_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch4_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch4_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch4_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch4_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch4_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch4_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch4_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch4_coeff_1_0)	 // ufix32
	 );
	 
	 adc_correction_engine ch3_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch3_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch3_x_lin),
	 // ADC output srdyo
	 .srdyo(ch3_srdyo),
    // section limit
	 .section_limit(ch3_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch3_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch3_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch3_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch3_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch3_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch3_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch3_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch3_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch3_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch3_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch3_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch3_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch3_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch3_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch3_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch3_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch3_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch3_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch3_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch3_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch3_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch3_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch3_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch3_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch3_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch3_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch3_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch3_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch3_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch3_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch3_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch3_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch3_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch3_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch3_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch3_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch3_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch3_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch3_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch3_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch3_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch3_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch3_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch3_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch3_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch3_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch3_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch3_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch3_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch3_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch3_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch3_coeff_1_0)	 // ufix32
	 );
	 
	 adc_correction_engine ch2_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch2_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch2_x_lin),
	 // ADC output srdyo
	 .srdyo(ch2_srdyo),
    // section limit
	 .section_limit(ch2_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch2_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch2_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch2_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch2_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch2_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch2_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch2_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch2_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch2_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch2_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch2_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch2_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch2_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch2_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch2_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch2_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch2_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch2_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch2_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch2_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch2_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch2_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch2_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch2_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch2_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch2_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch2_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch2_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch2_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch2_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch2_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch2_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch2_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch2_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch2_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch2_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch2_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch2_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch2_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch2_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch2_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch2_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch2_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch2_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch2_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch2_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch2_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch2_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch2_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch2_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch2_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch2_coeff_1_0)	 // ufix32
	 );
	 
	 adc_correction_engine ch1_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch1_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch1_x_lin),
	 // ADC output srdyo
	 .srdyo(ch1_srdyo),
    // section limit
	 .section_limit(ch1_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch1_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch1_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch1_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch1_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch1_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch1_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch1_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch1_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch1_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch1_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch1_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch1_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch1_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch1_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch1_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch1_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch1_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch1_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch1_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch1_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch1_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch1_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch1_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch1_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch1_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch1_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch1_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch1_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch1_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch1_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch1_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch1_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch1_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch1_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch1_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch1_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch1_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch1_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch1_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch1_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch1_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch1_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch1_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch1_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch1_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch1_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch1_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch1_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch1_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch1_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch1_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch1_coeff_1_0)	 // ufix32
	 );
	 
	 adc_correction_engine ch0_NLC(// input clock
	 .sys_clk_i(clk),
	 // global reset
	 .reset_i(reset),
	 // ADC input x : 21 bits
    .adc_correction_in(ch0_x_adc),
    // ADC input srdyi : high when data is ready
	 .srdyi(srdyi),
	 // ADC output x: 21 bits
	 .adc_correction_out(ch0_x_lin),
	 // ADC output srdyo
	 .srdyo(ch0_srdyo),
    // section limit
	 .section_limit(ch0_section_limit),
    //Reciprocal standard deviation for the centered and scaled fit
	 .select_section_coefficients_stdev_4_porty(ch0_recip_stdev_4), // ufix32
    .select_section_coefficients_stdev_3_porty(ch0_recip_stdev_3), // ufix32
    .select_section_coefficients_stdev_2_porty(ch0_recip_stdev_2), // ufix32
    .select_section_coefficients_stdev_1_porty(ch0_recip_stdev_1), // ufix32
	 //Negative meand for the centered and scaled fit
    .select_section_coefficients_mean_4_porty(ch0_neg_mean_4), // ufix32
    .select_section_coefficients_mean_3_porty(ch0_neg_mean_3), // ufix32
    .select_section_coefficients_mean_2_porty(ch0_neg_mean_2), // ufix32
    .select_section_coefficients_mean_1_porty(ch0_neg_mean_1), // ufix32
	 //Section 4 coefficients (x > 0, |x| > section_limit)
	 .select_section_coefficients_coeff_4_9_porty(ch0_coeff_4_9), // ufix32
    .select_section_coefficients_coeff_4_8_porty(ch0_coeff_4_8), // ufix32
    .select_section_coefficients_coeff_4_7_porty(ch0_coeff_4_7), // ufix32
    .select_section_coefficients_coeff_4_6_porty(ch0_coeff_4_6), // ufix32
    .select_section_coefficients_coeff_4_5_porty(ch0_coeff_4_5), // ufix32
    .select_section_coefficients_coeff_4_4_porty(ch0_coeff_4_4), // ufix32
    .select_section_coefficients_coeff_4_3_porty(ch0_coeff_4_3), // ufix32
    .select_section_coefficients_coeff_4_2_porty(ch0_coeff_4_2), // ufix32
    .select_section_coefficients_coeff_4_10_porty(ch0_coeff_4_10), // ufix32
    .select_section_coefficients_coeff_4_1_porty(ch0_coeff_4_1), // ufix32
    .select_section_coefficients_coeff_4_0_porty(ch0_coeff_4_0), // ufix32
	 //Section 3 coefficients (x > 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_3_9_porty(ch0_coeff_3_9), // ufix32
    .select_section_coefficients_coeff_3_8_porty(ch0_coeff_3_8), // ufix32
    .select_section_coefficients_coeff_3_7_porty(ch0_coeff_3_7), // ufix32
    .select_section_coefficients_coeff_3_6_porty(ch0_coeff_3_6), // ufix32
    .select_section_coefficients_coeff_3_5_porty(ch0_coeff_3_5), // ufix32
    .select_section_coefficients_coeff_3_4_porty(ch0_coeff_3_4), // ufix32
    .select_section_coefficients_coeff_3_3_porty(ch0_coeff_3_3), // ufix32
    .select_section_coefficients_coeff_3_2_porty(ch0_coeff_3_2), // ufix32
    .select_section_coefficients_coeff_3_10_porty(ch0_coeff_3_10), // ufix32
    .select_section_coefficients_coeff_3_1_porty(ch0_coeff_3_1), // ufix32
    .select_section_coefficients_coeff_3_0_porty(ch0_coeff_3_0), // ufix32
	 //Section 2 coefficients (x <= 0, |x| <= section_limit)
	 .select_section_coefficients_coeff_2_9_porty(ch0_coeff_2_9), // ufix32
    .select_section_coefficients_coeff_2_8_porty(ch0_coeff_2_8), // ufix32
    .select_section_coefficients_coeff_2_7_porty(ch0_coeff_2_7), // ufix32
    .select_section_coefficients_coeff_2_6_porty(ch0_coeff_2_6), // ufix32
    .select_section_coefficients_coeff_2_5_porty(ch0_coeff_2_5), // ufix32
    .select_section_coefficients_coeff_2_4_porty(ch0_coeff_2_4), // ufix32
    .select_section_coefficients_coeff_2_3_porty(ch0_coeff_2_3), // ufix32
    .select_section_coefficients_coeff_2_2_porty(ch0_coeff_2_2), // ufix32
    .select_section_coefficients_coeff_2_10_porty(ch0_coeff_2_10), // ufix32
    .select_section_coefficients_coeff_2_1_porty(ch0_coeff_2_1), // ufix32
    .select_section_coefficients_coeff_2_0_porty(ch0_coeff_2_0), // ufix32
	 //Section 1 coefficients (x <= 0, |x| > section_limit)
	 .select_section_coefficients_coeff_1_9_porty(ch0_coeff_1_9), // ufix32
    .select_section_coefficients_coeff_1_8_porty(ch0_coeff_1_8), // ufix32
    .select_section_coefficients_coeff_1_7_porty(ch0_coeff_1_7), // ufix32
    .select_section_coefficients_coeff_1_6_porty(ch0_coeff_1_6), // ufix32
    .select_section_coefficients_coeff_1_5_porty(ch0_coeff_1_5), // ufix32
    .select_section_coefficients_coeff_1_4_porty(ch0_coeff_1_4), // ufix32
    .select_section_coefficients_coeff_1_3_porty(ch0_coeff_1_3), // ufix32
    .select_section_coefficients_coeff_1_2_porty(ch0_coeff_1_2), // ufix32
    .select_section_coefficients_coeff_1_10_porty(ch0_coeff_1_10), // ufix32
    .select_section_coefficients_coeff_1_1_porty(ch0_coeff_1_1), // ufix32
    .select_section_coefficients_coeff_1_0_porty(ch0_coeff_1_0)	 // ufix32
	 );

endmodule
