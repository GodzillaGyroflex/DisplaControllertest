`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:44:48 05/05/2017
// Design Name:   Top
// Module Name:   C:/Users/LESCPC03/Downloads/DisplaControllertest/toptest.v
// Project Name:  DisplaControllertest
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module toptest;

	// Inputs
	reg fpga_clk1;
	reg Mode;
	reg Stress;
	reg ring_out;

	// Outputs
	wire seg0;
	wire seg1;
	wire seg2;
	wire seg3;
	wire seg4;
	wire seg5;
	wire seg6;
	wire dp;
	wire an0;
	wire an1;
	wire an2;
	wire an3;
	wire led0;

	// Instantiate the Unit Under Test (UUT)
	Top uut (
		.fpga_clk1(fpga_clk1), 
		.Mode(Mode), 
		.Stress(Stress), 
		.ring_out(ring_out), 
		.seg0(seg0), 
		.seg1(seg1), 
		.seg2(seg2), 
		.seg3(seg3), 
		.seg4(seg4), 
		.seg5(seg5), 
		.seg6(seg6), 
		.dp(dp), 
		.an0(an0), 
		.an1(an1), 
		.an2(an2), 
		.an3(an3), 
		.led0(led0)
	);

	initial begin
		// Initialize Inputs
		fpga_clk1 = 0;
		Mode = 0;
		Stress = 0;
		ring_out = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		  
		  fork
			forever #10 fpga_clk1 = ~fpga_clk1;
			//forever #8 ring_out = ~ring_out;
		  join
		// Add stimulus here

	end
      
endmodule

