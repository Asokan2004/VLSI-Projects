
`timescale 1ns/1ps
module tb_jk_from_d;

    reg clk, rst, j, k;
    wire q, q_bar;

    // DUT
    jk_from_d dut (
        .clk(clk),
        .rst(rst),
        .j(j),
        .k(k),
        .q(q),
        .q_bar(q_bar)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $display("Time\tclk\trst\tJ\tK\tQ\tQ_bar");
        $monitor("%0dns\t%b\t%b\t%b\t%b\t%b\t%b",$time, clk, rst, j, k, q, q_bar);
        // Reset
        rst = 1; j = 0; k = 0; #10;
        rst = 0;

        // Test all JK conditions
        j = 0; k = 0; #10; // No change
        j = 1; k = 0; #10; // Set
        j = 0; k = 0; #10; // No change
        j = 0; k = 1; #10; // Reset
        j = 1; k = 1; #10; // Toggle
        #10;

        $finish;
    end

endmodule
