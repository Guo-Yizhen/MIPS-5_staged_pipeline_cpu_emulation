`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/31 10:56:07
// Design Name: 
// Module Name: Alu_tb
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


module Alu_tb(
    );
    reg [31:0] input1;
    reg [31:0] input2;
    reg [3:0] aluCtr;
    wire zero;
    wire [31:0] aluRes;
    
    Alu u0(
    .input1(input1),
    .input2(input2),
    .aluCtr(aluCtr),
    .zero(zero),
    .aluRes(aluRes)
    );
    
    initial begin
            aluCtr=4'b0000;
            input1=0;
            input2=0;
            #100 aluCtr=4'b0000;
            input1=15;
            input2=10;
            #100 aluCtr=4'b0001;
            input1=15;
            input2=10;
            #100 aluCtr=4'b0010;
            input1=15;
            input2=10;
            #100 aluCtr=4'b0110;
            input1=15;
            input2=10;
            #100 aluCtr=4'b0110;
            input1=10;
            input2=15;
            #100 aluCtr=4'b0111;
            input1=15;
            input2=10;
            #100 aluCtr=4'b0111;
            input1=10;
            input2=15;
            #100 aluCtr=4'b1100;
            input1=1;
            input2=1;
            #100 aluCtr=4'b1100;
            input1=16;
            input2=1;
    end
endmodule
