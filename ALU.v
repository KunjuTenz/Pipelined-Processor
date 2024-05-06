`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:06:18 04/05/2023 
// Design Name: 
// Module Name:    ALU 
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
module ALU(aluResult,zero,in1,in2,aluControl);
output reg [31:0] aluResult;
output reg zero;
input [31:0] in1,in2;
input [2:0] aluControl;

always@(*)
begin 
case(aluControl)
3'b010: aluResult = in1 + in2;  
3'b110: aluResult = in1 - in2;
3'b000: aluResult = in1 & in2;
3'b001: aluResult = in1 | in2;
3'b111: aluResult = (in1<in2) ? 1:0;
endcase
end
always@(aluResult)
begin
if(aluResult==0)
zero=1;
else 
zero=0;
end
endmodule

