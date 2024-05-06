`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:19:22 04/05/2023 
// Design Name: 
// Module Name:    Data_mem 
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
module Data_memory(readData,addr,memWriteData,memWrite,memRead,reset);
output reg [31:0]readData;
input [31:0]memWriteData,addr;
input memWrite,memRead,reset;

reg [7:0] mem [19:0];

always@(negedge reset)
begin
if(reset==0) 
begin 
mem[3] = 0; mem[2] = 0; mem[1] = 0; mem[0] = 10;
mem[7] = 0; mem[6] = 0; mem[5] = 0; mem[4] = 20;
mem[11] = 0; mem[10] = 0; mem[9] = 0; mem[8] = 12;
mem[15] = 1; mem[14] = 1; mem[13] = 1; mem[12] = 1;
mem[19] = 1; mem[18] = 1; mem[17] = 1; mem[16] = 1;
end
end

always@(addr,memRead,memWrite)
begin
if (memRead == 1 && addr[1:0]==2'b00) 
    readData = {mem[addr+3],mem[addr+2],mem[addr+1],mem[addr]};
else if (memWrite == 1 && addr[1:0]==2'b00) 
    {mem[addr+3],mem[addr+2],mem[addr+1],mem[addr]} = memWriteData;
end

endmodule

