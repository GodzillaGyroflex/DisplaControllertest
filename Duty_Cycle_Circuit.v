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
	input clk, ring_in, reset, enable;
	output reg [15:0] value;
	wire [7:0] C1_out;
	wire [15:0] C2_out;
	reg C1_carry;
	
	eightBitCounter Counter1(.count(C1_out), .enable(enable), .clk(clk), .rst_n(reset));
	nBitCounter Counter2(.count(C2_out), .enable(ring_in), .clk(clk), .rst_n(C1_carry));
	
	always@(posedge clk) 
		if(&C1_out) begin
			value = C2_out;
			C1_carry = 0;
			end
		else
			C1_carry = 1;


endmodule
