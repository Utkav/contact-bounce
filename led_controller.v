`timescale 1ns / 1ps
module led_controller(
    input button_in, clk,
    output reg led_out = 0);
wire out_signal_enable;
debouncer #(1'b1) dbnc(
    .clk(clk),
    .in_signal(button_in),
    .out_signal(),
    .out_signal_enable(out_signal_enable));
always@(posedge clk) begin
    if (out_signal_enable)
        led_out = ~led_out;
end
endmodule
