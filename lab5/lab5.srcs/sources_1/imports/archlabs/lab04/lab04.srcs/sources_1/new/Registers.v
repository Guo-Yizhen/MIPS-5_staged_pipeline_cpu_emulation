`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/31 11:40:35
// Design Name: 
// Module Name: Registers
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


module Registers(
    input [25:21] readReg1,
    input [20:16] readReg2,
    input [4:0] writeReg,
    input [31:0] writeData,
    input Clk,
    input regWrite,
    input reset,
    output [31:0] readData1,
    output [31:0] readData2
    );
    reg [31:0] ReadData1;
    reg [31:0] ReadData2;
    reg [31:0] regFile[31:0];
    
        
    assign readData1 = ReadData1;
    assign readData2 = ReadData2;
    integer i;
    initial begin
        for(i=0;i<32;i=i+1) begin
          regFile[i]=0;        
        end
    end
   
    always @ (readReg1 or readReg2 or negedge Clk)
        begin
            ReadData1 = regFile[readReg1];
            ReadData2 = regFile[readReg2];     
        end
        
    always @ (negedge Clk or posedge reset)
        begin
            if(reset==1)
            begin
                for(i=0;i<32;i=i+1) begin
                    regFile[i]=0;        
                end
            end
            else
            begin
            if(regWrite==1)
            begin
                regFile[writeReg]= writeData;
            end
                
                ReadData1 = regFile[readReg1];
                ReadData2 = regFile[readReg2];
                
            end
        end
        
endmodule
