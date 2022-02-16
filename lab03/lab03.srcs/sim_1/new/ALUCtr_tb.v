`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/31 10:05:32
// Design Name: 
// Module Name: ALUCtr_tb
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


module ALUCtr_tb(
    );
    reg [1:0] ALUOp;
    reg [5:0] Funct;
    wire [3:0] aluCtrOut;
    
    ALUCtr u0(
    .ALUOp(ALUOp),
    .Funct(Funct),
    .aluCtrOut(aluCtrOut)
    );
    initial begin
        Funct=6'b000000;        //lw & sw
        ALUOp=2'b00;
        #100 Funct=6'b000000;   //beq
        ALUOp=2'b01;
        #100 Funct=6'b100000;   //add
        ALUOp=2'b10;
        #100 Funct=6'b100010;   //subtract
        ALUOp=2'b10;
        #100 Funct=6'b100100;   //and
        ALUOp=2'b10;
        #100 Funct=6'b100101;   //or
        ALUOp=2'b10;
        #100 Funct=6'b101010;   //slt
        ALUOp=2'b10;;
    end
endmodule
