// File: sr_flip_flop.v
module sr_flip_flop (
    input wire clk,
    input wire rst,     // asynchronous active-high reset
    input wire s,       // Set input
    input wire r,       // Reset input
    output reg q,       // Main output
    output wire q_bar   // Complement output
);

    
    always @(posedge clk) begin
        if (rst)
            q <= 1'b0;
        else begin
            case ({s, r})
                2'b00: q <= q;       // No change
                2'b01: q <= 1'b0;    // Reset
                2'b10: q <= 1'b1;    // Set
                2'b11: q <= 1'bx;    // Invalid condition
            endcase
        end
    end

    assign q_bar = ~q;  // Complement of q

endmodule
