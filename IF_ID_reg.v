`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:45:26 04/22/2023 
// Design Name: 
// Module Name:    IF_ID_reg 
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
module IF_ID_reg(pc_IF_ID,inCode_IF_ID,branch_IF_ID,jump_IF_ID,BEQ_IF_ID,BNE_IF_ID,rs_IF_ID,rt_IF_ID,
                            PC,inCode,branch,jump,BEQ,BNE,clk,reset,stall,stall_branch);
output reg [31:0]pc_IF_ID,inCode_IF_ID;
output reg branch_IF_ID,jump_IF_ID,BEQ_IF_ID,BNE_IF_ID;
output reg [4:0] rs_IF_ID,rt_IF_ID;
input [31:0]PC,inCode;
input branch,jump,clk,reset,stall_branch,stall,BEQ,BNE;

always@(posedge clk, negedge reset) 
begin 
if(reset==0 || stall_branch==1) 
    begin 
        pc_IF_ID = 0; 
        inCode_IF_ID = 0; 
        branch_IF_ID = 0; 
        jump_IF_ID = 0;
		  BEQ_IF_ID=0;
		  BNE_IF_ID=0;
		  rs_IF_ID=0;
		  rt_IF_ID=0;
    end  
else if(stall==0)
    begin 
        pc_IF_ID =PC;
        inCode_IF_ID = inCode;
        branch_IF_ID = branch; 
        jump_IF_ID = jump;
		  BEQ_IF_ID=BEQ;
		  BNE_IF_ID=BNE;
		  rs_IF_ID=inCode[25:21];
		  rt_IF_ID=inCode[20:16];
    end 
end

endmodule
