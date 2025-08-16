`timescale 1ns/1ps
module tb_moore_101_nonoverlap;
    reg clk, reset, in;
    wire out;
    moore_101_nonoverlap dut (
        .clk(clk),
        .reset(reset),
        .in(in),
        .out(out)
    );
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end

    // Task: Initialize
    task initialize;
    begin
        in = 0;
        reset = 1;
        #10 reset = 0;   // release reset after 10ns
    end
    endtask

    // Task: Apply stimulus (sequence 1101011010110101)
    task apply_sequence;
        reg [15:0] seq;  
        integer i;
    begin
        seq = 16'b1101011010110101;  // input sequence
        for (i = 15; i >= 0; i = i - 1) begin
            in = seq[i];
            #10;  // wait for one clock cycle
        end
    end
    endtask
    initial begin
        $monitor("Time=%0t | clk=%b reset=%b in=%b | state_out=%b",
                  $time, clk, reset, in, out);
    end
    initial begin
        initialize;
        apply_sequence;
        #50 $finish;
    end

endmodule
