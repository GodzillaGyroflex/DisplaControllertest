`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:24:18 02/12/2017 
// Design Name: 
// Module Name:    Reg_Controller 
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
module Reg_Controller(clk,reset,minus,plus,register
    );
	 
	 parameter superior_limit = 16;
	 
	 input clk;
	 input reset;
	 input minus;
	 input plus;
	 output [7:0] register;
	 
	 reg [7:0] regtemp = 0;
	 
	 
	 always@(posedge clk) begin
	 if (reset) 
		regtemp = 0;
	 else begin
		 if (minus)
			if (regtemp > 0)
				regtemp = (regtemp - 1'b1);
		 if (plus)
			if (regtemp < superior_limit)
				regtemp = (regtemp + 1'b1);
		end
	 end
	
	assign register = regtemp;


endmodule
