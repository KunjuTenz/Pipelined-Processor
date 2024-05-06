`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:14:18 04/05/2023 
// Design Name: 
// Module Name:    PC_set 
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

module PC(clk,reset,PC,PC_in,stall,ecall,stall_PC);
output reg [31:0] PC;
input clk,reset,stall,ecall,stall_PC;
input [31:0] PC_in;
always @(negedge reset)
begin
if(reset==0)
PC=4194344;
end
always@(posedge clk)
begin
if(stall==1 || ecall==1 || stall_PC==1) PC = PC + 0;
else if(reset==1)
PC=PC_in;
end
endmodule

