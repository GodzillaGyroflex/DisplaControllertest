`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:14:29 06/09/2017 
// Design Name: 
// Module Name:    PWM_gen 
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
module PWM_gen(clk_in, PWM_out);
	 parameter control = 64;
	 input clk_in;	 
	 output reg PWM_out;
	 
	 reg [7:0] counter = 0;
	 
	 always@ (posedge clk_in) begin
				if(counter < control) begin
						PWM_out <= 1;
						counter <= counter + 1;
						end
				else begin
						PWM_out <= 0;
						counter <= counter + 1;
						end
						
						end
				
				
endmodule
