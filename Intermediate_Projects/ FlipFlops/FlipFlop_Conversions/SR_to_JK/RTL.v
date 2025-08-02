
module jk_from_sr (
    input wire clk,
    input wire rst,   
    input wire j,
    input wire k,
    output reg q,
    output wire q_bar
);

    wire s, r;

    // Logic to convert JK to SR
    assign s = j & ~q;
    assign r = k & q;

    // SR Flip-Flop behavior
    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;
        else begin
            case ({s, r})
                2'b00: q <= q;       // No change
                2'b01: q <= 1'b0;    // Reset
                2'b10: q <= 1'b1;    // Set
                2'b11: q <= 1'bx;    // Invalid
            endcase
        end
    end

    assign q_bar = ~q;

endmodule
