module full_adder (
    input a,
    input b,
    input cin,
    output sum,
    output carry
);

// Logic equations
assign sum = a ^ b ^ cin;
assign carry = (a & b) | (b & cin) | (a & cin);

endmodule
