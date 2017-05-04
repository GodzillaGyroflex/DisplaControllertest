`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:27:04 02/19/2017 
// Design Name: 
// Module Name:    testef 
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
module testef(
   input MeasuredSignal,
    input clk,
   input reset,
    //input start,
   output [0:7] count,
   input D_out
   //input counter_wire
   );
   
   
   reg [0:7] count_temp = 0;
   reg clr;

   ////and(counter_wire, MeasuredSignal,D_out);
   always@(posedge MeasuredSignal&D_out) begin
    count_temp = count_temp + 1;
   end
   
   
   
   FDCE #(
  .INIT(1'b0) // Initial value of register (1'b0 or 1'b1)
  ) FF1 (
  .Q(D_out), // Data output
  .C(clk), // Clock input
  .CE(btn), // Clock enable input
  .CLR(clr), // Asynchronous clear input
  .D(1'b1) // Data input
  ); 
  
  integer reg_clk = 0;
  
  
    always @ (posedge reset) begin
      reg_clk = 0;
      clr = 1;      
    end
    
    always @ (posedge clk) begin
      if(D_out) begin
        if(reg_clk < 500)begin
          reg_clk = reg_clk+1;
        end
        else if( reg_clk == 500)begin
           clr = 1;
        end
      end
    end
    
    
    assign count= count_temp;
  
    
endmodule