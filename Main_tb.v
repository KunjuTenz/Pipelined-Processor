`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:26:23 04/05/2023
// Design Name:   main
// Module Name:   C:/Users/vigne/OneDrive/Desktop/CA_ASSIGNMENT2/assignment2/Main_tb.v
// Project Name:  assignment2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module main_tb; 
wire[31:0] ALU_output; 
reg reset,clk;
 main MT(ALU_output,clk,reset);

initial
begin
 #0 clk = 0;
 reset=1;
 #10 reset=0;
 #15 reset = 1;
#2000 $stop; end
always begin
 #20 clk = ~clk;
end endmodule 
