
`timescale 1ns/1ps
module tb_t_flip_flop;

    reg clk, rst, t;
    wire q, q_bar;

    // Instantiate the DUT
    t_flip_flop dut (
        .clk(clk),
        .rst(rst),
        .t(t),
        .q(q),
        .q_bar(q_bar)
    );

    // Clock generation (10ns period)
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
       
        $display("Time\tclk\trst\tT\tQ\tQ_bar");
      $monitor("%0dns\t%b\t%b\t%b\t%b\t%b",  $time, clk, rst, t, q, q_bar);

        // Initial reset
        rst = 1; t = 0; #10;
        rst = 0;

        // T = 1 (toggle)
        t = 1; #10;

        // T = 1 (toggle again)
        t = 1; #10;

        // T = 0 (hold state)
        t = 0; #10;

        // T = 1 (toggle)
        t = 1; #10;

        // T = 0 (hold state)
        t = 0; #10;

        // T = 1 (toggle)
        t = 1; #10;

       
        $finish;
    end

endmodule
