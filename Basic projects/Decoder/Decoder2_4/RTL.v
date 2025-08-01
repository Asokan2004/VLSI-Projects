module decoder_2to4 (
  input  wire [1:0] in,    // 2-bit input
  input  wire       en,    // Enable signal
  output reg  [3:0] out    // Output must be reg
);

always @(*) begin
  if (en)
    out <= 4'b0001 << in;  // Decoder active when enabled
  else
    out <= 4'b0000;        // All outputs OFF when disabled
end

endmodule
