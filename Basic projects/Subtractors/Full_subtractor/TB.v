module tb_full_subtractor;

reg a, b, bin;
wire diff, bout;

// Instantiate the DUT
full_subtractor dut (
    .a(a),
    .b(b),
    .bin(bin),
    .diff(diff),
    .bout(bout)
);

integer i;

initial begin
    $display("Time\t a b bin | diff bout");
    $monitor("%0t\t %b %b  %b  |  %b    %b", $time, a, b, bin, diff, bout);

    // Loop over all 8 combinations (000 to 111)
    for (i = 0; i < 8; i = i + 1) begin
        {a, b, bin} = i;
        #10;
    end

    $finish;
end

endmodule
