`timescale 1ns / 1ps

module tb_johnson_counter;

  reg clk;
  reg rst;
  wire [2:0] q;

  // Instantiate the DUT
  johnson_counter dut (
    .clk(clk),
    .rst(rst),
    .q(q)
  );

  always #5 clk = ~clk;

  initial begin
    $display("Time\tclk\trst\tq");
    $monitor("%0dns\t%b\t%b\t%b\t%d", $time, clk, rst, q,);
    clk = 0;
    rst = 1;
    #10;

    rst = 0;    
    #100;
    $finish;
  end

endmodule
