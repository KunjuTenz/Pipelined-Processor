`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:25:54 04/22/2023 
// Design Name: 
// Module Name:    Branch_Jump 
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
module Branch_Jump(branch,jump,ecall,BEQ,BNE,inCode);
output reg branch,jump,ecall,BEQ,BNE;
input [31:0]inCode;
wire [5:0]opCode;

assign opCode = inCode[31:26];

always@(*)
begin
case(opCode)
6'b000100: begin branch = 1; jump = 0; ecall = 0;BEQ=1;BNE=0;				//beq
         
            end   
6'b000101: begin branch = 1; jump = 0; ecall = 0;BEQ=0;BNE=1;				//bne
                  
            end  
6'b000010: begin branch = 0; jump = 1; ecall = 0;				//jump
             
            end
default: begin branch = 0; jump = 0; ecall = 0; end
endcase
end

endmodule