module tb_encoder_4to2;
    reg  [3:0] d;
    wire [1:0] y;

    encoder_4to2 dut (
        .d(d),
        .y(y)
    );

    initial begin
        $display("Time\tInput\tOutput");
        $monitor("%0t\t%b\t%b", $time, d, y);

        d = 4'b0001; #10;
        d = 4'b0010; #10;
        d = 4'b0100; #10;
        d = 4'b1000; #10;
        d = 4'b0000; #10;  // No input high
        d = 4'b1100; #10;  // Invalid (multiple inputs high)
        $finish;
    end
endmodule
