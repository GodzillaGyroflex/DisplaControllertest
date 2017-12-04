`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:00:31 10/23/2017
// Design Name:   nBitCounter
// Module Name:   C:/Users/Saulo/Documents/DisplaControllertest/nBitCounter_tb.v
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

module nBitCounter_tb;

	// Inputs
	reg enable;
	reg clk;
	reg rst_n;

	// Outputs
	wire [7:0] count;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	nBitCounter uut (
		.count(count), 
		.enable(enable), 
		.clk(clk), 
		.rst_n(rst_n), 
		.carry(carry)
	);

	initial begin
		// Initialize Inputs
		enable = 1;
		clk = 0;
		rst_n = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		repeat(600) #10 clk = ~clk;
		rst_n = 0; 
		#10
		rst_n = 1;
		repeat(600) #10 clk = ~clk;

	end
      
endmodule

