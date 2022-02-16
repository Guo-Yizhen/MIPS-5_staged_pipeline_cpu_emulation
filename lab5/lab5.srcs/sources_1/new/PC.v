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
    output [31:0] pc_out
    );
    reg [31:0] pc_Out;
    assign pc_out=pc_Out;
    always @ (posedge reset or negedge Clk ) begin
        if(reset!=1) pc_Out=pc_in;
        else pc_Out=0;
    end
endmodule
