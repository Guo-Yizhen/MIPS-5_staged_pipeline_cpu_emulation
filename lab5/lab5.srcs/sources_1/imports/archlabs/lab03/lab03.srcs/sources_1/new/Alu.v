`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/31 10:32:23
// Design Name: 
// Module Name: Alu
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


module Alu(
    input1,input2,aluCtr,zero,aluRes
    );
    input [31:0] input1;
    input [31:0] input2;
    input [3:0] aluCtr;
    output zero;
    output [31:0] aluRes;
    reg Zero;
    reg [31:0] ALURes;
    assign zero = Zero;
    assign aluRes =ALURes;
    
    always @(input1 or input2 or aluCtr)
    begin
        if(aluCtr ==4'b0010) 
            ALURes = input1 +input2;
        else if (aluCtr ==4'b0110)
        begin
            ALURes =input1 -input2;
            if(ALURes ==0)
                Zero=1;
            else
                Zero=0;
        end
        else if (aluCtr ==4'b0000)
        begin
            ALURes =input1 & input2;
            if(ALURes ==0)
                Zero=1;
            else
                Zero=0;
        end
        else if (aluCtr ==4'b0001)
        begin
            ALURes =input1 | input2;
            if(ALURes ==0)
                Zero=1;
            else
                Zero=0;
        end
        else if (aluCtr ==4'b0111)
        begin
            if(input1<input2 && input1[31]==input2[31]) 
             begin
                Zero=0;
                ALURes=1;
             end
            else
            begin
                if(input1[31]!=input2[31])
                begin
                    if(input1[31]==1)
                    begin
                    Zero=0;
                    ALURes =1;
                    end
                    
                    else
                    begin
                    Zero=1;
                    ALURes=0;
                    end
                end
                else
                begin
                    Zero=1;
                    ALURes=0;
                end
            end  
        end
        else if (aluCtr ==4'b1100)
        begin
            ALURes =~(input1 | input2);
            if(ALURes ==0)
                Zero=1;
            else
                Zero=0;

        end
        else if (aluCtr ==4'b1000)
        begin
            ALURes =input2<<input1;
            if(ALURes ==0)
                Zero=1;
            else
                Zero=0;

        end
        else if (aluCtr ==4'b1001)
        begin
            ALURes =input2>>input1;
            if(ALURes ==0)
                Zero=1;
            else
                Zero=0;

        end
    end
endmodule
