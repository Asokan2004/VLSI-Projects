module tb_rca_16bit;
    reg  [15:0] a, b;
    reg         cin;
    wire [15:0] sum;
    wire        cout;

    rca_16bit DUT (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    initial begin
        a = 16'hAAAA; b = 16'h1111; cin = 0;
        #10;
        a = 16'h1234; b = 16'h4321; cin = 1;
        #10;
        $finish;
    end
endmodule
