`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:15:47 04/05/2023 
// Design Name: 
// Module Name:    MUX_5 
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
module MUX_5(in1,in2,Select_line,out);
input [4:0] in1,in2;
input Select_line;
output reg [4:0] out;
always@*
begin
if(Select_line==0)
assign out=in1;
else
assign out=in2;
end
endmodule
