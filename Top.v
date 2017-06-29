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
module Top(fpga_clk1, Mode, Stress, ring_out, seg0,seg1,seg2,seg3,seg4,seg5,seg6,dp,an0,an1,an2,an3,led0, CCout, DCout);
	input fpga_clk1, Mode, Stress;
	output seg0,seg1,seg2,seg3,seg4,seg5,seg6,dp,an0,an1,an2,an3, led0;
	output ring_out, CCout, DCout;
	wire [7:0] value1;
	wire [7:0] value2;
	wire clk, clk2;
	reg enable = 1;
	reg reset = 0;
	reg rst = 1;
	
	DCM dcm_clk (
    .CLKIN_IN(fpga_clk1), 
    .RST_IN(), 
    .CLKIN_IBUFG_OUT(), 
    .CLK0_OUT(clk), 
    .CLK2X_OUT(clk2), 
    .LOCKED_OUT()
    );



	
	
	RingOsc2 RingOscillator(.Mode(Mode), .Stress(Stress), .OUT(ring_out));
	
	//PWM_gen PWM(.clk_in(fpga_clk1), .PWM_out(ring_out));	
	
	Counting_circuit Counter(.clk(clk), .enable(1), .Ring_in(ring_out), .value_out(value1));
	
	Duty_Cycle_Circuit Dut(.ring_in(ring_out), .enable(1), .clk(clk2), .reset(rst), .value(value2));
	
	SensorController Display(.fpga_clk1(clk), .value(value1), .reset(1'b0),
										.seg0(seg0),
										.seg1(seg1),
										.seg2(seg2),
										.seg3(seg3),
										.seg4(seg4),
										.seg5(seg5),
										.seg6(seg6),
										.dp(dp),.an0(an0),.an1(an1),.an2(an2),.an3(an3),
										.led0(led0)); 
	
	
	
	uart_send #(9600,100) CCsender(.data_byte(value1), .start_send(1), .clk(clk), .tx(CCout), .ready());
	
	uart_send #(9600,100) DCsender(.data_byte(value2), .start_send(1), .clk(clk), .tx(DCout), .ready());
	
	
	
endmodule
