`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:13:33 02/08/2017 
// Design Name: 
// Module Name:    Debouncer 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//	http://www.labbookpages.co.uk/electronics/debounce.html
//
//////////////////////////////////////////////////////////////////////////////////
module Debouncer(clk,sw_in,sw_out);
	 
	 input clk;  
	 input sw_in;
	 output sw_out;
	 
	 wire ff_sync_wire1;
	 wire ff_sync_wire2;
	 reg out = 0;
	 
	 integer sample_counter = 0; 
	 integer pulse_counter = 0;
	 wire enable;
	 reg sample_complete = 0;	 //SAMPLE IDEAL RATE = 500us
	 parameter sample_count_max = 10; // SAMPLE COUNT MAX = (Clock Frequency / 2000) - 1
	 parameter pulse_count_max = 20; // PULSE COUNT MAX = 20 * Sample ideal rate 
	 
	 reg r1, r2, r3;
	 
	 always@(posedge clk) begin
		 if (sample_counter < sample_count_max) begin
			sample_counter <= sample_counter + 1;
			sample_complete <= 0;
		 end
		 else if (sample_counter == sample_count_max) begin
			sample_complete <= 1;
			sample_counter <= 0;
		 end
	 end
	 
	 FDCE #(
	.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
	) FF1 (
	.Q(ff_sync_wire1), // Data output
	.C(clk), // Clock input
	.CE(1'b1), // Clock enable input
	.CLR(1'b0), // Asynchronous clear input
	.D(sw_in) // Data input
	); 
	 
	 FDCE #(
	.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
	) FF2 (
	.Q(ff_sync_wire2), // Data output
	.C(clk), // Clock input
	.CE(1'b1), // Clock enable input
	.CLR(1'b0), // Asynchronous clear input
	.D(ff_sync_wire1) // Data input
	); 
	
	and(enable,sample_complete,ff_sync_wire2);
	
	always@(posedge clk) begin
		if (enable)
			if (ff_sync_wire2) begin
				if (pulse_counter < pulse_count_max) begin
					pulse_counter = pulse_counter + 1;
					out = 0;
					end
				else if( pulse_counter == pulse_count_max)
					out = 1;
				end
			else begin
				pulse_counter = 0;
				out = 0;
				end
		else begin
			if (!ff_sync_wire2) begin
				pulse_counter = 0;
				out = 0;
				end
		end
	end
	

    always @(posedge clk) begin
        r1 <= out;    // first stage of 2-stage synchronizer
        r2 <= r1;       // second stage of 2-stage synchronizer
        r3 <= r2;       // edge detector memory
    end
	
	 and(sw_out,r2,!r3);
		
	

endmodule
