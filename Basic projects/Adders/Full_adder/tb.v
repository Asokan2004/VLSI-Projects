module tb_full_adder;

reg a, b, cin;
wire sum, carry;

// Instantiate the Full Adder module
full_adder dut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .carry(carry)
);

integer i;

initial begin
    $display("Time\t a b cin | sum carry");
    $monitor("%0t\t %b %b  %b  |  %b    %b", $time, a, b, cin, sum, carry);

    for (i = 0; i < 8; i = i + 1) begin
        {a, b, cin} = i;
        #10;  // Delay to observe the waveform
    end

    $finish;
end

endmodule
