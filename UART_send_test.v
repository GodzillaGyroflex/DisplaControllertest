`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:58:54 06/13/2017
// Design Name:   uart_send
// Module Name:   C:/Users/Saulo/Documents/DisplaControllertest/UART_send_test.v
// Project Name:  DisplaControllertest
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: uart_send
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module UART_send_test;

	// Inputs
	reg [7:0] data_byte;
	reg start_send;
	reg clk;

	// Outputs
	wire tx;
	wire ready;

	// Instantiate the Unit Under Test (UUT)
	uart_send uut (
		.data_byte(data_byte), 
		.start_send(start_send), 
		.clk(clk), 
		.tx(tx), 
		.ready(ready)
	);

	initial begin
		// Initialize Inputs
		data_byte = 8'b01110000;
		start_send = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		forever #10 clk = ~clk;
	end
      
endmodule

