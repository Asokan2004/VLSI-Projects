
`timescale 1ns/1ps
module tb_d_flip_flop;

    reg clk, rst, d;
    wire q, q_bar;

    // Instantiate DUT
    d_flip_flop dut (
        .clk(clk),
        .rst(rst),
        .d(d),
        .q(q),
        .q_bar(q_bar)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;  // Clock period = 10ns

    initial begin
        
        $display("Time\tclk\trst\tD\tQ\tQ_bar");
        $monitor("%0dns\t%b\t%b\t%b\t%b\t%b", $time, clk, rst, d, q, q_bar);

        // Initial Reset
        rst = 1; d = 0; #10;
        rst = 0;

        // Apply D = 1
        d = 1; #10;

        // Apply D = 0
        d = 0; #10;

        // Apply D = 1 again
        d = 1; #10;

        // Apply D = 1 again (No change)
        d = 1; #10;

        // Apply D = 0
        d = 0; #10;

      
        $finish;
    end

endmodule
