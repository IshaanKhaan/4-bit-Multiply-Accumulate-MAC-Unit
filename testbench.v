`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2025 19:50:02
// Design Name: 
// Module Name: Maclab9again_tb
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
module Maclab9again_tb;
    reg [3:0] A, B;
    reg clk, rst;
    wire [7:0]Z_full;
    wire [3:0] Z_trunc;
    Maclab9again DUT (.A(A), .B(B), .clk(clk), .rst(rst),.Z_full(Z_full),.Z_trunc(Z_trunc));
    always #5 clk = ~clk;
    initial begin
        clk = 1;
        rst = 1;
        A = 0; B = 0;
       #10 rst = 0; 
        #10 A = 2; B = 3;
        #10 A = 1; B = 4;
        #10 A = 3; B = 2;
        #10 A = 2; B = 2;
        #10 A = 0; B = 0;
        #10 rst = 1;
        #10 rst = 0;
        #10 A = 1; B = 5;        
        #20 $stop;
    end
endmodule
