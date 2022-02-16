`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/07 09:25:15
// Design Name: 
// Module Name: signext
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


module signext(
    input [15:0] inst,
    output [31:0] data
    );
    reg [31:0] Data;
    assign data=Data;
    integer i;
    always@(inst)
    begin
        if(inst[15]==1)
            begin
                for(i=16;i<32;i=i+1)
                begin
                    Data[i]=1;
                end
                for(i=0;i<16;i=i+1)
                begin
                    Data[i]=inst[i];
                end
            end
        else
            begin
                for(i=16;i<32;i=i+1)
                begin
                    Data[i]=0;
                end
                for(i=0;i<16;i=i+1)
                begin
                    Data[i]=inst[i];
                end
            end
    end
endmodule
