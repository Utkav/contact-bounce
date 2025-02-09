`timescale 1ns / 1ps

module debouncer #(CLOCK_ENABLE = 1'b1)(
    input clk,
    input in_signal,
    output reg out_signal,
    output wire out_signal_enable
    );
wire [1:0] counter_res;
wire sync_signal;
synchron sync(.in(in_signal), .clk(clk), .out(sync_signal));
counter #(.MODULE(4), .STEP(1)) cntr(
    .clk(clk),
    .reset(sync_signal ~^ out_signal),
    .enable(CLOCK_ENABLE),
    .dir(1'b1),
    .cnt(counter_res));
always@(posedge clk) begin
    if (counter_res[0] & counter_res[1] & CLOCK_ENABLE)
       out_signal <= sync_signal;
end
assign out_signal_enable = sync_signal & counter_res[0] & counter_res[1] & CLOCK_ENABLE;
endmodule
