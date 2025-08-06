module async_up_down_counter (
    input clk,       // Base clock input
    input rst,       // Asynchronous reset
    input up_down,   // Control: 1 = UP, 0 = DOWN
    output [2:0] q   // 3-bit counter output
);

    wire clk1, clk2;

    // FF0 toggles on main clk
    t_ff ff0 (
        .clk(clk),
        .rst(rst),
        .t(1'b1),
        .q(q[0])
    );

    // FF1 toggles on either q[0] or ~q[0] based on up_down
    assign clk1 = up_down ? ~q[0] : q[0];
    t_ff ff1 (
        .clk(clk1),
        .rst(rst),
        .t(1'b1),
        .q(q[1])
    );

    // FF2 toggles on either q[1] or ~q[1] based on up_down
    assign clk2 = up_down ? ~q[1] : q[1];
    t_ff ff2 (
        .clk(clk2),
        .rst(rst),
        .t(1'b1),
        .q(q[2])
    );

endmodule

// Reusable T Flip-Flop Module (positive-edge triggered)
module t_ff (
    input clk,
    input rst,
    input t,
    output reg q
);
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 0;
        else if (t)
            q <= ~q;
    end
endmodule
