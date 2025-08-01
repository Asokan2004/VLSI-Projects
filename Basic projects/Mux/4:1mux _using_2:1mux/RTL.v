module mux2to1 (
    input wire a,
    input wire b,
    input wire sel,
    output wire y
);
    assign y = sel ? b : a;
endmodule


module mux4to1_using_2to1 (
    input wire i0, i1, i2, i3,
    input wire [1:0] sel,
    output wire y
);

    wire y0, y1;

    // First level: select between i0 and i1; i2 and i3
    mux2to1 m1 (.a(i0), .b(i1), .sel(sel[0]), .y(y0));
    mux2to1 m2 (.a(i2), .b(i3), .sel(sel[0]), .y(y1));

    // Second level: select between y0 and y1
    mux2to1 m3 (.a(y0), .b(y1), .sel(sel[1]), .y(y));

endmodule
