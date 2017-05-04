`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:16:20 05/04/2017
// Design Name:   BinToBCD
// Module Name:   C:/Users/Saulo/Documents/DisplaControllertest/BintoBCDtest.v
// Project Name:  DisplaControllertest
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BinToBCD
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module BintoBCDtest;

	// Inputs
	reg clk;
	reg [15:0] bin;

	// Outputs
	wire [3:0] un;
	wire [3:0] dec;
	wire [3:0] cent;
	wire [3:0] milh;

	// Instantiate the Unit Under Test (UUT)
	BinToBCD uut (
		.clk(clk), 
		.bin(bin), 
		.un(un), 
		.dec(dec), 
		.cent(cent), 
		.milh(milh)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		bin = 2578;

		// Wait 100 ns for global reset to finish
		#100;
        
		  forever #10 clk = ~clk;
		  
		  
		// Add stimulus here

	end
	
      
endmodule

