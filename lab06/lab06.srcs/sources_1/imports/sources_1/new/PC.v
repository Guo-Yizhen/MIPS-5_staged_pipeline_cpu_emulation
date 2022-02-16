`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/07 10:10:00
// Design Name: 
// Module Name: PC
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


module PC(
    input Clk,
    input reset,
    input [31:0] pc_in,
    output [31:0] pc_out,
    input STALL
    );
    reg [31:0] pco;
    assign pc_out=pco;
    always @ (posedge reset or negedge Clk ) begin
        if(STALL==1) pco=pc_in-1;
        else begin
        if(reset!=1) pco=pc_in;
        else pco=0;
        end
    end
endmodule
