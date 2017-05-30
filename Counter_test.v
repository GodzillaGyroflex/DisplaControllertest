`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:32:44 05/30/2017
// Design Name:   nBitCounter
// Module Name:   C:/Users/Saulo/Documents/DisplaControllertest/Counter_test.v
// Project Name:  DisplaControllertest
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: nBitCounter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Counter_test;

	// Inputs
	reg clk;
	reg rst_n;
	reg enable;
	
	// Outputs
	wire [15:0] count;

	// Instantiate the Unit Under Test (UUT)
	nBitCounter uut (
		.count(count),
		.enable(enable),
		.clk(clk), 
		.rst_n(rst_n)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 1;
		enable = 1;
		// Wait 100 ns for global reset to finish
		#100;
       

		repeat(50) #10 clk = ~clk;	
		enable = 0;
		repeat(10) #10 clk = ~clk;
		enable = 1;
		repeat(50) #10 clk = ~clk;
		
		// Add stimulus here

	end
      
endmodule

