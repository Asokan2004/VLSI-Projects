module t_flip_flop (
    input wire clk,
    input wire rst,       
    input wire t,         // Toggle input
    output reg q,         // Main output
    output wire q_bar     // Complement output
);

   
    always @(posedge clk ) begin
        if (rst)
            q <= 1'b0;
        else if (t)
            q <= ~q;  // Toggle when T = 1
        else
            q <= q;   // Hold when T = 0
    end

    assign q_bar = ~q;

endmodule
