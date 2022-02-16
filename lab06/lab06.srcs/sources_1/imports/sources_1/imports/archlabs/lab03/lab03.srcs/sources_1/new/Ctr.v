`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/31 08:22:49
// Design Name: 
// Module Name: Ctr
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


module Ctr(
    input [5:0] OpCode,
    input [5:0] Funct,
    output regDst,
    output aluSrc,
    output memToReg,
    output regWrite,
    output memRead,
    output memWrite,
    output branch,
    output [2:0] aluOp,
    output jump,
    output jal
    );
    reg RegDst;
    reg ALUSrc;
    reg MemToReg;
    reg RegWrite;
    reg MemRead;
    reg MemWrite;
    reg Branch;
    reg [2:0] ALUOp;
    reg Jump;
    reg Jal=0;
    always @(OpCode)
    begin
        Jal=0;
        case(OpCode)
        6'b000000: //R type
        begin
            RegDst =1;
            ALUSrc =0;
            MemToReg =0;
            RegWrite =1;
            MemRead =0;
            MemWrite =0;
            Branch =0;
            ALUOp =3'b010;
            Jump =0;
        end
        6'b100011: //I lw type
        begin
            RegDst =0;
            ALUSrc =1;
            MemToReg =1;
            RegWrite =1;
            MemRead =1;
            MemWrite =0;
            Branch =0;
            ALUOp =3'b000;
            Jump =0;
        end
        6'b101011: //I sw type
        begin
            RegDst =0;
            ALUSrc =1;
            MemToReg =0;
            RegWrite =0;
            MemRead =0;
            MemWrite =1;
            Branch =0;
            ALUOp =3'b000;
            Jump =0;
        end
        6'b000100:  //I beq type
        begin
            RegDst =0;
            ALUSrc =0;
            MemToReg =0;
            RegWrite =0;
            MemRead =0;
            MemWrite =0;
            Branch =1;
            ALUOp =3'b001;
            Jump =0;
        end
        6'b001000:  //I addi type
        begin
            RegDst =0;
            ALUSrc =1;
            MemToReg =0;
            RegWrite =1;
            MemRead =0;
            MemWrite =0;
            Branch =0;
            ALUOp =3'b000;
            Jump =0;
        end
        6'b001100:  //I andi type
        begin
            RegDst =0;
            ALUSrc =1;
            MemToReg =0;
            RegWrite =1;
            MemRead =0;
            MemWrite =0;
            Branch =0;
            ALUOp =3'b100;
            Jump =0;
        end
        6'b001101:  //I ori type
        begin
            RegDst =0;
            ALUSrc =1;
            MemToReg =0;
            RegWrite =1;
            MemRead =0;
            MemWrite =0;
            Branch =0;
            ALUOp =3'b101;
            Jump =0;
        end
        6'b000010:  //J type
        begin
            RegDst =0;
            ALUSrc =0;
            MemToReg =0;
            RegWrite =0;
            MemRead =0;
            MemWrite =0;
            Branch =0;
            ALUOp =3'b000;
            Jump =1;
        end
        6'b000011:  //Jal type
        begin
            RegDst =0;
            ALUSrc =0;
            MemToReg =0;
            RegWrite =1;
            MemRead =0;
            MemWrite =0;
            Branch =0;
            ALUOp =3'b000;
            Jump =1;
            Jal=1;
        end
        default:
        begin
            RegDst =0;
            ALUSrc =0;
            MemToReg =0;
            RegWrite =0;
            MemRead =0;
            MemWrite =0;
            Branch =0;
            ALUOp =3'b000;
            Jump =0;
        end
    endcase
    end
    assign regDst =RegDst;
    assign aluSrc = ALUSrc;
    assign memToReg = MemToReg;
    assign regWrite = RegWrite;
    assign memRead = MemRead;
    assign memWrite = MemWrite;
    assign branch=Branch;
    assign aluOp=ALUOp;
    assign jump=Jump;
    assign jal=Jal;
   
endmodule
