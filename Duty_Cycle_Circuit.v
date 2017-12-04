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
////////////////////////////////////////////////////////////////////////////////
//Circuito de medição do Duty Cycle do oscilador
module Duty_Cycle_Circuit(ring_in, enable, clk, reset, C2_out, carry1);

	//parameter max = 255;

	input clk, ring_in, reset, enable;
	wire [7:0] C1_out;
	output wire [7:0] C2_out;
	output wire carry1;
	wire carry2;
	reg rst;
	
	
	nBitCounter Counter1(.count(C1_out), .enable(enable), .clk(clk), .rst_n(rst), .carry(carry1));
	eightBitCounter Counter2(.count(C2_out), .enable(ring_in),.clk(clk), .rst_n(rst));
	
	always@(posedge clk)
		if(carry1 == 1) begin
			rst = 0;
			end
		else if(carry1 == 0) begin
			rst = 1;
			end	

endmodule
