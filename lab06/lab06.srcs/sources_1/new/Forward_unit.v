`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/28 04:24:04
// Design Name: 
// Module Name: Forward_unit
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


module Forward_unit(
    input Clk,
    input jump,
    input jr,
    input jal,
    input beq,
    input [4:0] reg_read_add_1,
    input [4:0] reg_read_add_2,
    input [4:0] reg_write_add_WB,
    input [31:0] reg_write_data_WB,
    input regwrite_WB,
    input [4:0] reg_write_add_MEM,
    input [31:0] reg_write_data_MEM,
    input memread_MEM,                   //add_hit & memread & regwrite 则要stall一周期   只regwrite则回传
    input regwrite_MEM,
    output reg [31:0] new_read_data_1,
    output reg [31:0] new_read_data_2,
    output reg sel_1_new,
    output reg sel_2_new,
    output reg ID_EX_STALL=0,
    output reg IF_ID_STALL=0,
    output reg EX_MEM_EMPTY=0,
    output reg EMPTY=0
    );
    
    always @(reg_read_add_1 or reg_read_add_2 or negedge Clk) begin
        sel_1_new=0;
        sel_2_new=0;
        ID_EX_STALL=0;
        IF_ID_STALL=0;
        EX_MEM_EMPTY=0;
        EMPTY=0;
        # 10
        if(jump==1 || jal==1 || jr==1 || beq==1) begin
            EMPTY=1;
            EX_MEM_EMPTY=1;
        end
        else begin
        if(reg_read_add_1==reg_write_add_WB && regwrite_WB==1 && reg_read_add_1!=0)begin
                new_read_data_1=reg_write_data_WB;
                sel_1_new=1;
        end
        if(reg_read_add_2==reg_write_add_WB && regwrite_WB==1 && reg_read_add_2!=0)begin
                new_read_data_2=reg_write_data_WB;
                sel_2_new=1;
        end

        if(reg_read_add_1==reg_write_add_MEM && regwrite_MEM==1 && reg_read_add_1!=0)begin
                if(memread_MEM==1)begin
                    ID_EX_STALL=1;    
                    IF_ID_STALL=1;   
                    EX_MEM_EMPTY=1;   //清空ex_mem
                end
                else begin
                    new_read_data_1=reg_write_data_MEM;
                    sel_1_new=1;
                end
            end
        if(reg_read_add_2==reg_write_add_MEM && regwrite_MEM==1 && reg_read_add_2!=0 )begin
            if(memread_MEM==1)begin
                ID_EX_STALL=1;
                IF_ID_STALL=1;
                EX_MEM_EMPTY=1;
            end
            else begin
                new_read_data_2=reg_write_data_MEM;
                sel_2_new=1;
            end
        end
        end
    end
endmodule
