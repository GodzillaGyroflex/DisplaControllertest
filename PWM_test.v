`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:21:12 06/09/2017
// Design Name:   PWM_gen
// Module Name:   C:/Users/Saulo/Documents/DisplaControllertest/PWM_test.v
// Project Name:  DisplaControllertest
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PWM_gen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PWM_test;

	// Inputs
	reg clk_in;
	wire PWM_out;

	// Instantiate the Unit Under Test (UUT)
	PWM_gen uut (
		.clk_in(clk_in), 
		.PWM_out(PWM_out)
	);

	initial begin
		// Initialize Inputs
		clk_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		forever #10 clk_in = ~clk_in;

	end
      
endmodule

