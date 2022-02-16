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
    
    wire [31:0] ins_0;
    wire [31:0] add_out_2_1;
    wire reg_write_2;
    wire mem_to_reg_2;
    wire mem_read_2;
    wire mem_write_2;
    wire branch_2;
    wire reg_dst_2;
    wire [2:0] alu_op_2;
    wire alu_src_2;
    wire [31:0] extend_data_1_2;
    wire [31:0] extend_data_2_2;   
    wire [4:0] arg1_2;
    wire [4:0] arg2_2;
    wire [4:0] arg3_2;
    wire [31:0] read_data_1_2;
    wire [31:0] read_data_2_2;
    wire [31:0] add_out_2_2;
    wire [31:0] shift_2_out_2;
    wire jump_2;
    wire jumpal_2;
    wire [4:0] mux_1_out_2;
    
    wire [31:0] extend_data_1_3;
    wire [31:0] extend_data_2_3;   
    wire [4:0] arg1_3;
    wire [4:0] arg2_3;
    wire [4:0] arg3_3;
    wire [31:0] read_data_1_3;
    wire [31:0] read_data_2_3;
    wire [31:0] add_out_2_3;
    wire [31:0] shift_2_out_3;
    wire jump_3;
    wire jumpal_3;
    wire jr_3;
    wire ZERO_3;
    wire [31:0] alu_res_3;
    wire [4:0] mux_1_out_3;
    wire reg_write_3;
    wire mem_to_reg_3;
    wire mem_read_3;
    wire mem_write_3;
    wire branch_3;
    wire [31:0] alu_2_res_3;
    
    wire [31:0] read_data_4;
    wire [31:0] alu_res_4;
    wire mem_to_reg_4;
    wire reg_write_4;
    wire jumpal_4;
    wire [4:0] arg1_4;
    wire [4:0] arg2_4;
    wire [4:0] arg3_4;
    wire [4:0] mux_1_out_4;
    wire [31:0] add_out_2_4;
    wire [31:0] mix_res_3;
    wire [31:0] read_data_1_2_o;
    wire [31:0] read_data_2_2_o;
    wire [31:0] new_data_1;
    wire [31:0] new_data_2;
    wire sel_new_1;
    wire sel_new_2;
    wire IF_ID_STALL;
    wire ID_EX_STALL;
    wire EX_MEM_EMPTY;
    wire EMPTY;
    
    PC pc(
        .reset(reset),
        .Clk(Clk),
        .pc_in(pc_in),
        .pc_out(pc_out),
        .STALL(IF_ID_STALL)
    );
    InstMemory Inst_Memory(
        .address(pc_out),
        .inst(ins_0)
    );
    Alu add(
        .input1(pc_out),
        .input2(1),
        .aluCtr(4'b0010),
        .aluRes(add_out)
    );
                                       //IF/ID
    IF_ID if_id(
        .add_res_in(add_out),
        .add_res_out(add_out_2_1),
        .inst_in(ins_0),
        .inst_out(ins),
        .IF_ID_STALL(IF_ID_STALL),
        .Clk(Clk),
        .reset(reset),
        .EMPTY(EMPTY)
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
        .writeReg(write_reg),      //from wb 
        .writeData(write_data),
        .regWrite(reg_write_4),
        .Clk(Clk),
        .reset(reset),
        .readData1(read_data_1),
        .readData2(read_data_2)
    );
    signext se(
        .inst (ins[15:0]),
        .data (extend_data_1)
    );
    signext_5_32 se_5_32(
        .inst (ins[10:6]),
        .data (extend_data_2)
    );
    Shift_26 shift_2(
        .in1(ins[25:0]),
        .in2(add_out_2_1),
        .out(shift_2_out)
    );
                                        //ID/EX
    ID_EX id_ex(
        .Clk(Clk),
        .reset(reset),
        .EMPTY(EMPTY),
        .ID_EX_STALL(ID_EX_STALL),
        .regwrite_in(reg_write),
        .memtoreg_in(mem_to_reg),
        .memread_in(mem_read),
        .memwrite_in(mem_write),
        .branch_in(branch),
        .regdes_in(reg_dst),
        .aluop_in(alu_op),
        .alusrc_in(alu_src),
        .data_extend_1_in(extend_data_1),
        .data_extend_2_in(extend_data_2),
        .arg1_in(ins[25:21]),
        .arg2_in(ins[20:16]),
        .arg3_in(ins[15:11]),
        .read_data_1_in(read_data_1),
        .read_data_2_in(read_data_2),
        .add_res_in(add_out_2_1),
        .jump_address_in(shift_2_out),
        .jump_in(jump),
        .jal_in(jumpal),
        
        .regwrite_out(reg_write_2),
        .memtoreg_out(mem_to_reg_2),
        .memread_out(mem_read_2),
        .memwrite_out(mem_write_2),
        .branch_out(branch_2),
        .regdes_out(reg_dst_2),
        .aluop_out(alu_op_2),
        .alusrc_out(alu_src_2),
        .data_extend_1_out(extend_data_1_2),
        .data_extend_2_out(extend_data_2_2),
        .arg1_out(arg1_2),
        .arg2_out(arg2_2),
        .arg3_out(arg3_2),
        .read_data_1_out(read_data_1_2),
        .read_data_2_out(read_data_2_2),
        .add_res_out(add_out_2_2),
        .jump_address_out(shift_2_out_2),
        .jump_out(jump_2),
        .jal_out(jumpal_2),
        
        .sel_1_new(sel_new_1),
        .sel_2_new(sel_new_2),
        .new_data_1(new_data_1),
        .new_data_2(new_data_2)
    );
    ALUCtr Alu_Control(
        .ALUOp(alu_op_2),
        .Funct(extend_data_1_2[5:0]),
        .aluCtrOut(alu_ctr_out),
        .alu_se(alu_se),
        .jr(jr)
    );
    Mux mux_1(
        .input0(arg2_2),
        .input1(arg3_2),
        .sel(reg_dst_2),
        .out(mux_1_out)
    );
    Mux mux_2(
        .input0(read_data_2_2),
        .input1(extend_data_1_2),
        .sel(alu_src_2),
        .out(mux_2_out)
    );
    Mux mux_readdata(
        .input0(read_data_1_2),
        .input1(extend_data_2_2),
        .sel(alu_se),
        .out(mux_se_out)
    );
    Alu alu_1(
        .input1(mux_se_out),
        .input2(mux_2_out),
        .aluCtr(alu_ctr_out),
        .zero(ZERO),
        .aluRes(alu_res)
    );
   Shift shift_1(
        .in(extend_data_1_2),
        .out(shift_out)
    );
    Alu alu_2(
        .input1(add_out_2_2),
        .input2(shift_out),
        .aluCtr(4'b0010),
        .aluRes(alu_2_res)
    );
    Mux mux_jal(
        .input0(mux_1_out),
        .input1(31),
        .sel(jumpal_2),
        .out(mux_1_out_2)
    );
                                                   //EM/MEM
    EX_MEM ex_mem(
         .Clk(Clk),
        .reset(reset),
        .EX_MEM_EMPTY(EX_MEM_EMPTY),
        .jump_in(jump_2),
        .jr_in(jr),
        .zero_in(ZERO),
        .alures_in(alu_res),
        .read_data_1_in(read_data_1_2),
        .read_data_2_in(read_data_2_2),
        .jump_address_in(shift_2_out_2),
        .mux_1_in(mux_1_out_2),
        .branch_in(branch_2),
        .memwrite_in(mem_write_2),
        .memread_in(mem_read_2),
        .regwrite_in(reg_write_2),
        .memtoreg_in(mem_to_reg_2),
        .add_res_in(add_out_2_2),
        .addres_in(alu_2_res),
        .arg1_in(arg1_2),
        .arg2_in(arg2_2),
        .arg3_in(arg3_2),
        .jal_in(jumpal_2),
        
        .jump_out(jump_3),
        .jr_out(jr_3),
        .zero_out(ZERO_3),
        .alures_out(alu_res_3),
        .read_data_1_out(read_data_1_3),
        .read_data_2_out(read_data_2_3),
        .jump_address_out(shift_2_out_3),
        .mux_1_out(mux_1_out_3),
        .branch_out(branch_3),
        .memwrite_out(mem_write_3),
        .memread_out(mem_read_3),
        .regwrite_out(reg_write_3),
        .memtoreg_out(mem_to_reg_3),
        .add_res_out(add_out_2_3),
        .addres_out(alu_2_res_3),
        .arg1_out(arg1_3),
        .arg2_out(arg2_3),
        .arg3_out(arg3_3),
        .jal_out(jumpal_3)
    );
    Mux mux_jr(
        .input0(mux_5_out),
        .input1(read_data_1_3),
        .sel(jr_3),
        .out(pc_in)
    );
    dataMemory Data_Memory(
        .Clk(Clk),
        .address(alu_res_3),
        .writeData(read_data_2_3),
        .memWrite(mem_write_3),
        .memRead(mem_read_3),
        .readData(read_data),
        .reset(reset)
    );
    ANDgate and_gate(
        .input0(ZERO_3),
        .input1(branch_3),
        .out(and_out)
    );
    Mux mux_4(
        .input0(add_out),            //要使用新的add out
        .input1(alu_2_res_3),
        .sel(and_out),
        .out(mux_4_out)
    );
    Mux mux_5(
        .input0(mux_4_out),
        .input1(shift_2_out_3),
        .sel(jump_3),
        .out(mux_5_out)
    );
    Mux alures_jal(
        .input0(alu_res_3),
        .input1(add_out_2_3),
        .sel(jumpal_3),
        .out(mix_res_3)
    );
                               //MEM_WB
    MEM_WB mem_wb(
        .Clk(Clk),
        .reset(reset),
        .read_data_in(read_data),
        .alures_in(mix_res_3),
        .memtoreg_in(mem_to_reg_3),
        .regwrite_in(reg_write_3),
        .jal_in(jumpal_3),
        .arg1_in(arg1_3),
        .arg2_in(arg2_3),
        .arg3_in(arg3_3),
        .mux_1_in(mux_1_out_3),
        .add_res_in(add_out_2_3),
        
        .read_data_out(read_data_4),
        .alures_out(alu_res_4),
        .memtoreg_out(mem_to_reg_4),
        .regwrite_out(reg_write_4),
        .jal_out(jumpal_4),
        .arg1_out(arg1_4),
        .arg2_out(arg2_4),
        .arg3_out(arg3_4),
        .mux_1_out(write_reg),
        .add_res_out(add_out_2_4)
    );
    Mux mux_3(
        .input0(alu_res_4),
        .input1(read_data_4),
        .sel(mem_to_reg_4),
        .out(mux_3_out)
    );
    
    Mux jal_pc(
        .input0(mux_3_out),
        .input1(add_out_2_4),
        .out(write_data),
        .sel(jumpal_4)
    );
    
     
    Forward_unit f_u(
        .Clk(Clk), 
        .reg_read_add_1(arg1_2),
        .reg_read_add_2(arg2_2),
        .reg_write_add_WB(write_reg),
        .reg_write_data_WB(write_data),
        .reg_write_add_MEM(mux_1_out_3),
        .reg_write_data_MEM(mix_res_3),
        .regwrite_WB(reg_write_4),
        .regwrite_MEM(reg_write_3),
        .memread_MEM(mem_read_3),
        .new_read_data_1(new_data_1),
        .new_read_data_2(new_data_2),
        .sel_1_new(sel_new_1),
        .sel_2_new(sel_new_2),
        .ID_EX_STALL(ID_EX_STALL),
        .IF_ID_STALL(IF_ID_STALL),
        .EX_MEM_EMPTY(EX_MEM_EMPTY),
        .EMPTY(EMPTY),
        .jump(jump_3),
        .jal(jumpal_3),
        .jr(jr_3),
        .beq(and_out)
    );
    
    
    
endmodule




