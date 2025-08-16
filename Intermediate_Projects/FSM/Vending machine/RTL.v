module vending_machine (
    input  wire       clk,   
    input  wire       rst,    
    input  wire [1:0] coin,    
    output reg        P,        
    output reg        R       
);

    localparam [2:0] 
        S0 = 3'b000,  // Rs.0
        S1 = 3'b001,  // Rs.1
        S2 = 3'b010,  // Rs.2
        S3 = 3'b011,  // Rs.3 -> Product
        S4 = 3'b100;  // Rs.4 -> Product + Change

    reg [2:0] state, next_state;
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= S0;
        else
            state <= next_state;
    end
    always @(*) begin
        case (state)
            S0: begin
                case (coin)
                    2'b01: next_state = S1;  // Rs.1
                    2'b10: next_state = S2;  // Rs.2
                    default: next_state = S0;
                endcase
            end

            S1: begin
                case (coin)
                    2'b01: next_state = S2;  // Rs.2
                    2'b10: next_state = S3;  // Rs.3 (dispense)
                    default: next_state = S1;
                endcase
            end

            S2: begin
                case (coin)
                    2'b01: next_state = S3;  // Rs.3 (dispense)
                    2'b10: next_state = S4;  // Rs.4 (dispense+change)
                    default: next_state = S2;
                endcase
            end

            S3: next_state = S0;  // dispense done → reset to S0
            S4: next_state = S0;  // dispense + change done → reset

            default: next_state = S0;
        endcase
    end
    always @(*) begin
        case (state)
            S3: begin
                P = 1'b1;  // Product only
                R = 1'b0;
            end
            S4: begin
                P = 1'b1;  // Product + Change
                R = 1'b1;
            end
            default: begin
                P = 1'b0;
                R = 1'b0;
            end
        endcase
    end

endmodule
