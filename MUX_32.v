`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:15:03 04/05/2023 
// Design Name: 
// Module Name:    MUX_32 
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
module MUX_32(in1,in2,Select_line,out);
input [31:0] in1,in2;
input Select_line;
output reg [31:0] out;
always@*
begin
if(Select_line==0)
assign out=in1;
else
assign out=in2;
end
endmodule