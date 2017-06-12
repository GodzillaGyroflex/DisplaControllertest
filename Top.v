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
module Top(fpga_clk1, Mode, Stress, ring_out, seg0,seg1,seg2,seg3,seg4,seg5,seg6,dp,an0,an1,an2,an3,led0);
	input fpga_clk1, Mode, Stress;
	output seg0,seg1,seg2,seg3,seg4,seg5,seg6,dp,an0,an1,an2,an3, led0;
	output ring_out;
	wire [15:0] value;
	reg enable = 1;
	reg reset = 1;
	
	RingOsc2 RingOscillator(.Mode(Mode), .Stress(Stress), .OUT(ring_out));
	
	//PWM_gen PWM(.clk_in(fpga_clk1), .PWM_out(ring_out));	
	
	Counting_circuit Counter(.clk(fpga_clk1), .enable(enable), .Ring_in(ring_out), .value_out(value));
	
	//Duty_Cycle_Circuit Dut(.ring_in(ring_out), .enable(enable), .clk(fpga_clk1), .reset(reset), .value(value));
	
	SensorController Display(.fpga_clk1(fpga_clk1), .value(value), .reset(1'b0),
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
