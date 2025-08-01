`timescale 1ns / 1ps

module tb_ripple_carry_adder;

    // Testbench variables
    reg  [3:0] a, b;
    reg        cin;
    wire [3:0] sum;
    wire       cout;

    // Instantiate the ripple carry adder
    ripple_carry_adder dut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        // Monitor the outputs
        $monitor("Time = %0d | A = %b | B = %b | Cin = %b || Sum = %b | Cout = %b",
                  $time, a, b, cin, sum, cout);

        // Test cases
        a = 4'b0000; b = 4'b0000; cin = 0; #10;
        a = 4'b0001; b = 4'b0001; cin = 0; #10;
        a = 4'b0010; b = 4'b0011; cin = 0; #10;
        a = 4'b0101; b = 4'b0110; cin = 0; #10;
        a = 4'b1001; b = 4'b0111; cin = 1; #10;
        a = 4'b1111; b = 4'b1111; cin = 0; #10;
        a = 4'b1111; b = 4'b0001; cin = 1; #10;

        $finish;  // End simulation
    end

endmodule
