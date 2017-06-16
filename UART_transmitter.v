`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:40:02 06/13/2017 
// Design Name: 
// Module Name:    UART_transmitter 
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
module UART_transmitter(input fpga_clk1,
                input rx,
                output tx);

    reg [31:0] count = 0;
    wire ready; 
    uart_send sender("F", 1, fpga_clk1, tx, ready);  

    always @(posedge fpga_clk1)
        if(count == 100000000) count <= 0;
        else count <= count + 1;

endmodule

module uart_send #(parameter BAUD_RATE = 9600,
                   parameter CLOCK_SPEED_MHZ = 100)
                  (input [7:0] data_byte, 
                  input start_send, 
                  input clk, 
                  output tx,
                  output ready);

        parameter integer CYCLES_WAIT = CLOCK_SPEED_MHZ * 1e6 / BAUD_RATE;

        parameter IDLE = 0;
        parameter START_BIT = 1;
        parameter END_BIT = 2;
        parameter DATA_BIT = 3;

        reg [2:0] state = IDLE;
        reg [15:0] cycle_count = 0;
        reg [3:0] bit_index = 0;
        reg [7:0] data;

        assign tx = state == IDLE ? 1 :
                    state == START_BIT ? 0 :
                    state == END_BIT ? 1 :
                    data[bit_index];

        assign ready = state == IDLE;

        always @(posedge clk) begin
            if(state != IDLE)
                data <= data_byte;
                if(cycle_count == CYCLES_WAIT) cycle_count <= 0;
                else cycle_count <= cycle_count + 1;

            if(state == IDLE && start_send) begin
                state <= START_BIT;
                cycle_count <= 0;
            end else if(state == START_BIT && cycle_count == CYCLES_WAIT) begin
                state <= DATA_BIT;
                bit_index <= 0;
            end else if(state == DATA_BIT && cycle_count == CYCLES_WAIT) begin
                if(bit_index == 7) state <= END_BIT;
                else bit_index <= bit_index + 1;
            end else if(state == END_BIT && cycle_count == CYCLES_WAIT) begin
                state <= IDLE;
            end
        end

endmodule