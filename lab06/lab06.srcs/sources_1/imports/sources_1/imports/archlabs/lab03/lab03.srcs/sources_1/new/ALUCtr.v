`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/31 09:46:16
// Design Name: 
// Module Name: ALUCtr
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


module ALUCtr(
    input [2:0] ALUOp,
    input [5:0] Funct,
    output [3:0] aluCtrOut,
    output alu_se,
    output jr
    );
    reg [3:0] ALUCtrOut;
    reg ALUSe=0;
    reg ALU_1_sel=0;
    reg JR=0;
    assign aluCtrOut = ALUCtrOut;
    assign alu_se=ALUSe;
    assign jr=JR;
    always @ (ALUOp or Funct )
    begin
        ALUSe=0;
        JR=0;
        casex ({ALUOp,Funct})
            9'b000xxxxxx : ALUCtrOut = 4'b0010;  //+  lw sw addi
            9'b100xxxxxx : ALUCtrOut = 4'b0000;  //&   andi   
            9'b101xxxxxx : ALUCtrOut = 4'b0001;  //| ori   
            9'b010001000 : 
            begin
            ALUCtrOut = 4'b0000;  //& jr
            JR=1;
            end
            9'b0x1xxxxxx : ALUCtrOut = 4'b0110;  //-
            9'b010100000 : ALUCtrOut = 4'b0010;  //+
            9'b010100010 : ALUCtrOut = 4'b0110;  //-
            9'b010100100 : ALUCtrOut = 4'b0000;  //&
            9'b010100101 : ALUCtrOut = 4'b0001;  //|
            9'b010101010 : ALUCtrOut = 4'b0111;  //slt
            9'b010000000 :
            begin
            ALUCtrOut = 4'b1000;  //sll
            ALUSe=1;
            end
            9'b010000010 :
            begin
            ALUCtrOut = 4'b1001;  //srl
            ALUSe=1;
            end
        endcase
    end
endmodule
