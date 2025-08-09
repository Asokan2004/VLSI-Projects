
module jk_from_d (
    input wire clk,
    input wire rst,    
    input wire j,
    input wire k,
    output reg q,
    output wire q_bar
);
    wire d;
    assign d = (j & ~q) | (~k & q);
    always @(posedge clk) begin
        if (rst)
            q <= 1'b0;
        else
            q <= d;
    end

    assign q_bar = ~q;

endmodule
