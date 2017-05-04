`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:00:41 02/23/2017
// Design Name:   SensorController
// Module Name:   C:/Users/Caio/Dropbox/Silicon Aging Sensor/Projetos/DisplayController/sensor_cont_tb.v
// Project Name:  DisplayController
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

module sensor_cont_tb;

	// Inputs
	reg fpga_clk1;
	reg reset;
	reg btn2;
	reg btn3;

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
	wire clk2_out;
	wire led0;

	// Instantiate the Unit Under Test (UUT)
	SensorController uut (
		.fpga_clk1(fpga_clk1), 
		.reset(reset), 
		.btn2(btn2), 
		.btn3(btn3), 
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
		.clk2_out(clk2_out), 
		.led0(led0)
	);

	initial begin
		// Initialize Inputs
		fpga_clk1 = 0;
		reset = 0;
		btn2 = 0;
		btn3 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		end
		
		always begin
	#40 fpga_clk1 = !fpga_clk1;
	end
	
	initial begin
	#1000 btn2 = 1;
	#50000 btn2 = 0;
	
	
	#200 reset = 0;
	#200 reset = 0;
		
	end
      
endmodule

