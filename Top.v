`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:27:23 04/06/2017 
// Design Name: 
// Module Name:    Top 
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
module Top(fpga_clk1, Mode, Stress, seg0,seg1,seg2,seg3,seg4,seg5,seg6,dp,an0,an1,an2,an3,led0);
	input fpga_clk1, Mode, Stress;
	output seg0,seg1,seg2,seg3,seg4,seg5,seg6,dp,an0,an1,an2,an3, led0;
	wire ring_out;
	wire [15:0] value;
	
	RingOsc2 RingOscillator(.Mode(Mode), .Stress(Stress), .OUT(ring_out));
	
	Counting_circuit Counter(.clk(fpga_clk1), .Ring_in(ring_out), .value_out(value));
	
	SensorController Display(.fpga_clk1(fpga_clk1), .value(value),
										.seg0(seg0),
										.seg1(seg1),
										.seg2(seg2),
										.seg3(seg3),
										.seg4(seg4),
										.seg5(seg5),
										.seg6(seg6),
										.dp(dp),.an0(an0),.an1(an1),.an2(an2),.an3(an3),
										.led0(led0)); 
	
	
	
	
endmodule
