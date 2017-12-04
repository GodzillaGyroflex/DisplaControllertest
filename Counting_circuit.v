`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:59:51 04/27/2017 
// Design Name: 
// Module Name:    Counting_circuit 
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
/* Circuito de contagem dos pulsos 
 Circuito mede a frequência do oscilador baseado na quantidade de pulsos detectados pelo contador 2 
 no tempo que leva para o contador 1 chegar ao valor de max. A frequência pode ser estimada multiplicando-se por 10^6 a saída*/
module Counting_circuit(clk, enable, Ring_in, value_out);
		parameter max = 99;              
		input clk, Ring_in, enable;
		output reg [15:0] value_out;
		wire [15:0] rst_value;
		wire reset;
		reg rst;
		wire [15:0] ring_value;
		
		
		nBitCounter Counter1(.count(rst_value), .enable(enable), .clk(clk), .rst_n(rst)); 
		
		nBitCounter Counter2(.count(ring_value), .enable(enable), .clk(Ring_in), .rst_n(rst)); 
		
		always@(posedge Ring_in)
			if(rst_value <= max)    
				begin
					//value_out = 0;
					rst = 1;
				end else begin
				value_out = ring_value;  //retorna na saida a frequência quando rst_value chega a max
				rst = 0;
				end
			

endmodule
