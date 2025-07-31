// half_adder.v
module half_adder (
    input A,
    input B,
    output SUM,
    output CARRY
);
    assign SUM = A ^ B;
    assign CARRY = A & B;
endmodule


// full_adder_using_half_adder.v
module full_adder_using_half_adder (
    input A,
    input B,
    input Cin,
    output SUM,
    output Cout
);
    wire sum1, carry1, carry2;

    half_adder HA1 (.A(A), .B(B), .SUM(sum1), .CARRY(carry1));
    half_adder HA2 (.A(sum1), .B(Cin), .SUM(SUM), .CARRY(carry2));

    assign Cout = carry1 | carry2;
endmodule
