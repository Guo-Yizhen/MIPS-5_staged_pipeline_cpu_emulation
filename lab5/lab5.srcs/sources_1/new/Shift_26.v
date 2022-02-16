`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/14 09:07:08
// Design Name: 
// Module Name: Shift_26
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


module Shift_26(
    input [25:0] in1,
    input [31:0] in2,
    output [31:0] out
    );
    reg [31:0] OUT; 
    assign out = OUT;
    always @ (in1 or in2) begin
    OUT = in2 & 32'b11110000000000000000000000000000;
    OUT =OUT + in1;
    end

endmodule
