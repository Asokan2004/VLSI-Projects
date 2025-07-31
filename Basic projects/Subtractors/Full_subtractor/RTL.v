module full_subtractor (
    input a,
    input b,
    input bin,         // Borrow in
    output diff,
    output bout        // Borrow out
);

// Logic equations
assign diff = a ^ b ^ bin;
assign bout = (~a & b) | (~(a ^ b) & bin);

endmodule
