`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/14 09:27:49
// Design Name: 
// Module Name: Mux
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


module Mux(
    input [31:0] input0,
    input [31:0] input1,
    input sel,
    output [31:0] out
    );
    reg [31:0] OUT;
    assign out = OUT;
    always @ (input1 or input0 or sel) begin
        if(sel==1) OUT = input1;
        else OUT =input0;
    end
     
endmodule
