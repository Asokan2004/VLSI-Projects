module sync_up_counter (
    input clk,
    input rst,
    output reg [2:0] q
);
    wire t0, t1, t2;

    assign t0 = 1'b1;
    assign t1 = q[0];
    assign t2 = q[0] & q[1];

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 3'b000;
        else begin
            if (t0)
                q[0] <= ~q[0];
            if (t1)
                q[1] <= ~q[1];
            if (t2)
                q[2] <= ~q[2];
        end
    end
endmodule
