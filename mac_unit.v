`timescale 1ns / 1ps
module Maclab9again(
    input  signed [3:0] A, 
    input  signed [3:0] B, 
    input  clk, 
    input  rst,
    output signed [7:0] Z_full,
    output signed [3:0] Z_trunc   
);
    wire signed [7:0] M, P, R;
    
       mult u2 (.mul1(A), .mul2(B), .prod(M));
    addr u1 (.add_in(M), .add_in2(P), .add_out(R));
    accm u3 (.clk(clk), .rst(rst), .accm_in(R), .accm_out(P));
     assign Z_full = P;              
    assign Z_trunc = Z_full[6:3];    
endmodule
module addr(
    input  signed [7:0] add_in,
    input  signed [7:0] add_in2,
    output signed [7:0] add_out
);
    assign add_out = add_in + add_in2;
endmodule
module mult(
    input  signed [3:0] mul1,
    input  signed [3:0] mul2,
    output signed [7:0] prod
);
    assign prod = mul1 * mul2;
endmodule
module accm(
    input clk,
    input rst,
    input  signed [7:0] accm_in,
    output reg signed [7:0] accm_out
);
    always @(posedge clk) begin
        if (rst)
            accm_out <= 0;
        else
            accm_out <= accm_in;
    end
endmodule
