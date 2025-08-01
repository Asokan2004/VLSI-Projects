`timescale 1ns/1ps

module tb_priority_encoder;

    // Testbench signals
    reg  [3:0] D;
    wire [1:0] Y;
    wire       valid;

    // Instantiate the DUT (Device Under Test)
    priority_encoder dut (
        .D(D),
        .Y(Y),
        .valid(valid)
    );

    // Test procedure
    initial begin
        $display("Time\tD\tY\tvalid");
        $monitor("%0t\t%b\t%b\t%b", $time, D, Y, valid);

        // Test all input patterns (one hot and random)
        D = 4'b0000; #10;  // No valid input
        D = 4'b0001; #10;  // D0
        D = 4'b0010; #10;  // D1
        D = 4'b0100; #10;  // D2
        D = 4'b1000; #10;  // D3

        D = 4'b0011; #10;  // D1 > D0 → Y = 01
        D = 4'b0110; #10;  // D2 > D1 → Y = 10
        D = 4'b1111; #10;  // D3 is highest → Y = 11
        D = 4'b1001; #10;  // D3 > D0 → Y = 11
        D = 4'b0101; #10;  // D2 > D0 → Y = 10

        $finish;
    end

endmodule
