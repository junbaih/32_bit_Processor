`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/25 15:46:33
// Design Name: 
// Module Name: signextend
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


module signextend(
    input [14:0] imm,
    output [31:0] ext_imm
    );
    assign ext_imm = (imm[14]==0)?{17'b00000000000000000,imm}:{17'b11111111111111111,imm};
endmodule
