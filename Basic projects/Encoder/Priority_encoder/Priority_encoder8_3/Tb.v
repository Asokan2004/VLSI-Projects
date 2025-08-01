`timescale 1ns/1ps

module tb_priority_encoder_8to3;

    reg [7:0] i;
    wire [2:0] out;
    wire valid;

    // DUT
    priority_encoder_8to3 dut (
        .i(i),
        .out(out),
        .valid(valid)
    );

    initial begin
        $display("Time\t\t i\t out\tvalid");

        i = 8'b00000000; #10;
        $display("%0t\t%b\t%b\t%b", $time, i, out, valid);

        i = 8'b00000001; #10;
        $display("%0t\t%b\t%b\t%b", $time, i, out, valid);

        i = 8'b00001000; #10;
        $display("%0t\t%b\t%b\t%b", $time, i, out, valid);

        i = 8'b00000100; #10;
        $display("%0t\t%b\t%b\t%b", $time, i, out, valid);

        i = 8'b00111110; #10;
        $display("%0t\t%b\t%b\t%b", $time, i, out, valid);

        i = 8'b00000010; #10;
        $display("%0t\t%b\t%b\t%b", $time, i, out, valid);

        #20;
        $finish;
    end

endmodule
