`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/22 11:45:44
// Design Name: 
// Module Name: ID_EX
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


module ID_EX(
    input Clk,
    input reset,
    input ID_EX_STALL,
    input EMPTY,
    input [31:0] read_data_1_in,
    input [31:0] read_data_2_in,
    input [31:0] data_extend_1_in,
    input [31:0] data_extend_2_in,
    input branch_in,
    input regdes_in,
    input memwrite_in,
    input memread_in,
    input memtoreg_in,
    input regwrite_in,
    input [2:0] aluop_in,
    input alusrc_in,
    input [31:0] add_res_in,
    input [4:0] arg1_in,
    input [4:0] arg2_in,
    input [4:0] arg3_in,
    input [31:0] jump_address_in,
    input jump_in,
    input jal_in,
    
    output [31:0] read_data_1_out,
    output [31:0] read_data_2_out,
    output [31:0] data_extend_1_out,
    output [31:0] data_extend_2_out,
    output memwrite_out,
    output memread_out,
    output memtoreg_out,
    output regwrite_out,
    output branch_out,
    output regdes_out,
    output [2:0] aluop_out,
    output alusrc_out,
    output [31:0] add_res_out,
    output [4:0] arg1_out,
    output [4:0] arg2_out,
    output [4:0] arg3_out,
    output [31:0] jump_address_out,
    output jump_out,
    output jal_out,
    
    input sel_1_new,
    input sel_2_new,
    input [31:0] new_data_1,
    input [31:0] new_data_2
    );
    reg [31:0] Read_data_1_out;
    reg [31:0] Read_data_2_out;
    reg [31:0] Data_extend_1_out;
    reg [31:0] Data_extend_2_out;
    reg Memwrite_out;
    reg Memread_out;
    reg Memtoreg_out;
    reg Regwrite_out;
    reg Branch_out;
    reg Regdes_out;
    reg [2:0] Aluop_out;
    reg Alusrc_out;
    reg [31:0] Add_res_out;
    reg [4:0] Arg1_out;
    reg [4:0] Arg2_out;
    reg [4:0] Arg3_out;
    reg [31:0] Jump_address_out;
    reg Jump_out;
    reg Jal_out;

    assign read_data_2_out=Read_data_2_out;
    assign read_data_1_out= Read_data_1_out;
    assign data_extend_1_out=Data_extend_1_out;
    assign data_extend_2_out=Data_extend_2_out;
    assign memwrite_out= Memwrite_out;
    assign memread_out= Memread_out;
    assign memtoreg_out=Memtoreg_out;
    assign regwrite_out=Regwrite_out;
    assign branch_out=Branch_out;
    assign regdes_out=Regdes_out;
    assign aluop_out=Aluop_out;
    assign alusrc_out=Alusrc_out;
    assign add_res_out=Add_res_out;
    assign arg1_out=Arg1_out;
    assign arg2_out= Arg2_out;
    assign arg3_out=Arg3_out;
    assign jump_address_out=Jump_address_out;
    assign jump_out=Jump_out;
    assign jal_out=Jal_out;
    
    always @ (negedge Clk) begin
        if(ID_EX_STALL==0) begin       
        Read_data_2_out=read_data_2_in;
        Read_data_1_out= read_data_1_in;
        Data_extend_1_out=data_extend_1_in;
        Data_extend_2_out=data_extend_2_in;        
        Memwrite_out=memwrite_in;
        Memread_out=memread_in;
        Memtoreg_out=memtoreg_in;
        Regwrite_out=regwrite_in;
        Branch_out=branch_in;
        Regdes_out=regdes_in;
        Aluop_out=aluop_in;
        Alusrc_out=alusrc_in;
        Add_res_out=add_res_in;
        Arg1_out=arg1_in;
        Arg2_out=arg2_in;
        Arg3_out=arg3_in;
        Jump_address_out=jump_address_in;
        Jump_out=jump_in;
        Jal_out=jal_in;
        end

    end
    
    always @(posedge sel_1_new) begin
        Read_data_1_out=new_data_1;
    end
    
    always @(posedge sel_2_new) begin
        Read_data_2_out=new_data_2;
    end
    
    always @ (reset or posedge EMPTY)begin
        Read_data_2_out=0;
        Read_data_1_out= 0;
        Data_extend_1_out=0;
        Data_extend_2_out=0;
        Branch_out=0;
        Regdes_out=0;
        Aluop_out=0;
        Alusrc_out=0;
        Memwrite_out=0;
        Memread_out=0;
        Memtoreg_out=0;
        Regwrite_out=0;
        Add_res_out=0;
        Arg1_out=0;
        Arg2_out=0;
        Arg3_out=0;
        Jump_address_out=0;
        Jump_out=0;
        Jal_out=0;
    end
endmodule
