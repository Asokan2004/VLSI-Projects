`timescale 1ns/1ps
module tb_sr_flip_flop;

    reg clk, rst, s, r;
    wire q, q_bar;

    // Instantiate the design under test (DUT)
    sr_flip_flop dut (
        .clk(clk),
        .rst(rst),
        .s(s),
        .r(r),
        .q(q),
        .q_bar(q_bar)
    );

    // Clock generation: 10ns period
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
      $display("time\tclk\trst\ts\tr\tq\tq_bar");
      $monitor("%0dns\t%b\t%b\t%b\t%b\t%b\t%b",$time, clk, rst, s, r, q, q_bar);
        // Test sequence
        rst = 1; s = 0; r = 0;  #10;
        rst = 0;

        // Apply SR = 10 (Set)
        s = 1; r = 0; #10;

        // Apply SR = 00 (No change)
        s = 0; r = 0; #10;

        // Apply SR = 01 (Reset)
        s = 0; r = 1; #10;

        // Apply SR = 00 (No change)
        s = 0; r = 0; #10;

        // Apply SR = 11 (Invalid)
        s = 1; r = 1; #10;

        
        $finish;
    end

endmodule
