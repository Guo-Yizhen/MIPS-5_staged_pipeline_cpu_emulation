`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/27 21:01:03
// Design Name: 
// Module Name: MEM_WB
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


module MEM_WB(
    input Clk,
    input reset,
    
    input [31:0] read_data_in,
    input [31:0] alures_in,
    input memtoreg_in,
    input regwrite_in,
    input [4:0] arg1_in,
    input [4:0] arg2_in,
    input [4:0] arg3_in,
    input [4:0] mux_1_in,
    input jal_in,
    input [31:0] add_res_in,
    
    output memtoreg_out,
    output regwrite_out,
    output [31:0] read_data_out,
    output [31:0] alures_out,
    output [4:0] arg1_out,
    output [4:0] arg2_out,
    output [4:0] arg3_out,
    output [4:0] mux_1_out,
    output jal_out,
    output [31:0] add_res_out
    
    );
    
    reg Memtoreg_out;
    reg Regwrite_out;
    reg [31:0] Read_data_out;
    reg [31:0] Alures_out;
    reg [4:0] Arg1_out;
    reg [4:0] Arg2_out;
    reg [4:0] Arg3_out;
    reg [4:0] Mux_1_out;
    reg Jal_out;
    reg [31:0] Add_res_out;
    
    assign memtoreg_out=Memtoreg_out;
    assign regwrite_out=Regwrite_out;
    assign read_data_out=Read_data_out;
    assign alures_out=Alures_out;
    assign arg1_out=Arg1_out;
    assign arg2_out=Arg2_out;
    assign arg3_out=Arg3_out;
    assign mux_1_out=Mux_1_out;
    assign jal_out=Jal_out;
    assign add_res_out=Add_res_out;
    
    always @ (negedge Clk) begin
        Memtoreg_out=memtoreg_in;
        Regwrite_out=regwrite_in;
        Read_data_out=read_data_in;
        Alures_out=alures_in;
        Arg1_out=arg1_in;
        Arg2_out=arg2_in;
        Arg3_out=arg3_in;
        Mux_1_out=mux_1_in;
        Jal_out=jal_in;
        Add_res_out=add_res_in;
        
    end
    
    always @ (reset)begin
        Memtoreg_out=0;
        Regwrite_out=0;
        Read_data_out=0;
        Alures_out=0;
        Arg1_out=0;
        Arg2_out=0;
        Arg3_out=0;
        Mux_1_out=0;
        Jal_out=0;
        Add_res_out=0;

    end
endmodule
