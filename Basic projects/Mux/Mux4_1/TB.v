`timescale 1ns / 1ps

module tb;

  // Inputs
  reg [3:0] i;
  reg [1:0] sel;

  // Output
  wire y;

  // Instantiate the Unit Under Test (DUT)
  mux4_to_1 dut (
    .i(i),
    .sel(sel),
    .y(y)
  );
initial begin
  $display("Time\ti\tsel\ty");
  $monitor("%0dns\t%b\t%b\t%b",$time, i, sel, y);
  sel = 2'b00; i[0] = 1; #10;
  sel = 2'b01; i[1] = 0; #10;
  sel = 2'b10; i[2] = 1; #10;
  sel = 2'b11; i[3] = 1; #10;
  #20;
  
    $finish;
  end

endmodule
