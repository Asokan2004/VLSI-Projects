module tb_vending;

    reg clk, rst;
    reg [1:0] coin;
    wire p, r;

    vending_machine dut(clk, rst, coin, p, r);

    // Clock
    always #5 clk = ~clk;

    initial begin
        clk=0; rst=1; coin=0;
        #10 rst=0;

        // Case 1: 1 + 2 = 3 (Expect p=1, r=0)
        #10 coin=2'b01;   // +1
        #10 coin=2'b10;   // +2
        #10 coin=0;

        // Case 2: 2 + 2 = 4 (Expect p=1, r=1)
        #20 coin=2'b10;   // +2
        #10 coin=2'b10;   // +2 again
        #10 coin=0;

        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t, coin=%b, p=%b, r=%b, state=%d",
                  $time, coin, p, r);
    end

endmodule
