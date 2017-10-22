`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2016/11/25 16:18:06
// Design Name: 
// Module Name: datamemory
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


module datamemory(
    input logic [31:0] address,
    input logic [31:0] writedata,
    input logic WE2,
    //input logic rst,
    input logic clk,
    output logic [31:0] readdata
    );
    
    logic [31:0]datam[127:0];

   logic [6:0] temp ;
   assign temp = address[6:0];
   /*
    always_comb begin
    
        if (WE2) begin
            datam[temp]=writedata;
            readdata=address;
        end
        else begin
            readdata=datam[temp];
        end
    end  */
    
    
        always_latch  begin
        
              /*  if (rst) begin
                    for(int i = 0; i < 128; i++) begin
                                datam[i] <= 0;
                            end
                end else begin
               */ 
                 if (WE2) begin
                           datam[temp]<=writedata;
                           readdata<=address;
                       end
                       else begin
                           readdata<=datam[temp];
                       end
            end
            //end

endmodule
