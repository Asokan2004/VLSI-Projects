module tb_sync_up_counter;
    reg clk, rst;
    wire [2:0] q;

    sync_up_counter dut (
        .clk(clk),
        .rst(rst),
        .q(q)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        $monitor("Time = %0t | rst = %b | q = %b", $time, rst, q);
        clk = 0;
        rst = 1;

        #10 rst = 0;
        #100 $finish;
    end
endmodule
