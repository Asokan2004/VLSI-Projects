module tb_async_up_down_counter;

reg clk, rst;
wire [2:0] q;

async_up_counter dut (
    .clk(clk),
    .rst(rst),
    .q(q)
);

// Generate clock
always #5 clk = ~clk;  // 10 ns period
initial begin
    clk = 0; rst = 1; up_down = 1;
    #5 rst = 0;

    // First test UP
    up_down = 1;
    #100;

    // Now test DOWN
    up_down = 0;
    #100;

    $finish;
end

always #5 clk = ~clk;  // 10ns clock period
