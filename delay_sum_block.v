`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:19:23 11/09/2015 
// Design Name: 
// Module Name:    delay_sum_block 
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
module delay_sum_block(
	input [31:0] x_i_porty,
	input sum_en,
	input sum_rst,
	input srdyi_i,
	input GlobalReset,
	input clk,
	input output_ready,
	input Global_srdyi,
	output reg [31:0] z_o_portx,
	output reg delay_o
    );
    


reg [31:0] input_reg;
reg [31:0] delay_reg;
reg  counter;

always @(posedge Global_srdyi)
begin
  z_o_portx <= 0;
  
  
end



always@(posedge clk)
begin
		if(GlobalReset==0)
		begin
		    if(output_ready)
		    begin
		      delay_o <=0;
		      z_o_portx <= x_i_porty;
		      counter <= 0;
		    end
		    
				else if(sum_en==1 && sum_rst==0)
				begin
						if(srdyi_i == 1 && counter ==0)
						 begin
						    counter <= counter +1;
						    delay_o <= 1;
						    z_o_portx  <= x_i_porty;
						 end 
						 else if (counter == 1)
						 begin
						    counter    <= 0;
						    delay_o    <= 0;
						    
						 end
						 
						 
				end
				else
				begin
				//		z_o_portx <= 0;
						delay_reg <= 0;
						delay_o	 <=  0;
						counter  <=    0;
				end
		end
		else if(GlobalReset==1)
		begin
		   z_o_portx <= 0;
			 delay_reg <= 0;
			 input_reg <= 0;
			 delay_o	  <= 0; 
			 counter     <= 0;
		end
end


/*
always@(posedge srdyi_i)
begin
	input_reg <= x_i_porty;
end
*/

	
endmodule
