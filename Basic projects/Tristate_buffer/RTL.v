module tristate_buffer_4bit (
  input  wire [3:0] data_in,
  input  wire       enable,
  output wire [3:0] data_out
);

assign data_out = enable ? data_in : 4'bz;

endmodule
