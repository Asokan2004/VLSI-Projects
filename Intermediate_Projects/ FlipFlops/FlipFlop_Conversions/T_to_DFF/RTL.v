module tff_using_dff (
    input wire clk,
    input wire rst,
    input wire t,
    output reg q,
    output wire qb
);
    wire d;
    assign d = t ^ q;
    always @(posedge clk) begin
        if (rst)
            q <= 1'b0; 
        else
            q <= d;  
    end
  assign qb = ~q;

endmodule
