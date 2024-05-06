`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:16:48 04/05/2023 
// Design Name: 
// Module Name:    SIGN_EXTENDER 
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
module Sign_Extender(offset,offset_32);
input [15:0] offset;
output reg [31:0] offset_32;
always@(*)
begin
offset_32[31:0]={{16{offset[15]}},offset[15:0]};
end
endmodule
