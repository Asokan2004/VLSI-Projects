// logic for full_adder
module full_adder (
    input  A, B, Cin,
    output Sum, Cout
);
    assign Sum  = A ^ B ^ Cin;
    assign Cout = (A & B) | (B & Cin) | (A & Cin);
endmodule

// Logic for ripple_carry_adder

module ripple_carry_adder(
    input  [3:0] a, b,
    input        cin,
    output [3:0] sum,
    output       cout
);
    wire c1, c2, c3;

    full_adder FA1(a[0], b[0], cin,  sum[0], c1);
    full_adder FA2(a[1], b[1], c1,   sum[1], c2);
    full_adder FA3(a[2], b[2], c2,   sum[2], c3);
    full_adder FA4(a[3], b[3], c3,   sum[3], cout);
endmodule
