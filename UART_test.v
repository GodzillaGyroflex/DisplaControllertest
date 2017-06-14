`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:50:15 06/13/2017
// Design Name:   UART_transmitter
// Module Name:   C:/Users/Saulo/Documents/DisplaControllertest/UART_test.v
// Project Name:  DisplaControllertest
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UART_transmitter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module UART_test;

	// Inputs
	reg clk;
	reg rx;

	// Outputs
	wire tx;

	// Instantiate the Unit Under Test (UUT)
	UART_transmitter uut (
		.fpga_clk1(clk), 
		.rx(rx), 
		.tx(tx)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rx = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
			forever #10 clk = ~clk;
	end
      
endmodule

