`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/21 08:53:27
// Design Name: 
// Module Name: signext_5_32
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


module signext_5_32(
    input [4:0] inst,
    output [31:0] data
    );
    reg [31:0] Data;
    assign data=Data;
    integer i;
    always@(inst)
    begin
        for(i=5;i<32;i=i+1)
        begin
            Data[i]=0;
        end
        for(i=0;i<5;i=i+1)
        begin
            Data[i]=inst[i];
        end
    end
endmodule
