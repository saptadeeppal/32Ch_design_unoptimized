`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:31:56 11/10/2015 
// Design Name: 
// Module Name:    coeff_register 
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
module coeff_register(
	 input [3:0]   coeff_sel,
	 input [31:0]  coeff0_reg,
	 input [31:0]  coeff1_reg,
	 input [31:0]  coeff2_reg,
	 input [31:0]  coeff3_reg,
	 input [31:0]  coeff4_reg,
	 input [31:0]  coeff5_reg,
	 input [31:0]  coeff6_reg,
	 input [31:0]  coeff7_reg,
	 input [31:0]  coeff8_reg,
	 input [31:0]  coeff9_reg,
	 input [31:0]  coeff10_reg,
	 output reg [31:0] coeff_o
    );

always @(*)
begin
	case(coeff_sel)
		4'b0000:
		begin
			coeff_o = coeff0_reg;
		end
		4'b0001:
		begin
			coeff_o = coeff1_reg;
		end
		4'b0010:
		begin
			coeff_o = coeff2_reg;
		end
		4'b0011:
		begin
			coeff_o = coeff3_reg;
		end
		4'b0100:
		begin
			coeff_o = coeff4_reg;
		end
		4'b0101:
		begin
			coeff_o = coeff5_reg;
		end
		4'b0110:
		begin
			coeff_o = coeff6_reg;
		end
		4'b0111:
		begin
			coeff_o = coeff7_reg;
		end 
		4'b1000:
		begin
			coeff_o = coeff8_reg;
		end
		4'b1001:
		begin
			coeff_o = coeff9_reg;
		end
		4'b1010:
		begin
			coeff_o = coeff10_reg;
		end
	endcase
end

endmodule
