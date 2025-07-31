// testbench.v
`timescale 1ns/1ps

module testbench;
    reg A, B, Cin;
    wire SUM, Cout;

    full_adder_using_half_adder dut (
        .A(A), .B(B), .Cin(Cin), .SUM(SUM), .Cout(Cout)
    );

    initial begin
        $monitor("Time = %0t | A = %b B = %b Cin = %b || SUM = %b Cout = %b", 
                 $time, A, B, Cin, SUM, Cout);
        
        for (integer i = 0; i < 8; i = i + 1) begin
            {A, B, Cin} = i;
            #10;
        end

        $finish;
    end
endmodule
