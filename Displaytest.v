`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:17:03 05/05/2017
// Design Name:   SensorController
// Module Name:   C:/Users/Saulo/Documents/DisplaControllertest/Displaytest.v
// Project Name:  DisplaControllertest
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SensorController
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Displaytest;

	// Inputs
	reg [15:0] value;
	reg fpga_clk1;
	reg reset;

	// Outputs
	wire seg0;
	wire seg1;
	wire seg2;
	wire seg3;
	wire seg4;
	wire seg5;
	wire seg6;
	wire dp;
	wire an1;
	wire an2;
	wire an3;
	wire an0;
	wire led0;

	// Instantiate the Unit Under Test (UUT)
	SensorController uut (
		.value(value), 
		.fpga_clk1(fpga_clk1), 
		.reset(reset), 
		.seg0(seg0), 
		.seg1(seg1), 
		.seg2(seg2), 
		.seg3(seg3), 
		.seg4(seg4), 
		.seg5(seg5), 
		.seg6(seg6), 
		.dp(dp), 
		.an1(an1), 
		.an2(an2), 
		.an3(an3), 
		.an0(an0), 
		.led0(led0)
	);

	initial begin
		// Initialize Inputs
		value = 2578;
		fpga_clk1 = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		  forever #10 fpga_clk1 = ~fpga_clk1;
		// Add stimulus here

	end
      
endmodule

