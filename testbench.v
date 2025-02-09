`timescale 1ns / 1ps
module testbench;
    wire led;
    reg clk = 0;
    reg button = 0;
    wire out_signal, out_signal_enable;
    wire [1:0] counter_res;
    wire sync_signal;
    led_controller cntl(.button_in(button), .clk(clk), .led_out(led));
    debouncer dbc(
        .clk(clk),
        .in_signal(button),
        .out_signal(out_signal),
        .out_signal_enable(out_signal_enable)
    );
    assign counter_res = dbc.cntr.cnt;
    assign sync_signal = dbc.sync.out;
    
always #10 clk = ~clk;
initial begin
    #50 $srandom(130306);
    repeat(2) begin
        repeat($urandom_range(20,0)) begin
            button = $random;
            #3;
        end
        button = 1;
        #200;
    
        repeat($urandom_range(30,0)) begin
            button = $random;
            #3;
        end
        button = 0;
        #200;
    end
end
endmodule
