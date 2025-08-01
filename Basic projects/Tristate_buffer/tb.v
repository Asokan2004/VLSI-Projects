`timescale 1ns / 1ps

module tb_tristate_buffer;

  // Testbench signals
  reg data_in;
  reg enable;
  wire data_out;

  // Instantiate the DUT (Design Under Test)
  tristate_buffer dut (
    .data_in(data_in),
    .enable(enable),
    .data_out(data_out)
  );

  initial begin
    // Start simulation
    $display("Time\tEnable\tData_in\tData_out");
    $monitor("%0t\t%b\t%b\t%b", $time, enable, data_in, data_out);

    // Case 1: enable = 1, data_in = 1 => data_out = 1
    enable = 1; data_in = 1; #10;

    // Case 2: enable = 1, data_in = 0 => data_out = 0
    enable = 1; data_in = 0; #10;

    // Case 3: enable = 0, data_in = 1 => data_out = z (high impedance)
    enable = 0; data_in = 1; #10;

    // Case 4: enable = 0, data_in = 0 => data_out = z
    enable = 0; data_in = 0; #10;

    $finish;
  end

endmodule
