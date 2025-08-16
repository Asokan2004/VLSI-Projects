module FSM (
    input  wire clk,
    input  wire reset,
    input  wire in,
    output reg  out
);
    localparam S0 = 2'b00,  
               S1 = 2'b01, 
               S2 = 2'b10, 
               S3 = 2'b11;

    reg [1:0] state, next_state;
    // Sequential Block: state transition
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end
    always @(*) begin
        case (state)
            S0: next_state = (in) ? S1 : S0;   // got '1'
            S1: next_state = (in) ? S1 : S2;   // got '10'
            S2: next_state = (in) ? S3 : S0;   // got '101' if '1'
            S3: next_state = S0;               // Non-overlapping → always go back
            default: next_state = S0;
        endcase
    end
    // Output logic (Moore → depends only on state)
    always @(*) begin
        case (state)
            S3: out = 1'b1;   // Sequence 101 detected
       endcase
    end
endmodule
