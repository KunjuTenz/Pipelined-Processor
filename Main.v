`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21:22:08 04/05/2023 
// Design Name: 
// Module Name:    Main 
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
module main(output [31:0] aluResult,input clk,input reset);
wire [31:0] inCode,readData1,readData2,regWriteData,offset_32,MUX_32_out,PC,PC_1,PC_2,PC_3,PC_4,PC_in,jump_offset,offset_1,pc_IF_ID,
inCode_IF_ID,pc_ID_EX,data1_ID_EX,data2_ID_EX;
wire [31:0] Data_mem_out,immVal_ID_EX,aluResult_EX_MEM,data2_EX_MEM;
wire regWrite,aluSrc,memWrite,memToReg,memRead,RegDst,jump,branch,PCsrc,PCsrc1,PCsrc2,BEQ,BNE,stall,ecall,stall_branch,stall_PC,BEQ_ID_EX,
BNE_ID_EX,branch_IF_ID,jump_IF_ID,BEQ_IF_ID,BNE_IF_ID,
memRead_ID_EX,regWrite_ID_EX,branch_ID_EX,jump_ID_EX, memToReg_ID_EX,aluSrc_ID_EX;
wire [2:0] aluControl,aluConrol_ID_EX;
wire [4:0] rd,rd_ID_EX,rs1_IF_ID,rs2_IF_ID,rd_MEM_WB,rd_EX_MEM,rs1_ID_EX,rs2_ID_EX,rs_IF_ID,rt_IF_ID;
wire zero,regWrite_EX_MEM,memWrite_EX_MEM,memRead_EX_MEM,memToReg_EX_MEM,jump_EX_MEM;
wire regWrite_MEM_WB,memToReg_MEM_WB,jump_MEM_WB;
wire [31:0] data_MEM_WB,aluResult_MEM_WB;
wire [1:0] forwardRs1,forwardRs2;
reg [31:0] data2,in1;
PC 							m1 (clk,reset,PC,PC_in,stall,ecall,stall_PC);

Adder 						m2 (PC,PC_1);

instruction_memory 		m3 (inCode,PC,reset);

Branch_Jump 				m4 (branch,jump,ecall,BEQ,BNE,inCode);

Shifter                sh1 (inCode[31:0],jump_offset);
assign PC_3={{PC_1[31:28]},{jump_offset[27:0]}};

assign PCsrc1=((BEQ_ID_EX)&&(zero));

assign PCsrc2=((!zero)&&(BNE_ID_EX));

assign PCsrc=branch_ID_EX&&(PCsrc1||PCsrc2);

MUX_32 						m5  (PC_1,PC_2,PCsrc,PC_4);

MUX_32 						m6  (PC_4,PC_3,jump,PC_in);

IF_ID_reg               m7  (pc_IF_ID,inCode_IF_ID,branch_IF_ID,jump_IF_ID,BEQ_IF_ID,BNE_IF_ID,rs_IF_ID,rt_IF_ID,
									 PC,inCode,branch,jump,BEQ,BNE,clk,reset,stall,stall_branch);
									 
Hazard_detection 			m8  (stall,stall_branch,stall_PC,memRead_ID_EX,rd_ID_EX,rs_IF_ID,rt_IF_ID,branch_IF_ID,branch_ID_EX,branch,reset);

Control_unit 				m9  (regWrite,aluSrc,memWrite,memToReg,aluControl,memRead,inCode_IF_ID[31:26],inCode_IF_ID[5:0],RegDst);

MUX_5 						m10 (inCode_IF_ID[20:16],inCode_IF_ID[15:11],RegDst,rd);

Register_file 				m11 (readData1,readData2,inCode_IF_ID[25:21],inCode_IF_ID[20:16],rd_MEM_WB,regWriteData,regWrite_MEM_WB,clk,reset);

Sign_Extender 				m12 (inCode_IF_ID[15:0],offset_32);

ID_EX_reg 					m13(pc_ID_EX,data1_ID_EX,data2_ID_EX,rd_ID_EX,aluConrol_ID_EX,
									regWrite_ID_EX,rs1_ID_EX,rs2_ID_EX,branch_ID_EX,jump_ID_EX,BEQ_ID_EX,BNE_ID_EX,
									memRead_ID_EX,memWrite_ID_EX,memToReg_ID_EX,aluSrc_ID_EX,immVal_ID_EX,
									readData1,readData2,rd,aluControl,regWrite,inCode_IF_ID[25:21],inCode_IF_ID[20:16],branch_IF_ID,jump_IF_ID,
									BEQ_IF_ID,BNE_IF_ID,pc_IF_ID,memRead,memWrite,memToReg,aluSrc,offset_32,clk,reset,stall);


always@(*)
begin
case(forwardRs1)
2'b00: in1 = data1_ID_EX;
2'b01: in1 = aluResult_EX_MEM;
2'b10: in1 = regWriteData;
endcase
end  

always@(*)
begin
case(forwardRs2)
2'b00: data2 = data2_ID_EX;
2'b01: data2 = aluResult_EX_MEM;
2'b10: data2 = regWriteData;
endcase
end 

Shifter m14(immVal_ID_EX[31:0],offset_1);
Adder_2 m15(pc_ID_EX,PC_2,offset_1);
MUX_32 m16(data2,immVal_ID_EX,aluSrc_ID_EX,MUX_32_out);
ALU m17(aluResult,zero,in1,MUX_32_out,aluConrol_ID_EX);

EX_MEM_reg    m18  (regWrite_EX_MEM,memWrite_EX_MEM,memRead_EX_MEM,
                   memToReg_EX_MEM,rd_EX_MEM,aluResult_EX_MEM,data2_EX_MEM,jump_EX_MEM,
                   regWrite_ID_EX,memWrite_ID_EX,memRead_ID_EX,
                   memToReg_ID_EX,rd_ID_EX,aluResult,data2_ID_EX,jump_ID_EX,clk,reset);
Data_memory   m19  (Data_mem_out,aluResult_EX_MEM,data2_EX_MEM,memWrite_EX_MEM,memRead_EX_MEM,reset);
MEM_WB_reg    m20  (regWrite_MEM_WB,memToReg_MEM_WB,
                    data_MEM_WB,aluResult_MEM_WB,rd_MEM_WB,jump_MEM_WB,
                    regWrite_EX_MEM,memToReg_EX_MEM,Data_mem_out,aluResult_EX_MEM, 
                    rd_EX_MEM,jump_EX_MEM,clk,reset);
MUX_32 m21(aluResult_MEM_WB,data_MEM_WB,memToReg_MEM_WB,regWriteData);

Forwarding_unit  m22(forwardRs1,forwardRs2,rs1_ID_EX,rs2_ID_EX,rd_EX_MEM,rd_MEM_WB,
                       regWrite_EX_MEM,regWrite_MEM_WB);
endmodule


