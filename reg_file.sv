`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/25 15:56:41
// Design Name: 
// Module Name: reg_file
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


 module reg_file(
    input logic [5:0] RA1,
    input logic [5:0] RA2,
    input logic [5:0] WA,
    input logic [31:0] WD,
    input logic WE1,
    input logic clk,
    input logic rst,
    output logic [31:0] RD1,
    output logic [31:0] RD2
    );
   
    logic [31:0] Regmem [63:0];
    
  /*
    initial 
    begin
     for(int i = 0;i<64;i++) begin
        Regmem[i] <= 0;
     end
     end
*/

    assign RD1 = Regmem[RA1];
    assign RD2 = Regmem[RA2];
   // always @ ( posedge clk) begin
    always_ff @(posedge clk) begin
    
        if (rst) begin
         for(int i = 0;i<64;i++) begin
               Regmem[i] <= 0;
            end
        end     
        if (WE1)begin
            Regmem[WA] <= WD;
        end
    
    
    end
   
           

        
endmodule







// always
