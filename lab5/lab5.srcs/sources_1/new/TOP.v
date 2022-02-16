`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/07 10:45:14
// Design Name: 
// Module Name: TOP
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


module TOP(
    input Clk,
    input reset
    );
    //pc
    wire [31:0] pc_in;
    wire [31:0] pc_out;
    //Control
    wire reg_dst;
    wire jump;
    wire branch;
    wire mem_read;
    wire mem_to_reg;
    wire mem_write;
    wire alu_src;
    wire reg_write;
    wire [2:0] alu_op;
    wire alu_se;
    wire jumpal;
    //Inst_Memory
    wire [31:0] ins;
    //Data_memory
    wire [31:0] read_data;
    //alu_1
    wire ZERO;
    wire [31:0] alu_res;
    //Alu_Control
    wire [3:0] alu_ctr_out;
    //Register
    wire [31:0] read_data_1;
    wire [31:0] read_data_2;
    wire [31:0] read_data_alu;
    wire alu_1_sel;
    //signext
    wire [31:0] extend_data;
    wire [31:0] extend_data_1;
    wire [31:0] extend_data_2;
    wire [31:0] mux_se_out;
    //other
    wire [4:0] mux_1_out;
    wire [31:0] mux_3_out;
    wire [31:0] mux_5_out;
    wire jr;
    wire [31:0] shift_out;
    wire [31:0] write_data;
    wire [4:0] write_reg;
    wire [31:0] add_out;
    wire [31:0] alu_2_res;
    wire [31:0] mux_2_out;
    wire [31:0] mux_4_out;
    wire and_out;
    wire [31:0] shift_2_out;
    
    PC pc(
        .reset(reset),
        .Clk(Clk),
        .pc_in(pc_in),
        .pc_out(pc_out)
    );
    InstMemory Inst_Memory(
        .address(pc_out),
        .inst(ins)
    );
    Ctr Control(
        .OpCode(ins[31:26]),
        .Funct(ins[5:0]), 
        .regDst(reg_dst), 
        .aluSrc(alu_src), 
        .memToReg(mem_to_reg), 
        .regWrite(reg_write), 
        .memRead(mem_read), 
        .memWrite(mem_write), 
        .branch(branch), 
        .aluOp(alu_op), 
        .jump(jump),
        .jal(jumpal)
    );
    Registers Register(
        .readReg1(ins[25:21]),
        .readReg2(ins[20:16]),
        .writeReg(write_reg),
        .writeData(write_data),
        .regWrite(reg_write),
        .Clk(Clk),
        .reset(reset),
        .readData1(read_data_1),
        .readData2(read_data_2)
    );
    ALUCtr Alu_Control(
        .ALUOp(alu_op),
        .Funct(ins[5:0]),
        .aluCtrOut(alu_ctr_out),
        .alu_se(alu_se),
        .jr(jr)
    );
    Mux mux_jr(
        .input0(mux_5_out),
        .input1(read_data_1),
        .sel(jr),
        .out(pc_in)
    );
    Alu alu_1(
        .input1(read_data_alu),
        .input2(mux_2_out),
        .aluCtr(alu_ctr_out),
        .zero(ZERO),
        .aluRes(alu_res)
    );
    signext se(
        .inst (ins[15:0]),
        .data (extend_data_1)
    );
    signext_5_32 se_5_32(
        .inst (ins[10:6]),
        .data (extend_data_2)
    );
//    Mux mux_readdata(
//        .input0(read_data_1),
//        .input1(read_data_2),
//        .sel(alu_1_sel),
//        .out(read_data_alu)
//    );
    Mux mux_se(
        .input0(read_data_1),
        .input1(extend_data_2),
        .sel(alu_se),
        .out(read_data_alu)
    );
    Mux mux_2(
        .input0(read_data_2),
        .input1(extend_data_1),
        .sel(alu_src),
        .out(mux_2_out)
    );
    Mux mux_1(
        .input0(ins[20:16]),
        .input1(ins[15:11]),
        .sel(reg_dst),
        .out(mux_1_out)
    );
    Mux mux_jal(
        .input0(mux_1_out),
        .input1(31),
        .sel(jumpal),
        .out(write_reg)
    );
    
    dataMemory Data_Memory(
        .Clk(Clk),
        .address(alu_res),
        .writeData(read_data_2),
        .memWrite(mem_write),
        .memRead(mem_read),
        .readData(read_data),
        .reset(reset)
    );
    Mux mux_3(
        .input0(alu_res),
        .input1(read_data),
        .sel(mem_to_reg),
        .out(mux_3_out)
    );
    ANDgate and_gate(
        .input0(ZERO),
        .input1(branch),
        .out(and_out)
    );
    Shift shift_1(
        .in(extend_data_1),
        .out(shift_out)
    );
    Alu add(
        .input1(pc_out),
        .input2(1),
        .aluCtr(4'b0010),
        .aluRes(add_out)
    );
    Mux jal_pc(
        .input0(mux_3_out),
        .input1(add_out),
        .out(write_data),
        .sel(jumpal)
    );
    Alu alu_2(
        .input1(add_out),
        .input2(shift_out),
        .aluCtr(4'b0010),
        .aluRes(alu_2_res)
    );
    Mux mux_4(
        .input0(add_out),
        .input1(alu_2_res),
        .sel(and_out),
        .out(mux_4_out)
    );
    Shift_26 shift_2(
        .in1(ins[25:0]),
        .in2(add_out),
        .out(shift_2_out)
    );
    Mux mux_5(
        .input0(mux_4_out),
        .input1(shift_2_out),
        .sel(jump),
        .out(mux_5_out)
    );
    
endmodule




