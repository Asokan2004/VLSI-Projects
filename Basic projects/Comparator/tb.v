`timescale 1ns/1ps

module tb_comparator_4bit;

  // Test signals
  reg [3:0] A, B;
  wire A_gt_B, A_eq_B, A_lt_B;

  // Instantiate the DUT
  comparator_4bit dut (
    .A(A),
    .B(B),
    .A_gt_B(A_gt_B),
    .A_eq_B(A_eq_B),
    .A_lt_B(A_lt_B)
  );

  initial begin
    // Monitor signal values
    $monitor("Time = %0t | A = %b, B = %b => A_gt_B = %b, A_eq_B = %b, A_lt_B = %b",
             $time, A, B, A_gt_B, A_eq_B, A_lt_B);

    // Test Cases
    A = 4'b0000; B = 4'b0000; #10;  // A == B
    A = 4'b0001; B = 4'b0011; #10;  // A < B
    A = 4'b0010; B = 4'b0001; #10;  // A > B
    A = 4'b0011; B = 4'b0011; #10;  // A == B

    $finish;
  end

endmodule
