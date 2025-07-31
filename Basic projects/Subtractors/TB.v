module tb_half_subtractor;

reg a, b;
wire diff, borrow;

// Instantiate the DUT (Device Under Test)
half_subtractor dut (
    .a(a),
    .b(b),
    .diff(diff),
    .borrow(borrow)
);

integer i;

initial begin
    $display("Time\t a b | diff borrow");
    $monitor("%0t\t %b %b |  %b     %b", $time, a, b, diff, borrow);

    // Apply all 2-bit input combinations using a for loop
    for (i = 0; i < 4; i = i + 1) begin
        {a, b} = i;
        #10;
    end

    $finish;
end

endmodule
