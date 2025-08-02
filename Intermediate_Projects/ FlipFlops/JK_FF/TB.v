
`timescale 1ns/1ps
module tb_jk_flip_flop;

    reg clk, rst, j, k;
    wire q, q_bar;

    // Instantiate DUT
    jk_flip_flop dut (
        .clk(clk),
        .rst(rst),
        .j(j),
        .k(k),
        .q(q),
        .q_bar(q_bar)
    );

    // Clock generation: 10ns period
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $display("Time\tclk\trst\tJ\tK\tQ\tQ_bar");
        $monitor("%0dns\t%b\t%b\t%b\t%b\t%b\t%b", $time, clk, rst, j, k, q, q_bar);
        // Initial state
        rst = 1; j = 0; k = 0; #10;
        rst = 0;

        // J=0, K=0 (No change)
        j = 0; k = 0; #10;

        // J=1, K=0 (Set)
        j = 1; k = 0; #10; 
      
       // J=0, K=0 (No change)
        j = 0; k = 0; #10;

        // J=0, K=1 (Reset)
        j = 0; k = 1; #10;

        // J=1, K=1 (Toggle)
        j = 1; k = 1; #10;

        // Toggle again
        #10;

        $finish;
    end

endmodule
