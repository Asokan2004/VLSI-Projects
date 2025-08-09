
module jk_flip_flop (
    input wire clk,
    input wire rst,    
    input wire [1:0]in,  
    output reg q,    
    output wire q_bar   
);
parameter HOLD   = 2'b00;
parameter RESET  = 2'b01;
parameter SET    = 2'b10;
parameter TOGGLE = 2'b11;
    always @(posedge clk) begin
        if (rst)
            q <= 1'b0;
        else begin
            case (in)
                HOLD  : q <= q;          
                RESET : q <= 1'b0;  
                SET   : q <= 1'b1;      
                TOGGLE: q <= ~q;       
            endcase
        end
    end

    assign q_bar = ~q; 
endmodule
