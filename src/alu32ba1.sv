`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/29 13:11:14
// Design Name: 
// Module Name: alu31ba1
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


module alu_32bA ( op1, op2, ALUopsel , result /*, c_flag , z_flag , o_flag , s_flag*/ );
parameter DWIDTH = 32;
input logic [DWIDTH -1:0] op1 ; 
input logic [DWIDTH -1:0] op2 ; 
input logic [ 3:0] ALUopsel ; 

output logic [DWIDTH -1:0] result ; 
/*output logic c_flag ; 
output logic z_flag ; 
output logic o_flag ; 
output logic s_flag ;
*/
 always_comb
 case(ALUopsel)
 //4'b1111:result = 0; 
 4'b0000:result = op1+op2;
 4'b0011:result = op1-op2;
 4'b1000:result = op1&op2;
 4'b1001:result = op1|op2;
 4'b1011:result = ~op1;
 4'b1010:result = op1^op2;
 4'b1101:result = op1<<1;
 4'b0010:result = op1;
 4'b0100:result = op1;
 4'b0110:result = op1;
 default:result = 0;
 endcase
/*
assign c_flag = (mode==1)?1'b0:tempcout[31];
assign z_flag = (result == 0)?1'b1:1'b0;
assign s_flag = result[31];
assign o_flag = (mode==1)?1'b0:((tempcout[31]==result[31])?1'b0:1'b1);     
*/
endmodule
