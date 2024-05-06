`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.04.2023 16:07:58
// Design Name: 
// Module Name: Stalling_unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Hazard_detection(stall,stall_branch,stall_PC,memRead_ID_EX,rd_ID_EX,rs1_IF_ID,rs2_IF_ID,branch_IF_ID,branch_ID_EX,branch,reset);
output reg stall,stall_branch,stall_PC;
input [4:0]rd_ID_EX,rs1_IF_ID,rs2_IF_ID;
input memRead_ID_EX,reset,branch_IF_ID,branch_ID_EX,branch;

always@(negedge reset)
begin
if(reset==0) 
begin
stall_branch=0;
stall=0;
stall_PC=0;
end
end

always@(*)
begin
if(memRead_ID_EX==1 && ((rd_ID_EX==rs1_IF_ID)||(rd_ID_EX==rs2_IF_ID))) stall = 1;
else if(branch==1 || branch_IF_ID==1 || branch_ID_EX==1) 
	begin
		if(branch_IF_ID==1)
		begin
		stall=0;
		stall_PC=0;
		stall_branch=1;
		end
		else if(branch_ID_EX==1)
		begin
		stall_PC=0;
		stall_branch=1;
		stall=0;
		end
		else 
		begin
		stall_PC=1;
		stall=0;
		end
	end
else stall = 0;
end

endmodule


