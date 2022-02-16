`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/22 11:32:24
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(
    input Clk,
    input reset,
    input [31:0] inst_in,
    input [31:0] add_res_in,
    input IF_ID_STALL,
    input EMPTY,
    output [31:0] inst_out,
    output [31:0] add_res_out
    );
    reg [31:0] INST_out;
    reg [31:0]ADD_res_out;
    assign inst_out=INST_out;
    assign add_res_out=ADD_res_out;
    
    always @ (negedge Clk) begin
      
        if(IF_ID_STALL==0)begin
                ADD_res_out=add_res_in;
                INST_out=inst_in;
        end
    end
    
    always @ (reset or posedge EMPTY)begin
        ADD_res_out=0;
        INST_out=0;
    end
    
endmodule
