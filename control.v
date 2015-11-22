`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:15:17 11/09/2015 
// Design Name: 
// Module Name:    control 
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
module control(
    input srdyi,
    output reg srdyo,
    output reg sum_en,
    output reg sum_rst,
    input clk,
	 input GlobalReset,
    output reg [3:0] coeff_sel
    );

//wire clk1, clk2;
//assign clk1 = clk && srdyi;
//assign clk2 = clk && srdyo;
reg a;

always@(posedge clk)
begin
/*	if(coeff_sel == 4'b1011) 
	begin
		//a <= 1;
		srdyo <=1;
	end */
	if(srdyo == 1)
	begin
		srdyo <=0;
	end
end


always@(posedge srdyi)
begin
		if(GlobalReset == 0)
		begin
			if(coeff_sel==4'b1010)
			begin
				srdyo <= 1;
			//	a		<= 0;
			end   
			coeff_sel <= coeff_sel +1;	
		end
end

always@(posedge GlobalReset)
begin
	coeff_sel <= 0;
	srdyo <=0;
	a		<=0;
	sum_en	<=1;
	sum_rst  <=0;
end

always@(posedge srdyi)
begin
		if(sum_en == 0)
		begin
				sum_en = 1;
		end
end

always@(posedge srdyo)
begin
    coeff_sel <= 0;
		if(sum_en == 1)
		begin
				sum_en  = 0;
				sum_rst = 1;
		end
end

always@(negedge clk)
begin
		if(sum_rst)
		begin
				sum_rst = 0;
		end
end

endmodule
