`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:36:28 02/19/2017
// Design Name:   testef
// Module Name:   C:/Users/Caio/Dropbox/Silicon Aging Sensor/DisplayController/testeff.v
// Project Name:  DisplayController
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: testef
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testeff;

	// Inputs
	reg MeasuredSignal;
	reg clk;
	reg reset;
	reg D_out;
	reg counter_wire;

	// Outputs
	wire [0:7] count;

	// Instantiate the Unit Under Test (UUT)
	testef uut (
		.MeasuredSignal(MeasuredSignal), 
		.clk(clk), 
		.reset(reset), 
		.count(count), 
		.D_out(D_out)
	//	.counter_wire(counter_wire)
	);

	initial begin
		// Initialize Inputs
		MeasuredSignal = 0;
		clk = 0;
		reset = 0;
		D_out = 0;
		//counter_wire = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		end
		
		always begin
		#20  clk = !clk;
		end
		
		always begin
		#20  D_out = !D_out;
		end
		
		
		
		
		
		


      
endmodule

