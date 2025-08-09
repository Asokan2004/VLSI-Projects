`timescale 1ns/1ps
module tb_tff_using_dff;

    reg clk;
    reg rst;
    reg T;
    wire Q;
    tff_using_dff dut (
        .clk(clk),
        .rst(rst),
        .t(t),
        .Q(Q)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    initial begin
        $monitor("Time=%0dns | clk=%b rst=%b T=%b Q=%b", $time, clk, rst, T, Q);
        clk = 0; rst = 1; t = 0; #10;
        rst = 0;
        t = 0; #10;
        t = 1; #10;
        t = 0; #10;
        t = 1; #10;
      $finish;
    end

endmodule
