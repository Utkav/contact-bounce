`timescale 1ns / 1ps
module counter #(MODULE = 4, STEP = 1) (
    input clk,
    input reset,
    input enable,
    input dir,
    output reg [$clog2(MODULE)-1:0] cnt);

initial cnt = 0;

always@(posedge clk or posedge reset) begin
    if (reset)
        cnt <= 0;
    else if (enable) begin

            cnt <= (cnt + STEP) % MODULE;
    end
end
endmodule
