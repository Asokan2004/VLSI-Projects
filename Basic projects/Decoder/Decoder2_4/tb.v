`timescale 1ns / 1ps

module tb_decoder_2to4;

  // Declare testbench signals
  reg  [1:0] in;
  reg        en;
  wire [3:0] out;

  // Instantiate the decoder
  decoder_2to4 dut (
    .in(in),
    .en(en),
    .out(out)
  );

  // Apply stimulus
  initial begin
    $display("Time\t en  in  \t out");
    $monitor("%0dns\t %b   %b  \t %b", $time, en, in, out);

    // Step 1: Disable decoder
    en = 0; in = 2'b00; #10;
    in = 2'b01; #10;
    in = 2'b10; #10;
    in = 2'b11; #10;

    // Step 2: Enable decoder
    en = 1; in = 2'b00; #10;
    in = 2'b01; #10;
    in = 2'b10; #10;
    in = 2'b11; #10;

    $finish;
  end

endmodule
