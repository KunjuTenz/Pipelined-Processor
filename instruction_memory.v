`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:37:22 04/05/2023 
// Design Name: 
// Module Name:    instruction_memory 
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

module instruction_memory(inCode,pc,reset);
output reg [31:0] inCode;
input [31:0] pc;
input reset;

reg [7:0] mem[4194428:0];

always@(*)
begin
if(pc[1:0]==2'b00) inCode = {mem[pc+3],mem[pc+2],mem[pc+1],mem[pc]};
end

always@(negedge reset)
begin
if(reset==0) 																			
begin

mem[4194347] = 8'h8d; mem[4194346] = 8'h09; mem[4194345] = 8'h00; mem[4194344] = 8'h00;     // lw $t1,4($t0) 

mem[4194351] = 8'h8d; mem[4194350] = 8'h0a; mem[4194349] = 8'h00; mem[4194348] = 8'h04;     //lw $t2,8($t0) 

mem[4194355] = 8'h01; mem[4194354] = 8'h49; mem[4194353] = 8'h58; mem[4194352] = 8'h20;   // add $t3,$t2,$1

mem[4194359] = 8'h01; mem[4194358] = 8'h69; mem[4194357] = 8'h50; mem[4194356] = 8'h20;     // add $t2,$t3,$t1 

mem[4194363] = 8'h01; mem[4194362] = 8'h4a; mem[4194361] = 8'h58; mem[4194360] = 8'h22;     //sub $t3,$t2,$t2

mem[4194367] = 8'had; mem[4194366] = 8'h0b; mem[4194365] = 8'h00; mem[4194364] = 8'h08;   // sw $t3,8($t0)

/*
mem[4194347] = 8'h8d; mem[4194346] = 8'h09; mem[4194345] = 8'h00; mem[4194344] = 8'h00;     // lw $t1,0($t0) 

mem[4194351] = 8'h8d; mem[4194350] = 8'h0a; mem[4194349] = 8'h00; mem[4194348] = 8'h04;     //lw $t2,4($t0) 

mem[4194355] = 8'h11; mem[4194354] = 8'h2a; mem[4194353] = 8'h00; mem[4194352] = 8'h03;   // beq $t1,$t2,L1

mem[4194359] = 8'h01; mem[4194358] = 8'h2a; mem[4194357] = 8'h48; mem[4194356] = 8'h20;     // add $t1,$t1,$t2 

mem[4194363] = 8'had; mem[4194362] = 8'h09; mem[4194361] = 8'h00; mem[4194360] = 8'h08;     //sw $t1,8($t0)

mem[4194367] = 8'h01; mem[4194366] = 8'h49; mem[4194365] = 8'h50; mem[4194364] = 8'h22;   // L1:sub $t2,$t2,$t1

mem[4194371] = 8'had; mem[4194370] = 8'h0a; mem[4194369] = 8'h00; mem[4194368] = 8'h0c;	//sw $t2,12($t0)
*/
end
end

endmodule

