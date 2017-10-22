`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/25 15:09:09
// Design Name: 
// Module Name: instruction
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


module instruction(
    
    input [5:0] Addr,
    output logic [31:0] inst
    );
    logic [31:0] inst_mem [63:0];
   
    assign inst_mem[0] = 32'b00000000000001111000000000000000; //NOP
    assign inst_mem[1] = 32'b10000000000010000000000000000001; //R1 = R0 + 1          1
    assign inst_mem[2] = 32'b10000010000100000000000000000001; //R2 = R1 + 1             2
    assign inst_mem[3] = 32'b00000010000111010000010000000000; //R3 = R1 XOR R2         3
    assign inst_mem[4] = 32'b00000110001001101000000000000000; //R4 = SLL R3 by 1         6    
    assign inst_mem[5] = 32'b00001000001111001000011000000000; //R7 = R4 OR R3       7
    assign inst_mem[6] = 32'b00001110001010011000010000000000; //R5 = R7 - R2         5
    assign inst_mem[7] = 32'b10000000001100000000000000000110; //R6 = R0 + 6         6
    assign inst_mem[8] = 32'b00001100000000110000101000000000; //Store DM(R6) <- R5      6
    assign inst_mem[9] = 32'b00001100001100100000000000000000; //Load R6 <- DM(R6)       5
    
    /*
    assign inst_mem[0] = 32'b00000000000001111000000000000000; //NOP
        assign inst_mem[1] = 32'b10000000000010000000000000000001; //R1 = R0 + 1          1
        assign inst_mem[2] = 32'b10000010000100000000000000000001; //R2 = R1 + 1             2
        assign inst_mem[3] = 32'b00000010000111010000010000000000; //R3 = R1 XOR R2         3
        assign inst_mem[4] = 32'b00000110001001101000000000000000; //R4 = SLL R3 by 1         6    
        assign inst_mem[5] = 32'b00001000001111001000011000000000; //R7 = R4 OR R3       7
        assign inst_mem[6] = 32'b00000110001010011000001000000000; //R5 = R3 - R1         2
        assign inst_mem[7] = 32'b10000000001100000000000000000110; //R6 = R0 + 6         6
        assign inst_mem[8] = 32'b00001100000000110000101000000000; //Store DM(R6) <- R5      6
        assign inst_mem[9] = 32'b00001100001100100000000000000000; //Load R6 <- DM(R6)       2
        */
    genvar i;
    generate
        for(i=10;i<=63;i++) begin: g
            assign inst_mem[i] = 32'b00000000000001111000000000000000;
        end
    endgenerate    
    

    assign inst = inst_mem[Addr];
    
endmodule
