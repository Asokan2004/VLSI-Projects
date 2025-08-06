`timescale 1ns/1ps

module tb_sync_updown_counter_TFF;

    reg clk;
    reg rst;
    reg up_down;
    wire [3:0] q;

    // Instantiate the DUT
    sync_updown_counter_TFF dut (
        .clk(clk),
        .rst(rst),
        .up_down(up_down),
        .q(q)
    );

    // Clock generation: 10ns period (100MHz)
    always #5 clk = ~clk;

    initial begin
        // Initial values
        clk = 0;
        rst = 1;
        up_down = 1'b1; // Start with up count

        // Reset pulse
        #10 rst = 0;

        // Count UP for 100ns
        up_down = 1;
        #100;

        // Count DOWN for next 100ns
        up_down = 0;
        #100;

        // Finish simulation
        $finish;
    end

    // Monitor values
    initial begin
        $monitor("Time=%0t | Reset=%b | UP/DOWN=%b | Counter=%b", $time, rst, up_down, q);
    end

endmodule
