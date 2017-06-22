`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:19:15 05/30/2017 
// Design Name: 
// Module Name:    Duty_Cycle_Circuit 
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
module Duty_Cycle_Circuit(ring_in, enable, clk, reset, value);
	parameter max = 25;
	input clk, ring_in, reset, enable;
	output reg [7:0] value;
	wire [7:0] C1_out;
	wire [7:0] C2_out;
	reg rst;
	
	eightBitCounter Counter1(.count(C1_out), .enable(enable), .clk(clk), .rst_n(rst));
	eightBitCounter Counter2(.count(C2_out), .enable(ring_in),.clk(clk), .rst_n(rst));
	
	always@(posedge clk) 
		if(C1_out <= max) begin		
			rst = 1;
			end
		else begin
			value = C2_out;
			rst = 0;
			end
			

endmodule
