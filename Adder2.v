`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:40:26 04/05/2023 
// Design Name: 
// Module Name:    Adder2 
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
module Adder_2(PC_1,PC_2,offset_1);
output reg [31:0] PC_2;
input [31:0] PC_1,offset_1;
always@(*)
begin
PC_2=PC_1+offset_1;
end



endmodule

