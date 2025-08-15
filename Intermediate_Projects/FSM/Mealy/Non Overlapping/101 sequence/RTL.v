module fsm (
    input  wire clk,        
    input  wire reset,        
    input  wire data_in,    
    output reg  seq_detected  // Output high when "101" is detected
);
    localparam [1:0]
        S0 = 2'b00,  
        S1 = 2'b01,  
        S2 = 2'b10; 
    reg [1:0] current_state, next_state;
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end
    always @(*) begin
        next_state   = current_state;
        seq_detected = 1'b0;
        case (current_state)
            S0: begin
                if (data_in)
                    next_state = S1;
            end

            S1: begin
                if (!data_in)
                    next_state = S2;
                else
                    next_state = S1;
            end

            S2: begin
                if (data_in) begin
                    seq_detected = 1'b1;
                    next_state   = S0;  
                end else
                    next_state = S0;
            end

            default: next_state = S0;
        endcase
    end

endmodule
