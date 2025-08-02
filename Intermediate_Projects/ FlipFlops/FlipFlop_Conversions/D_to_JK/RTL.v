
module jk_from_d (
    input wire clk,
    input wire rst,    
    input wire j,
    input wire k,
    output reg q,
    output wire q_bar
);

    wire d;

    // Logic to convert JK to D
    assign d = (j & ~q) | (~k & q);

    // D Flip-Flop behavior
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;
        else
            q <= d;
    end

    assign q_bar = ~q;

endmodule
