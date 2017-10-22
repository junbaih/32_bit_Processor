`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/22 20:08:04
// Design Name: 
// Module Name: controller
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


module controller(
    input logic [31:0] inst,
    output logic [5:0] rs,
    output logic [5:0] rd,
    output logic [5:0] rt,
    output logic [14:0] imm,
    output logic [3:0] ALUopsel,
    output logic Muxsel1,
    output logic Muxsel2,
    output logic WE1,
    output logic WE2
    );

assign Muxsel1 = inst[31];  //0 R type , 1 l type
assign rs = inst[30:25];
assign rd = inst[24:19];
assign ALUopsel = inst[18:15];
assign rt = inst[14:9];
assign imm = (inst[31]==1)?inst[14:0]:{15{1'b0}};
assign Muxsel2 = (inst[18:15]==4'b0100)?1'b1:1'b0 ; // load 1 else 0 
assign WE1 = (inst[18:15]==4'b0110||inst[18:15]==4'b1111)?1'b0:1'b1; // STORE 0 else 1, means don't have to write date to reg file when STORE.
assign WE2 = (inst[18:15]==4'b0110)?1'b1:1'b0;// ~WE1
endmodule
