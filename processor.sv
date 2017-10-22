`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/26 22:56:48
// Design Name: 
// Module Name: processor
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


module processor(
    input logic clk,
    input logic rst,
    output logic [31:0]    reg_write_data
    );
 wire [5:0] addr;
 wire [31:0] inst;
 wire [5:0] rs;
 wire [5:0] rd;
 wire [5:0] rt;
 wire [14:0] imm;
 wire [3:0] ALUopsel;
 wire Muxsel1;
 wire Muxsel2;
 wire WE1;
 wire WE2;
wire [31:0] RD1;
wire [31:0] RD2;
//wire [31:0] WD;

wire [31:0] operandB;
wire [31:0] ext_imm;
wire [31:0] ALUresult;
wire [31:0] readdata;
//lgic [31:0] temp;   
//assign temp = 0;
   
    counter l1(.rst(rst),.clk(clk),.Addr(addr));
    instruction l2(.Addr(addr),.inst(inst));
    controller l3( inst,rs,rd,rt,imm,ALUopsel,Muxsel1,Muxsel2,WE1,WE2);
    //reg_file l4(rs,rt,rd,reg_write_data,WE1,clk,RD1,RD2);
    reg_file l4(rs,rt,rd,reg_write_data,WE1,clk,rst,RD1,RD2);
    signextend l5(imm,ext_imm);
    mux l6(ext_imm,RD2,Muxsel1,operandB);
    
    alu_32bA l7(RD1,operandB,ALUopsel,ALUresult);
    //alu_32b l7(RD1,operandB,ALUopsel[2:0],ALUopsel[3],ALUresult);

    datamemory l8(ALUresult,RD2,WE2,clk,readdata);
    mux l9(readdata,ALUresult,Muxsel2,reg_write_data);
    //reg_file l10(rs,rt,rd,reg_write_data,WE1,clk,RD1,RD);
  // assign reg_write_data = WD;
    //assign temp = WD;


endmodule