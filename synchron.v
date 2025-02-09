`timescale 1ns / 1ps

module synchron(
    input wire in, wire clk,
    output reg out);
reg sync;
always@(posedge clk) begin
    sync <= in;
    out <= sync;
end
endmodule
