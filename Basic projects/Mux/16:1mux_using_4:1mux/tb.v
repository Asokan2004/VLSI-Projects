`timescale 1ns / 1ps

module tb_mux16_to_1;

    reg [15:0] i;
    reg [3:0] sel;
    wire y;

    // Instantiate the DUT
    mux16_to_1 dut (
        .i(i),
        .sel(sel),
        .y(y)
    );

    integer k;

    initial begin
        // Initialize all inputs
        i = 16'b0001_0010_0100_1000;  // example pattern for clarity
        $display("Time\t sel \t y");
        $monitor("%0t\t %b\t %b", $time, sel, y);

        for (k = 0; k < 16; k = k + 1) begin
            sel = k;
            #10;
        end

        $finish;
    end

endmodule
