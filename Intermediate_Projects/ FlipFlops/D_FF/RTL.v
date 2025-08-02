
module d_flip_flop (
    input wire clk,
    input wire rst,    
    input wire d,        // D input
    output reg q,        // Main output
    output wire q_bar    // Complement output
);

    
    always @(posedge clk) begin
        if (rst)
            q <= 1'b0;
        else
            q <= d;
    end

    assign q_bar = ~q; // Complement of q

endmodule
