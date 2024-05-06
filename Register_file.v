`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:21:23 04/05/2023 
// Design Name: 
// Module Name:    Register_file 
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

module Register_file(readData1,readData2,readAddr1,readAddr2,writeAddr,
                     regWriteData,regWrite,clk,reset);
output [31:0]readData1,readData2;
input [4:0]readAddr1,readAddr2,writeAddr;
input [31:0]regWriteData;
input regWrite,clk,reset;
reg [31:0]regMem[31:0];
integer i;
 
assign readData1 = regMem[readAddr1];
assign readData2 = regMem[readAddr2];

always@(negedge reset)
begin
if(reset==0) for(i=0;i<32;i=i+1) regMem[i] = 0; 
end

always@(regWriteData)
begin
if (regWrite==1 && writeAddr!=5'b00000) regMem[writeAddr] = regWriteData;
end

endmodule
