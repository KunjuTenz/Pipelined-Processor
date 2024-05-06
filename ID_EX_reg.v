`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:41:18 04/22/2023 
// Design Name: 
// Module Name:    ID_EX_reg 
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
module ID_EX_reg(pc_ID_EX,data1_ID_EX,data2_ID_EX,rd_ID_EX,aluControl_ID_EX,
             regWrite_ID_EX,rs1_ID_EX,rs2_ID_EX,branch_ID_EX,jump_ID_EX,BEQ_ID_EX,BNE_ID_EX,
             memRead_ID_EX,memWrite_ID_EX,memToReg_ID_EX,aluSrc_ID_EX,immVal_ID_EX,
             readData1,readData2,rd,aluControl,regWrite,rs1,rs2,branch_IF_ID,jump_IF_ID,BEQ_IF_ID,BNE_IF_ID,pc_IF_ID,
             memRead,memWrite,memToReg,aluSrc,immVal,clk,reset,stall);
output reg [31:0]pc_ID_EX,data1_ID_EX,data2_ID_EX,immVal_ID_EX;
output reg [4:0]rs1_ID_EX,rs2_ID_EX,rd_ID_EX;
output reg [3:0]aluControl_ID_EX;
output reg regWrite_ID_EX,branch_ID_EX,jump_ID_EX,BEQ_ID_EX,BNE_ID_EX,memRead_ID_EX,memWrite_ID_EX,
           memToReg_ID_EX,aluSrc_ID_EX;
input [31:0]pc_IF_ID,readData1,readData2,immVal;
input [4:0]rs1,rs2,rd;
input [2:0]aluControl;
input branch_IF_ID,jump_IF_ID,memRead,memWrite,memToReg,aluSrc,regWrite,clk,reset,stall,BEQ_IF_ID,BNE_IF_ID;

always@(posedge clk, negedge reset)
begin
if(reset==0 || stall==1) 
    begin 
        pc_ID_EX = 0;
        data1_ID_EX = 0;
        data2_ID_EX = 0;
        rd_ID_EX = 0; 
        aluControl_ID_EX = 0; 
        regWrite_ID_EX = 0;
        rs1_ID_EX = 0; 
        rs2_ID_EX = 0;
        branch_ID_EX = 0;
        jump_ID_EX = 0;
        memRead_ID_EX = 0;
        memWrite_ID_EX = 0;
        memToReg_ID_EX = 0;
        aluSrc_ID_EX = 0;
        immVal_ID_EX = 0;
    end
                         
else 
    begin 
        pc_ID_EX = pc_IF_ID;
        data1_ID_EX =readData1;
        data2_ID_EX =readData2;
        rd_ID_EX = rd; 
        aluControl_ID_EX = aluControl; 
        regWrite_ID_EX = regWrite;
        rs1_ID_EX = rs1; 
        rs2_ID_EX = rs2;
        branch_ID_EX = branch_IF_ID;
        jump_ID_EX = jump_IF_ID;
        memRead_ID_EX = memRead;
        memWrite_ID_EX = memWrite;
        memToReg_ID_EX = memToReg;
        aluSrc_ID_EX = aluSrc;
        immVal_ID_EX = immVal;
    end
end

endmodule
