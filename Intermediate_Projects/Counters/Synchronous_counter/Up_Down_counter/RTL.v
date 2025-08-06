module sync_updown_counter_TFF (
    input clk,
    input rst,
    input up_down,        // 1 = up, 0 = down
    output reg [3:0] q
);

    wire [3:0] t;         // T inputs for each FF

    // Toggling logic for UP and DOWN combined using up_down signal
    assign t[0] = 1'b1; // Always toggles

    assign t[1] = up_down ? q[0]           : ~q[0];
    assign t[2] = up_down ? (q[1] & q[0])  : ~(q[1] | q[0]);
    assign t[3] = up_down ? (q[2] & q[1] & q[0]) : ~(q[2] | q[1] | q[0]);

    // Synchronous process with active-high async reset
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 4'b0000;
        else begin
            if (t[0]) q[0] <= ~q[0];
            if (t[1]) q[1] <= ~q[1];
            if (t[2]) q[2] <= ~q[2];
            if (t[3]) q[3] <= ~q[3];
        end
    end

endmodule
