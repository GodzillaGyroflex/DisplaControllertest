`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:33:36 05/30/2017
// Design Name:   Duty_Cycle_Circuit
// Module Name:   C:/Users/Saulo/Documents/DisplaControllertest/Duty_Cycle_tb.v
// Project Name:  DisplaControllertest
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Duty_Cycle_Circuit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Duty_Cycle_tb;

	// Inputs
	reg ring_in;
	reg enable;
	reg clk;
	reg reset;

	// Outputs
	wire [7:0] value;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	Duty_Cycle_Circuit uut (
		.ring_in(ring_in), 
		.enable(enable), 
		.clk(clk), 
		.reset(reset), 
		.C2_out(value),
		.carry1(carry)
	);

	initial begin
		// Initialize Inputs
		ring_in = 0;
		enable = 1;
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
       
      fork
			forever #10 clk = ~clk;
			forever begin
				ring_in = 1; 
				#100;
				ring_in = 0; 
				#100;	end
		join		
		// Add stimulus here

	end
      
endmodule

