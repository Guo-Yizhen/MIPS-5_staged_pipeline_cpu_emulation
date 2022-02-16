`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/14 09:57:08
// Design Name: 
// Module Name: TOP_tb
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


module TOP_tb(
    );
    reg Clk;
    reg reset;
    TOP u0(
        .Clk(Clk),
        .reset(reset)
    );
    parameter PERIOD=100;
    always #(PERIOD) Clk = !Clk;
    initial begin
        Clk =1'b0;
        reset =1;
        #50 
        reset=0;
        
        //#580;   reset = 1'b1;
    end
endmodule
