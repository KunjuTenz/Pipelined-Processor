`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:32:39 04/05/2023 
// Design Name: 
// Module Name:    control-unit 
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

module Control_unit(regWrite,aluSrc,memWrite,memToReg,aluControl,
                    memRead,opCode,funct,RegDst);
output reg regWrite,aluSrc,memWrite,memToReg,memRead,RegDst;
output reg [2:0]aluControl;
input [5:0]opCode;
input [5:0]funct;
reg [1:0] aluOp;
wire [7:0]control;
always@(*)
begin
case(opCode)
6'b00000: begin regWrite = 1;       //R-type
                aluSrc = 0;
                aluOp=2'b10;
					 memWrite = 0;
                memToReg = 0;
                memRead = 0;
					 RegDst=1;
            end
6'b100011: begin regWrite = 1;       //I-type (LW) 
                aluSrc = 1;
                aluOp=2'b00;
					 memWrite = 0;
                memToReg = 1;
                memRead = 1;
					 RegDst=0;
            end
6'b101011: begin regWrite = 0;       //S-type 
                aluSrc = 1;
					 aluOp=2'b00;
                memWrite = 1;
                memToReg = 1'bx;
                memRead = 0;
					 RegDst=1'bx;
            end
6'b000100: begin regWrite =0;       //beq-type 
                aluSrc = 0;
	             aluOp=2'b01;
                memWrite = 0;
                memToReg = 1'bx;
                memRead = 0;
	             RegDst=1'bx;
            end
6'b000101: begin regWrite =0;       //bne-type 
                aluSrc = 0;
	             aluOp=2'b01;
                memWrite = 0;
                memToReg = 1'bx;
                memRead = 0;
	             RegDst=1'bx;
            end				
6'b000010: begin regWrite = 0;       //Jump
                aluSrc =1'bx ;
	             aluOp=2'bxx;
                memWrite = 0;
                memToReg = 1'bx;
                memRead = 0;
	             RegDst=1'bx;	
            end
          
endcase
end

assign control = {aluOp,funct};

always@(*)
begin
casez(control)
8'b10_100000: aluControl = 3'b010; //add
8'b10_100010: aluControl = 3'b110; //sub
8'b10_100100: aluControl = 3'b000;//and
8'b10_100101: aluControl = 3'b001;//or
8'b10_101010: aluControl = 3'b111;//slt
8'b00_??????: aluControl = 3'b010;//lw
8'b00_??????: aluControl = 3'b010;//sw
8'b01_??????: aluControl = 3'b110;//beq,beq

endcase
end

endmodule


