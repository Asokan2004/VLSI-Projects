module mux4_to_1 (
    input [3:0] i,
    input [1:0] sel,
    output y
);
    assign y = (sel == 2'b00) ? i[0] :
               (sel == 2'b01) ? i[1] :
               (sel == 2'b10) ? i[2] :
                                i[3];
endmodule


module mux16_to_1 (
    input [15:0] i,
    input [3:0] sel,
    output y
);
    wire [3:0] w;

    // 4 MUXes at level 1
    mux4_to_1 m0 (.i(i[3:0]),   .sel(sel[1:0]), .y(w[0]));
    mux4_to_1 m1 (.i(i[7:4]),   .sel(sel[1:0]), .y(w[1]));
    mux4_to_1 m2 (.i(i[11:8]),  .sel(sel[1:0]), .y(w[2]));
    mux4_to_1 m3 (.i(i[15:12]), .sel(sel[1:0]), .y(w[3]));

    // 1 MUX at level 2
    mux4_to_1 m4 (.i(w), .sel(sel[3:2]), .y(y));
endmodule
