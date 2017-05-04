`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:45:57 02/12/2017 
// Design Name: 
// Module Name:    DCM_Controller 
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
//
//////////////////////////////////////////////////////////////////////////////////
module DCM_Controller(clk,register,plus,minus,status,PSEN,PSINCDEC,enable_out,in0
    );
	 
	 input clk;
	 input [7:0]register;
	 input plus;
	 input minus;
	 input status;
	 output reg PSEN = 0;
	 output reg PSINCDEC = 0;
	 output enable_out ;
	 
	 output reg [3:0] in0 = 4'b1010;
	 
	 parameter superior_limit = 16;
	 wire [7:0] register;
	 
	 reg reg_status;
	 reg reset;
	 
	 FDCE #(
	.INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
	) FDCE6 (
	.Q(enable_out), // Data output
	.C(clk), // Clock input
	.CE(reg_status), // Clock enable input
	.CLR(reset), // Asynchronous clear input
	.D(status) // Data input
	);	
	 
	 always@(minus or plus or register) begin
				reg_status = 1;
				reset = 1;
				if (register < superior_limit && register > 0) begin
					case ({minus,plus})
					2'b01 : begin
							PSINCDEC = 0;
							PSEN = 1;
							end	
					2'b10 : begin
							PSINCDEC = 1;
							PSEN = 1;
							end
					default : begin
							PSINCDEC = 0;
							PSEN = 0;
							end
					endcase
						reset=0;
						reg_status=1	;
						in0 = 4'b1010;		
				end
				else begin
							reg_status = 0;
							PSINCDEC = 0;
							PSEN = 0;
							reset = 0;
							in0 = 4'b1011;	
				end
		
		end

endmodule
