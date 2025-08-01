`timescale 1ns / 1ps

module tb;

  // Inputs
  reg i0, i1, i2, i3;
  reg [1:0] sel;

  // Output
  wire y;

  // Instantiate the Unit Under Test (DUT)
  mux4_to_1 dut (
    .i0(i0),
    .i1(i1),
    .i2(i2),
    .i3(i3),
    .sel(sel),
    .y(y)
  );

  integer i;

  initial begin
    // Set initial input values (you can change this to test different scenarios)
    i0 = 1;
    i1 = 0;
    i2 = 1;
    i3 = 0;

    $display("Time\t sel \t i0 i1 i2 i3 \t => y");
    $monitor("%g\t %b \t  %b  %b  %b  %b  \t => %b", $time, sel, i0, i1, i2, i3, y);

    // Loop to test all selector combinations
    for (i = 0; i < 4; i = i + 1) begin
      sel = i[1:0];
      #10;  // Wait 10ns between each test
    end

    $finish;
  end

endmodule
