module tb_half_adder;

reg a, b;
wire sum, carry;

// DUT
half_adder dut (
    .a(a),
    .b(b),
    .sum(sum),
    .carry(carry)
);

integer i;

initial begin
    $display("Time\t a b | sum carry");
    $monitor("%0t\t %b %b |  %b    %b", $time, a, b, sum, carry);

    for (i = 0; i < 4; i = i + 1) begin
        {a, b} = i;
        #10;
    end

    $finish;
end

endmodule
