module tb_decoder_3to8;

    reg [2:0] in;
    reg       en;
    wire [7:0] out;

    // Instantiate the decoder module
    decoder_3to8 uut (
        .in(in),
        .en(en),
        .out(out)
    );

    initial begin
        $monitor("Time = %0t | Enable = %b | Input = %b | Output = %b", $time, en, in, out);

        // Enable active (en = 0)
        en = 0;
        in = 3'b000; #10;
        in = 3'b001; #10;
        in = 3'b010; #10;
        in = 3'b011; #10;
        in = 3'b100; #10;
        in = 3'b101; #10;
        in = 3'b110; #10;
        in = 3'b111; #10;

        // Enable disabled (en = 1) - output should be 00000000
        en = 1;
        in = 3'b000; #10;
        in = 3'b011; #10;
        in = 3'b111; #10;

        $finish;
    end

endmodule
