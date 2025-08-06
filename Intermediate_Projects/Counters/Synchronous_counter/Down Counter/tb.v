module tb_sync_down_counter;
    reg clk, rst;
    wire [2:0] q;

    sync_down_counter dut (
        .clk(clk),
        .rst(rst),
        .q(q)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        $monitor("Time = %0t | rst = %b | q = %b", $time, rst, q);
        clk = 0;
        rst = 1;

        #10 rst = 0;   // Deassert reset
        #100 $finish;
    end
endmodule
