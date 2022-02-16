`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/07 10:06:11
// Design Name: 
// Module Name: InstMemory
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


module InstMemory(
    input [31:0] address,
    output [31:0] inst
    );
    reg [31:0] instructions [0:23];
    assign inst=instructions[address];
    initial begin
    $readmemb("D:/archlabs/test2.txt",instructions); //Â·¾¶Ã»Ð´
    end
endmodule
