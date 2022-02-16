`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/22 11:45:09
// Design Name: 
// Module Name: EX_MEM
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


module EX_MEM(
    input Clk,
    input reset,
    input EX_MEM_EMPTY,
    input regwrite_in,
    input memtoreg_in,
    input memread_in,
    input memwrite_in,
    input branch_in,
    input [31:0] addres_in,
    input [31:0] add_res_in,
    input [31:0] alures_in,
    input zero_in,
    input [31:0] read_data_2_in,
    input [31:0] read_data_1_in,
    input [4:0] mux_1_in,
    input [4:0] arg1_in,
    input [4:0] arg2_in,
    input [4:0] arg3_in,
    input [31:0] jump_address_in,
    input jump_in,
    input jr_in,
    input jal_in,
        
    output regwrite_out,
    output memtoreg_out,
    output memread_out,
    output memwrite_out,
    output branch_out,
    output [31:0] addres_out,
    output [31:0] add_res_out,
    output [31:0] alures_out,
    output zero_out,
    output [31:0] read_data_2_out,
    output [31:0] read_data_1_out,    
    output [4:0] mux_1_out,
    output [4:0] arg1_out,
    output [4:0] arg2_out,
    output [4:0] arg3_out,
    output [31:0] jump_address_out,
    output jump_out,
    output jr_out,
    output jal_out
    );
    
    reg Regwrite_out;
    reg Memtoreg_out;
    reg Memread_out;
    reg Memwrite_out;
    reg Branch_out;
    reg [31:0] Addres_out;
    reg [31:0] Add_res_out;
    reg [31:0] Alures_out;
    reg Zero_out;
    reg [31:0] Read_data_2_out;
    reg [31:0] Read_data_1_out;
    reg [4:0] Mux_1_out;
    reg [4:0] Arg1_out;
    reg [4:0] Arg2_out;
    reg [4:0] Arg3_out;
    reg [31:0] Jump_address_out;
    reg Jump_out;
    reg Jr_out;
    reg Jal_out;
    
    assign regwrite_out=Regwrite_out;
    assign memtoreg_out=Memtoreg_out;
    assign memread_out=Memread_out;
    assign memwrite_out=Memwrite_out;
    assign branch_out=Branch_out;
    assign addres_out=Addres_out;
    assign add_res_out=Add_res_out;
    assign alures_out=Alures_out;
    assign zero_out=Zero_out;
    assign read_data_2_out=Read_data_2_out;
    assign read_data_1_out=Read_data_1_out;
    assign mux_1_out=Mux_1_out;
    assign arg1_out=Arg1_out;
    assign arg2_out=Arg2_out;
    assign arg3_out=Arg3_out;
    assign jump_address_out=Jump_address_out;
    assign jump_out=Jump_out;
    assign jr_out=Jr_out;
    assign jal_out=Jal_out;
    
    always @ (negedge Clk) begin
     
        if(EX_MEM_EMPTY==0)begin
        Regwrite_out=regwrite_in;
        Memtoreg_out=memtoreg_in;
        Memread_out= memread_in;
        Memwrite_out=memwrite_in;
        Branch_out=branch_in;
        Addres_out= addres_in;
        Add_res_out= add_res_in;
        Alures_out=alures_in;
        Zero_out=zero_in;
        Read_data_2_out=read_data_2_in;
        Read_data_1_out=read_data_1_in;
        Mux_1_out=mux_1_in;
        Arg1_out=arg1_in;
        Arg2_out=arg2_in;
        Arg3_out=arg3_in;
        Jump_address_out=jump_address_in;
        Jump_out=jump_in;
        Jr_out=jr_in;
        Jal_out=jal_in;
        end
        
        else begin
        Regwrite_out=0;
        Memtoreg_out=0;
        Memread_out= 0;
        Memwrite_out=0;
        Branch_out=0;
        Addres_out= 0;
        Add_res_out= 0;
        Alures_out=0;
        Zero_out=0;
        Read_data_2_out=0;
        Read_data_1_out=0;
        Mux_1_out=0;
        Arg1_out=0;
        Arg2_out=0;
        Arg3_out=0;
        Jump_address_out=0;
        Jump_out=0;
        Jr_out=0;
        Jal_out=0;
        end
    end
    
    always @ (reset)begin
        Regwrite_out=0;
        Memtoreg_out=0;
        Memread_out= 0;
        Memwrite_out=0;
        Branch_out=0;
        Addres_out= 0;
        Add_res_out= 0;
        Alures_out=0;
        Zero_out=0;
        Read_data_2_out=0;
        Read_data_1_out=0;
        Mux_1_out=0;
        Arg1_out=0;
        Arg2_out=0;
        Arg3_out=0;
        Jump_address_out=0;
        Jump_out=0;
        Jr_out=0;
        Jal_out=0;
    end
endmodule
