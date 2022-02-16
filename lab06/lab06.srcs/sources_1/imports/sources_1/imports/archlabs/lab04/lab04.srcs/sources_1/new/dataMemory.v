`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/07 08:25:15
// Design Name: 
// Module Name: dataMemory
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


module dataMemory(
    input Clk,
    input [31:0] address,
    input [31:0] writeData,
    input memWrite,
    input memRead,
    input reset,
    output [31:0] readData
    );
    reg [31:0] memFile[0:5];
    reg [31:0]ReadData = 0;
    assign readData=ReadData;
    integer i;
    initial begin
        $readmemh("D:/archlabs/datamem.txt",memFile);
    end
    always@ (memRead or address or negedge Clk)
        begin
            if (memRead == 1)
                begin
                ReadData = memFile[address];
                end
        end
        
   always@ (negedge Clk )
        begin
            if (memWrite==1)
                begin
                memFile[address] = writeData;
                ReadData=0;
                end
            else if (memRead == 1)
                begin
                ReadData = memFile[address];
                end
        end
        
endmodule
